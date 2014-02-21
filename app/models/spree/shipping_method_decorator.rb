Spree::ShippingMethod.class_eval do
  def citybox?
    admin_name == 'citybox'
  end
end