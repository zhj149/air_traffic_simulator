#2. Создать класс Airport со свойствами: name, code (уникальный код),
#runways (массив, в который будут добавляться объекты класса Runway).
#Также сделать возможность установить свойства при создании объекта и
#геттеры.
#Объекты класса Runway должны добавляться при создании объекта, можно
#прям массив из этих объектов передавать одним из аргументов в
#Airport.new

class Airport

  attr_accessor :name, :code, :runways
  attr_reader :airplanes
  #attr_reader :runways

  include AirplaneContainer::Manager
  include AirplaneContainer::Info

  def self.create(options={})
    airport         = Airport.new
    airport.name    = options[:name]
    airport.code    = options[:code]
    airport.runways = options[:runways]
    airport.runways.each { |runway| runway.airport=(airport) }
    airport.aircraft_quantity = options[:aircraft_quantity] || 50
    airport
  end

  def initialize
    @runways = Array.new
    @airplanes = Array.new
    @aircraft_quantity = 50
  end
  
  def add_airplane(*planes)
    super
    planes.each { |plane| plane.airport = self }
  end
  
end