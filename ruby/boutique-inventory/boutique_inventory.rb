class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    items.map {|item| item[:name]}
          .sort
  end

  def cheap
    items.select {|item| item[:price] < 30}
  end

  def out_of_stock
    items.select {|item| item[:quantity_by_size].none?}
  end

  def stock_for_item(name)
    items.select {|item| item[:name] == name}.first[:quantity_by_size]
  end

  def total_stock
    items.map {|item| item[:quantity_by_size].map {|_, quantity| quantity}. reduce(0) {|sum, n| sum + n} }
         .reduce(0) {|sum,n| sum + n}
  end

  private
  attr_reader :items
end
