class DigitalProduct < Product
    validates :url, presence: true  # ✅ 確保電子商品有下載連結
  end
  