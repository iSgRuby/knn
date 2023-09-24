# frozen_string_literal: true

# Programa hecho por Manuel Reyes Alcalá

require './lib/classes'
require 'gruff'

# Function to create new groups
# Returns the array with all the groups with the new created group
def create_group(groups)
  print('Name your new group: ')
  groups << Groups.new(gets.chomp)
end

def ask_info(groups)
  print('Insert the name of the group you want to add points: ')
  name = gets.chomp
  groups.each do |group|
    if group.name == name
      print('how many points?: ')
      n = gets.chomp.to_i
      puts('Insert the range of the points to generate')
      print('from x: ')
      x1 = gets.chomp.to_i
      print('to x: ')
      x2 = gets.chomp.to_i
      print('from y: ')
      y1 = gets.chomp.to_i
      print('to y: ')
      y2 = gets.chomp.to_i
      points = create_points(n_points: n, cx1: x1, cy1: y1, cx2: x2, cy2: y2)
      group.add_points(points)
    end
  end
end

# returns an array with the new points
def create_points(n_points:, cx1:, cy1:, cx2:, cy2:)
  points = []
  n_points.times { points << Points.new(rand(cx1..cx2), rand(cy1..cy2)) }
  points
end

def add_to_chart(groups)
  g = Gruff::Scatter.new
  g.title = 'Knn'
  groups.each do |group|
    next if group.points.nil?

    x_arr = []
    y_arr = []
    group.points.each do |point|
      x_arr << point.x
      y_arr << point.y
    end
    g.data(group.name, x_arr, y_arr)
  end
  g.write('scatter_chart.png')
end

def knn(groups)
  puts('Insert the coordinates of the point')
  print('x: ')
  x = gets.chomp.to_i
  print('y: ')
  y = gets.chomp.to_i
  print('Insert "K": ')
  k = gets.chomp.to_i

  knn_group = Groups.new('knn')
  knn_group.add_points([Points.new(x, y)])
  groups << knn_group
  add_to_chart(groups)
  puts('check the chart and watch the new point with the name knn')
  puts('After you chek insert anything to continue')
  gets

  points_distance = {}
  groups.each do |group|
    next if group == knn_group

    group.points.each { |point| points_distance[point] = Math.sqrt(((point.x - x)**2) + ((point.y - y)**2).abs) }
  end
  points_distance = Hash[points_distance.sort_by { |_key, value| value }.first(k)]

  count = {}
  points_distance.each do |key, value|
    if count[key.group].nil?
      count[key.group] = 1
    else
      count[key.group] += 1
    end
  end

  points_to_add = []
  group_to_add = count.max_by{|key, value| value}.first
  knn_group.points.each { |point| points_to_add << point }
  group_to_add.add_points(points_to_add)

  groups.delete(knn_group)

end

def two_groups(groups)
  2.times do |i|
    groups << Groups.new(i.to_s)
    groups[i].add_points(
      create_points(
        n_points: 25, cx1: 0 + i * 50, cy1: 50 - i * 50, cx2: 50 + i * 50, cy2: 100 - i * 50
      )
    )
  end
end

def menu
  puts '[1] Create a group'
  puts '[2] Add random points to a group'
  puts '[3] Load to chart'
  puts '[4] Add one point knn'
  puts '[5] generate 2 groups'
  puts '[0] Exit'
  print 'Insert an option: '
  gets.chomp.to_i
end

# function main
def main
  # Array to save any created group
  groups = []

  until (op = menu).zero?
    case op
    when 1 then create_group(groups)
    when 2 then ask_info(groups)
    when 3 then add_to_chart(groups)
    when 4 then knn(groups)
    when 5 then two_groups(groups)
    when 0 then print 'Finishing...'
    else
      puts 'Not valid'
    end
  end
end

main
