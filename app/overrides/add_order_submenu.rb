Deface::Override.new(:virtual_path => 'spree/admin/orders/index',
                     :name => 'add_order_submenu_to_index',
                     :insert_before => "erb[silent]:contains('content_for :table_filter_title')",
                     :text => "
                        <%= render :partial => 'spree/admin/shared/order_submenu' %>
                      "
                    )

Deface::Override.new(:virtual_path => 'spree/admin/orders/edit',
                     :name => 'add_order_submenu_to_edit',
                     :insert_before => "erb[loud]:contains('spree/admin/shared/order_tabs')",
                     :text => "
                        <%= render :partial => 'spree/admin/shared/order_submenu' %>
                      "
                    )