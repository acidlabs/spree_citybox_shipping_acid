Spree::Order.class_eval do
  has_one :citybox_order

  def finalize!
	  touch :completed_at

	  # lock all adjustments (coupon promotions, etc.)
	  adjustments.update_all state: 'closed'

	  # update payment and shipment(s) states, and save
	  updater.update_payment_state
	  shipments.each do |shipment|
	    shipment.update!(self)
	    shipment.finalize!
	  end

	  updater.update_shipment_state
	  save
	  updater.run_hooks
    if self.shipments.first.shipping_method.citybox?
      insert_citybox(self)
    end

	  deliver_order_confirmation_email
	end

  def insert_citybox(order)
    citybox = Spree::CityboxOrder.create(
      :customer_name    => "#{order.shipping_address.firstname} #{order.shipping_address.lastname}",
      :citybox_location => order.shipping_address.address2.split("//").first.lstrip,
      :city             => order.shipping_address.city,
      :country          => order.shipping_address.country.name,
      :product          => "21",
      :size             => "P",
      :package          => true,
      :order            => order,
      :content          => "Artículos de vestuario",
      :total            => order.total.to_i,
      :kilogram         => 0,
      :volume           => 0,
      :ship_address     => nil,
      :ship_city        => nil,
      :email            => order.user.email,
      :phone            => order.shipping_address.phone
      )
  end
end