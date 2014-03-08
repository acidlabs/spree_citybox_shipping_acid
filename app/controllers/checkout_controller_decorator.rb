Spree::CheckoutController.class_eval do
  require_dependency "spree/citybox_helper"
  helper Spree::ShippingMethodHelper

  before_filter :ensure_citybox, :only => :update

  def ensure_citybox
    if @order.state == "address" 
      if params[:use_citybox] == "1"
        params[:order][:bill_address_attributes][:state_id] = Spree::State.find_by_name('Metropolitana').id
      end
    end
  end 

  def before_payment
    if @order.checkout_steps.include? "delivery"
      if @order.shipments.first.shipping_method.citybox? and @order.shipping_address.company.presence
        citybox_address = @order.shipping_address.company.split('//')
        if citybox_address.kind_of?(Array)
          @order.shipping_address.address1 = citybox_address[1].lstrip.rstrip
          @order.shipping_address.city     = citybox_address[2].lstrip.rstrip
          @order.shipping_address.phone    = @order.shipping_address.phone
          @order.billing_address.address1 = citybox_address[1].lstrip.rstrip
          @order.billing_address.city     = citybox_address[2].lstrip.rstrip
          @order.billing_address.phone    = @order.shipping_address.phone
          @order.billing_address = @order.shipping_address
          @order.save
        end
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
    return if params[:order].present?
    
    if @order.bill_address.address1 == 'dummy_address1' or @order.bill_address.city == 'dummy_city' or @order.bill_address.address2.include? "CityBox"
      @disable_all_except_citybox = true
    end

    packages = @order.shipments.map { |s| s.to_package }
    @differentiator = Spree::Stock::Differentiator.new(@order, packages)
  end
end