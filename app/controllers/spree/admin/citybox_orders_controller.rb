module Spree
  module Admin
    class CityboxOrdersController < ResourceController
      def index
        @collection = Spree::CityboxOrder.all
      end
    end
  end
end