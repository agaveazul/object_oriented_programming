class Paperboy

  attr_accessor :name, :experience
  attr_reader :earnings

  def initialize(name)
    @name = name
    @experience = 0
    @earnings = 0
  end

def quota
  50 + @experience/2
end

def deliver(start_address, end_address)
  if start_address > end_address
    return "The ending address must be higher in value than the start address."
  else
    distance = (end_address - start_address) + 1
    if distance >= quota
      @earnings = (50 * 0.25) + ((distance - 50) * 0.5)
    elsif distance < quota && distance > 50
      @earnings = (50 * 0.25) + ((distance - 50) * 0.5) - 2
    else
      @earnings = (distance * 0.25) - 2
    end
    @experience += distance
    return @earnings
    end
end

def report
  return "I'm #{name}, I've delivered #{experience} papers and I've earned $#{earnings} so far!"
end

end
