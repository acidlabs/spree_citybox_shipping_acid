(function($) {
  $(document).ready(function(){
    $("#checkout_form_delivery").submit(function(){
      set_address_citybox($("#citybox_locations").val());
    });
  });

  function set_address_dummy(state_id){
  	$("#order_bill_address_attributes_address1").val('dummy_address1');
  	$("#order_bill_address_attributes_city").val('dummy_city');
  	$("#order_bill_address_attributes_state_id").val(state_id);
  	$("#order_bill_address_attributes_zipcode").val('8320000');
  }

  function set_address_citybox(address){
    $("#order_ship_address_attributes_address2").val(address);
  }
  
})(jQuery);
