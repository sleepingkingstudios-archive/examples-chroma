# app/models/color.rb

class Color
  include Mongoid::Document

  field :red,   :type => Integer
  field :green, :type => Integer
  field :blue,  :type => Integer

  validates :red, :green, :blue,
    :presence => true,
    :numericality => {
      :greater_than_or_equal_to => 0,
      :less_than_or_equal_to    => 255,
      :only_integer             => true,
      :unless                   => ->(record) { record.red.blank? }
    } # end numericality
end # model
