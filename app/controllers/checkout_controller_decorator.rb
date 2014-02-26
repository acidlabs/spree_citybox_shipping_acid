Spree::CheckoutController.class_eval do
  require_dependency "spree/citybox_helper"
  helper Spree::ShippingMethodHelper

  def before_payment
    if @order.checkout_steps.include? "delivery"
      if @order.shipments.first.shipping_method.citybox?
      	citybox_address = @order.shipping_address.address2.split('//')
      	@order.shipping_address.address1 = citybox_address[1].lstrip.rstrip
      	@order.shipping_address.city     = citybox_address[2].lstrip.rstrip
      	@order.shipping_address.phone    = @order.shipping_address.phone
        @order.billing_address.address1 = citybox_address[1].lstrip.rstrip
        @order.billing_address.city     = citybox_address[2].lstrip.rstrip
        @order.billing_address.phone    = @order.shipping_address.phone
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

  # Check if bill_address has dummy data (citybox indicator), if true, disable, hide, or remove chilexpress shipment
  def before_delivery
    if @order.bill_address.address1 == 'dummy_address1' and @order.bill_address.city == 'dummy_city'
      @order.shipping_method_id = Spree::ShippingMethod.find_by_name('Citybox Santiago').id
      @order.save
      @disable_all_except_citybox = true
    end
  end
end