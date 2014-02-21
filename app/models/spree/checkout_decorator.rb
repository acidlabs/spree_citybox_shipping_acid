Spree::Order::Checkout.class_eval do
  def update_from_params(params, permitted_params)
  	pp params
  	raise
    success = false
    @updating_params = params
    run_callbacks :updating_from_params do
      attributes = @updating_params[:order] ? @updating_params[:order].permit(permitted_params) : {}
      success = self.update_attributes(attributes)
    end
    @updating_params = nil
    success
  end
end