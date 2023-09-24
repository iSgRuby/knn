# frozen_string_literal: true

# Clase para cada punto creado
class Points
  attr_accessor :x, :y, :group

  # Function to initialize a point with two coordinates
  def initialize(cor_x, cor_y)
    @x = cor_x
    @y = cor_y
  end
end

# Clase para los diferentes grupos que se quieran crear
class Groups
  attr_accessor :name, :points

  def initialize(name)
    @name = name
    @points = []
  end

  # Function to add points to the group
  def add_points(points)
    self.points.concat(points)
    points.each { |point| point.group = self }
  end

  def print_group
    puts "group #{name}: "
    points.each { |point| puts "x: #{point.x},\ty: #{point.y} " }
  end
end
