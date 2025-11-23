def stock_picker(prices_array)
  profits_by_index = prices_array.each_with_index.reduce(Hash.new()) do |buy_hash, (buy_price, buy_index)|
    profits_hash = prices_array.each_with_index.reduce(Hash.new()) do |sell_hash, (sell_price, sell_index)|
      sell_hash[sell_index] = sell_price - buy_price if sell_index >= buy_index
    
      sell_hash
    end
    
    buy_hash[buy_index] = profits_hash.max_by { |k, v| v }

    buy_hash
  end

  profits_by_index.max_by { |k, v| v[1] }.flatten[0, 2]
end