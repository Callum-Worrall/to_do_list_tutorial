class Task

  attr_reader :name

  def initialize(name, complete)
    @name = name
    @complete = complete
  end

  def to_s
    if(@complete == false)  
      return @name + " [ ]"
    else
      return @name + " [X]"
    end
  end

  def setComplete()
    if(@complete == true)
      puts "Fail"
      return false;
    else
      puts "Success"
      @complete = true
      return true
    end

  end

  def getComplete
    return @complete
  end

end