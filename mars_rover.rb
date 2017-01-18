$rover_count = 0

class MissionControl

  def initialize(mc_name)
    @mc_name = mc_name
  end

  def rover_move(rover_name, plateau, instructions)
  read_instruction(rover_name, plateau, instructions)
  end

  def rover_report(rover_name)
    return "This is #{rover_name.name}. I am at #{rover_name.location_x} #{rover_name.location_y} #{rover_name.direction}."
  end

  def mc_report
    return "There are #{$rover_count} rover(s) on the plateau."
  end

  def read_instruction(rover_name, plateau, instructions)
      instructions.each_char do |chr|
        case chr
        when "L"
          rover_name.turn(chr)
        when "R"
          rover_name.turn(chr)
        when "M"
          case rover_name.direction
            when "N"
              if rover_name.location_y == plateau.y_length
                puts "The rover is going to crash and burn! Abort! Abort!"
              else
              rover_name.move(chr)
              end
            when "E"
              if rover_name.location_x == plateau.x_length
                puts "The rover is going to crash and burn! Abort! Abort!"
              else
              rover_name.move(chr)
              end
            when "S"
              if rover_name.location_y == 0
                puts "The rover is going to crash and burn! Abort! Abort!"
              else
              rover_name.move(chr)
              end
            when "W"
              if rover_name.location_x == 0
                puts "The rover is going to crash and burn! Abort! Abort!"
              else
              rover_name.move(chr)
              end
            end
        else
          puts "'#{chr}' is not a recognizable movement. Skipping.."
        end
      end
    puts "#{rover_name.name} is now at #{rover_name.location_x} #{rover_name.location_y} #{rover_name.direction}."
  end

end

class Plateau
  attr_accessor :x_length, :y_length

  def initialize(x_length, y_length)
    @x_length = x_length
    @y_length = y_length
  end

end


class Rover
attr_accessor :name, :location_x, :location_y, :direction

  def initialize(name, location_x, location_y, direction)
    @name = name
    @location_x = location_x
    @location_y = location_y
    @direction = direction
    $rover_count += 1
  end


  def move(chr)
    case @direction
    when "N"
      @location_y += 1
    when "E"
      @location_x += 1
    when "S"
      @location_y -= 1
    when "W"
      @location_x -= 1
    end
  end

  def turn(chr)
    if chr == "L"
      case @direction
      when "N"
        @direction = "W"
      when "E"
        @direction = "N"
      when "S"
        @direction = "E"
      when "W"
        @direction = "S"
      end
    elsif chr == "R"
      case @direction
      when "N"
        @direction = "E"
      when "E"
        @direction = "S"
      when "S"
        @direction = "W"
      when "W"
        @direction = "N"
      end
    end
  end

end

rich = Rover.new("rich",4,4,"N")
bitmaker = Plateau.new(5,5)
camden = MissionControl.new("camden")
