class Order
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :zip, :prefecture_id, :city, :house_number, :building_name, :phone_number

  with_options presence: true do
    validates :token
    validates :user_id
    validates :item_id
    validates :zip, format: { with: /\A\d{3}-\d{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'of characters is 10 to 11 and not include hyphen(-)' }
  end

  def save
    record = Record.create(user_id: user_id, item_id: item_id)
    Address.create(zip: zip, prefecture_id: prefecture_id, city: city, house_number: house_number, phone_number: phone_number,
                   building_name: building_name, record_id: record.id)
  end
end
