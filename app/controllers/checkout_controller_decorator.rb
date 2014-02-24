Spree::CheckoutController.class_eval do
  require_dependency "spree/citybox_helper"
  helper Spree::ShippingMethodHelper

  def before_payment
    if @order.checkout_steps.include? "delivery"
      if @order.shipments.first.shipping_method.citybox?
      	citybox_address = @order.shipping_address.address2.split('//')
      	@order.shipping_address.address1 = citybox_address[1].lstrip.rstrip
      	@order.shipping_address.city     = citybox_address[2].lstrip.rstrip
      	@order.shipping_address.phone    = @order.shipping_address.alternative_phone
      	@order.billing_address = @order.shipping_address
      	@order.save
      end 

      packages = @order.shipments.map { |s| s.to_package }
      @differentiator = Spree::Stock::Differentiator.new(@order, packages)
      @differentiator.missing.each do |variant, quantity|
        @order.contents.remove(variant, quantity)
      end
    end
  end
end