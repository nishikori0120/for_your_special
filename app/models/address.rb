class Address < ApplicationRecord
  belongs_to :user,  optional: true
  belongs_to :order, optional: true

  with_options presence: true do
    validates :postcode
    validates :city
    validates :street
    validates :prefecture
  end


  include JpPrefecture
  jp_prefecture :prefecture, method_name: :pref

  def prefecture_name
    JpPrefecture::Prefecture.find(name: prefecture).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
