class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    line_items.each do |line_item|
      total += (line_item.item.price * line_item.quantity)
    end
    total
  end

  def add_item(item_id)
    item = line_items.find_by(item_id: item_id)
    if item
      item.quantity += 1
      item.save
    else
      item = line_items.build(item_id: item_id)
    end
    item
  end


end
