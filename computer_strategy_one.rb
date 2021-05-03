require_relative 'ds'

class ComputerStrategyOne
  # list all components of computer in components list e.g mouse, cpu ... etc
  COMPONENTS = %w[mouse cpu keyboard]

  def initialize(computer_id, data_source)
    @id = computer_id
    @data_source = data_source
  end

  # use define_method to dynamically create method for each computer component
  COMPONENTS.each do |component|
    define_method(:"#{component}") do |*args|
      info = @data_source.send("get_#{component}_info", @id)
      price = @data_source.send("get_#{component}_price", @id)
      result = "#{component.capitalize}: #{info} ($#{price})"
      return "* #{result}" if price >= 100
      result
    end
  end
end

ds = DS.new
workstation1 = ComputerStrategyOne.new(1, ds)
p workstation1.mouse
p workstation1.cpu
p workstation1.keyboard
