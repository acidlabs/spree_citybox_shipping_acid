module Spree
  class CityboxOrder < ActiveRecord::Base
    belongs_to :order
  end
end
