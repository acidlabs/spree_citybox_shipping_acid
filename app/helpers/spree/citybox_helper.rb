module Spree::ShippingMethodHelper
  def citybox_field
    options = []
    url = "http://api-cl.easypack24.net/?do=listmachines_xml"
    xml = Nokogiri::XML(open(url))
    xml.css('machine').each do |machine|
      options << ["#{machine.css('locationdescription').inner_text}", "#{machine.css('locationdescription').inner_text} // #{machine.css('street').inner_text} #{machine.css('buildingnumber').inner_text} // #{machine.css('province').inner_text}"]
    end  

    content_tag("select", options_for_select(options), id: 'citybox_locations')
  end
end