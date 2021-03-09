class Address < ApplicationRecord
  belongs_to :user, optional: true

  with_options presence: true do
    validates :postcode
    validates :prefecture_code
    validates :city
    validates :street
  end

  include JpPrefecture
  jp_prefecture :prefecture_code

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_code).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_code = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end

end
