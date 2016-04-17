def circus_pole(people)
  people_by_height = people.sort do |a,b|
    a.height <=> b.height
  end

  people_by_weight = people.sort do |a,b|
    a.weight <=> b.weight
  end

  pole = []

  until(people_by_weight.empty? || people_by_height.empty?)
    if(people_by_height.first == people_by_weight.first)
      pole.push(people_by_height.first)

      people_by_height.shift
      people_by_weight.shift
    else
      opposite_location_height = people_by_height.index(people_by_weight.first)
      opposite_location_weight = people_by_weight.index(people_by_height.first)

      if opposite_location_height.nil?
        people_by_weight.shift
        next
      end

      if opposite_location_weight.nil?
        people_by_height.shift
        next
      end

      if opposite_location_height > opposite_location_weight
        people_by_weight.shift
      else
        people_by_height.shift
      end
    end
  end

  return pole
end

class Person
  def initialize(height, weight)
    @height = height
    @weight = weight
  end

  attr_reader :height, :weight
end

people = []
people << Person.new(65, 100)
people << Person.new(70, 150)
people << Person.new(56, 90)
people << Person.new(75, 190)
people << Person.new(60, 95)
people << Person.new(68, 110)

puts circus_pole(people)


people = []
people << Person.new(2,3)
people << Person.new(4,7)
people << Person.new(1,2)
people << Person.new(5,3)
people << Person.new(3,1)
