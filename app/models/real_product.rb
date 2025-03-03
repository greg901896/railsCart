class RealProduct < Product
    validates :stock, presence: true  # ✅ 確保庫存不能為空
  end