(function($) {
  $(document).ready(function(){
    $("#checkout_form_delivery").submit(function(){
      set_address_citybox($("#citybox_locations").val());
    });

    $("#use_citybox").change(function(){
      if(this.is(':checked')){
        set_address_dummy();
      } else {
        remove_address_dummy();
      }
    });

    if ($("#use_citybox").is(':checked')){
      set_address_dummy();
    } else {
      remove_address_dummy();
    }

    function remove_address_dummy(){
      if ($("#order_bill_address_attributes_address1").val() == 'dummy_address1'){
        $("#order_bill_address_attributes_address1").val('');
      }
        
      if ($("#order_bill_address_attributes_city").val() == 'dummy_city'){
        $("#order_bill_address_attributes_city").val('');
      }
              
      $(".citybox_hidden").show();
    }

    function set_address_citybox(address){
      $("#order_ship_address_attributes_company").val(address);
    }

    function set_address_dummy(){
      $(".citybox_hidden").hide();
      $("#order_bill_address_attributes_address1").val('dummy_address1');
      $("#order_bill_address_attributes_city").val('dummy_city');
      $("#order_bill_address_attributes_zipcode").val('8320000'); // Postal Code Santiago
    }
  });  
  
})(jQuery);
