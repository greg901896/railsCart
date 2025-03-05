class Product < ApplicationRecord
    self.inheritance_column = :type  # **STI 預設使用 `type` 欄位**
    # validates :title, :price, presence: true
    has_many :productkeys, dependent: :destroy 
end
