class Radar
	# 4. Создать класс Radar. В нем должно быть свойство "airplanes" (т.е.
	# инстансная переменная), которое должно содержать все самолеты, которые
	# видит радар (т.е. объекты класса Airplane). Добавлять самолеты в радар
	# должно быть возможно методом Radar#add_airplane (кстати, решетка - это
	# просто удобная нотация для обозначения методов объекта. В реальности
	# она, конечно так не используется - будет ошибка - но для написания и
	# объяснения ее часто используют в документации).
	
	attr_reader :airplanes

	def initialize
		@airplanes = Array.new
	end

	#2. Модифицировать метод Radar#add_airplane:
 	# => а) Переименовать его в просто #add
 	# => б) сделать так, чтобы можно было в него передавать не один самолет,
	# а, например, несколько сразу. (см. 6.4.2 в книге по Ruby) и, чтобы
	#каждый самолет в таком случае, добавлялся на радар.
	def add(*planes)
		planes.each { |plane| @airplanes.push(plane) }
		@airplanes.uniq!
	end

	def delete_airplane(ac)
		@airplanes.each { |plane| @airplanes.delete(plane) if ac == plane.aircraft_type }
	end

	#2. Написать метод Radar#each_airplane. Метод должен перебирать каждый
	#самолет, но только возвращать не сам объект, а несколько основных
	#свойств каждого самолета. Вот так:

	#radar.each_airplane { |name, speed, altitude, position| ... }
	#Ну и в самом блоке, например, можно все это выводить с помощью puts
	def each_airplane
		@airplanes.each do |plane| 
			yield(plane.aircraft_type, plane.velocity, plane.altitude, plane.position)
		end
	end

	#1. Написать метод Radar#deleted_landed, который удаляет все самолеты,
	#высота которых равна 0.
	def deleted_landed
		@airplanes.each { |plane| @airplanes.delete(plane) if plane.altitude == 0 }
	end

	#Брать каждый самолет из массива @airplanes и сопоставлять его по трем
	#свойствам - course, altitude, position - с каждым другим самолетом из
	#массива @airplanes. Если так получается, что самолеты идут встречным
	#курсом и на одной высоте - нужно чтобы он их возвращал в блок.

	#Далее внутри блока мы можем уже путсом уведомить консоль, что у нас
	#может быть столкновение:

	#radar.each_proximity_alert { |airplane1, airplane2| puts "Warning!
	#{airplane1.name} is close to #{airplane2}." }
	#def each_proximity_alert
	#	@airplanes.each { |airplane1, airplane2| "#{airplane1} == #{airplane2}" }
	#end

end