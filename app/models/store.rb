class Store < ApplicationRecord
    belongs_to :user, optional: true
    has_many :products
    has_many :products, through: :ware_houses

end
