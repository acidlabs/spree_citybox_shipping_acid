Spree::CheckoutController.class_eval do
  require_dependency "spree/citybox_helper"
  helper Spree::ShippingMethodHelper
end