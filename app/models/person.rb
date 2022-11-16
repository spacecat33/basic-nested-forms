class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses

  # the above method auto created the below method. Recommend writing out the below and not using the above shortcut:
  # def addresses_attributes=(addresses_attributes) #Magic of nested forms
  #   addresses_attributes.each do |address_attributes|
  #     self. addresses.build(address_attributes)
  #   end
  # end
end
