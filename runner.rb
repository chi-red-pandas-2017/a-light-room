module Fixable
  def damaged?
    # !!@damaged
    @damaged ? true : false
    #
    # if @damaged
    #   true
    # else
    #   false
    # end
  end

  def fix
    self.damaged = false
    @damaged = false
  end

  def damage
    self.damaged = true
    @damaged = true
  end
end

class Furniture
  include Fixable

  def initialize(args)
    @materials << "wood"
    @number_of_legs = args.fetch(:number_of_legs, 4)
    puts @damaged.class
  end

  def put_down_armrests

  end

  private
  attr_reader :materials, :number_of_legs
end

class Table < Furniture
  include Fixable
  def initialize(args)
    @materials = args.fetch(:materials)
    @number_of_legs = args.fetch(:number_of_legs, 2)
    @monitors = args.fetch(:monitors, [Monitor.new])
    super
  end

  def remove_monitor
    monitors.pop
  end

  private
  attr_reader :monitors
end

# expect(table.remove_monitor).to be_a Monitor
# expect(table.remove_monitor.class).to eq Monitor

puts table = Table.new({ materials: ['metal'] })
puts table.inspect

class Chair < Furniture
  attr_reader :wheels

  def initialize(args)
    super
    @wheels = args.fetch(:wheels, false)
  end


end
# puts chair = Chair.new

class Computer
  include Fixable
end
# puts computer = Computer.new

class Monitor
  include Fixable
  def initialize
    @table = args.fetch(:table, Table.new)
  end
end
# puts monitor = Monitor.new

class Kettle
  include Fixable
end
# puts kettle = Kettle.new
