class BoutiqueInventory
  def initialize(items)
    @items = items
  end

  def item_names
    items.map{|item| item[:name]}.sort
  end

  def cheap
    items.select{|item| item[:price] < 30}
  end

  def out_of_stock
    items.select{|item| item[:quantity_by_size].empty? }
  end

  def stock_for_item(name)
    items.select{|item| item[:name] == name}.first[:quantity_by_size]
  end

  def total_stock
    items.reduce(0) do |acc, item| 
      total_for_name = item[:quantity_by_size].empty? ? 0 : item[:quantity_by_size].reduce(0) {|acc, (_, amount)| acc + amount }
      acc + total_for_name
    end
  end

  private
  attr_reader :items
end
