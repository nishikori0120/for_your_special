class Address < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :postcode
    validates :prefecture
    validates :city
    validates :street
    validates :building
  end
end
