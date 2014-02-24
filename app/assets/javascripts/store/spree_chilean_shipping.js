(function($) {
  $(document).ready(function(){
    $("#checkout_form_delivery").submit(function(){
      set_address_citybox($("#citybox_locations").val());
    });
  });

  function set_address_citybox(address){
    $("#order_ship_address_attributes_address2").val(address);
  }
  
})(jQuery);
