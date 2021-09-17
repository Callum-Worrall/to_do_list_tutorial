require_relative "Task.rb"
require_relative "FileManager.rb"

class List
  include FileManager

  def initialize()
    @name = "New"
    @array = []
  end
  
  def assign_array(newArray)
    @array = newArray
  end

  def add_task(name)
    newTask = Task.new(name, false)
    @array.push(newTask)
  end

  def remove_task(index)
    @array.delete_at(index)
  end

  def complete_task(index)
    return @array[index].setComplete()
  end

  def print()
    if(@array.length <= 0)
      return
    end
    
    puts @name + " List"
    index = 0
    while index < @array.length
      puts (index+1).to_s + ". " + @array[index].to_s
      
      index += 1
    end   

    puts
  end

  # Converts an Array of Hashes to an Array of Task Objects
  def convert_hash_to_task(hashArray)
    taskArray = []
    hashArray.each { |hash|
      taskArray.push(Task.new(hash["name"], hash["complete"]))
    }
    return taskArray
  end

  # File Manager
  def save(name)    
    FileManager.save_list(name, @array)

    @name = name
  end

  def load(fileName)
    file = FileManager.load_list(fileName)

    if(file == nil)
      puts "Loading File Failed: Not Found"
      return false
    end

    incomingList = JSON.parse(file)

    @array = convert_hash_to_task(incomingList)

    @name = fileName

    return true
  end
  
end