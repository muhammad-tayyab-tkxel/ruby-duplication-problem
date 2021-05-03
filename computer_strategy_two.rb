require_relative 'ds'

class ComputerStrategyTwo

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  # use method_missing to override missing method
  def method_missing(method_name, *args, &block)
    info = @data_source.send("get_#{method_name}_info", @id)
    price = @data_source.send("get_#{method_name}_price", @id)
    result = "#{method_name.capitalize}: #{info} ($#{price})"
    return "* #{result}" if price >= 100
    result
  end
end

ds = DS.new
workstation1 = ComputerStrategyTwo.new(1, ds)
p workstation1.mouse
p workstation1.cpu
p workstation1.keyboard
