class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    @items.map {|item| item[:name]}
          .sort
  end

  def cheap
    @items.select {|item| item[:price] < 30}
  end

  def out_of_stock
    raise 'Implement the BoutiqueInventory#out_of_stock method'
  end

  def stock_for_item(name)
    raise 'Implement the BoutiqueInventory#stock_for_item method'
  end

  def total_stock
    raise 'Implement the BoutiqueInventory#total_stock method'
  end

  private
  attr_reader :items
end
