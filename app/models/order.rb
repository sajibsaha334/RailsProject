class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  enum status: { pending: 0, delivered: 1 }

  def total
    sum = 0
    self.line_items.each do |line_item|
      sum += line_item.total_of_single_product
    end
    sum
  end
end
