#2. Создать класс Airport со свойствами: name, code (уникальный код),
#runways (массив, в который будут добавляться объекты класса Runway).
#Также сделать возможность установить свойства при создании объекта и
#геттеры.
#Объекты класса Runway должны добавляться при создании объекта, можно
#прям массив из этих объектов передавать одним из аргументов в
#Airport.new

class Airport

	attr_accessor :name, :code, :runways
	#attr_reader :runways

	def self.create(options={})
		airport         = Airport.new(options)
		airport.name    = options[:name]
		airport.code    = options[:code]
		airport.runways = options[:runways]
		#airport.runways = @runways.push(Airport.new(options[:runways]))
		airport
	end

	def initialize(args)
		@runways = Array.new
	end
	
	
end