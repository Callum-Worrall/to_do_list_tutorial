require_relative "List.rb"

class UserInterface

  def main_menu(listObjectArg)
    @list = listObjectArg

    menuLoop = true

    while menuLoop == true
  
      system("clear")
  
      @list.print()
  
      puts "What would you like to do?"
      puts "1. Add a Task."
      puts "2. Remove a Task"
      puts "3. Complete a Task"
      puts "4. Save List"
      puts "5. Load List"
      puts "6. Exit"
  
      input = gets.chomp.to_i

      system("clear")
  
      case input
      when 1
        add_task()

      when 2
        remove_task()

      when 3
        complete_task()

      when 4
        save_list()

      when 5
        load_list()

      when 6
        menuLoop = false

      else
        puts "Please enter a valid option: 1-6"
        puts "Press enter to continue."
        gets
      end
    end

  end

  def add_task()

    puts "Write your task below please."  
    name = gets.chomp

    @list.add_task(name)

  end

  def remove_task()
  
    puts "Which task would you like to remove?"
    @list.print()
  
    input = gets.chomp
    index = input.to_i - 1  
    
    @list.remove_task(index)

  end

  def complete_task()

    puts "Which task would you like to complete?"
    @list.print()
  
    index = gets.chomp.to_i - 1

    if(!@list.complete_task(index))
      puts "You have already completed this task, ya silly!"
      puts "Press enter to continue..."
      gets
    end

  end

  def save_list()

    puts "What would you like to name your list?"
    name = gets.chomp

    @list.save(name)
    
  end

  def load_list

    puts Dir.entries("./lists")
    puts "Which list would you like to load? (Don't include the .json)"
    fileName = gets.chomp

    @list.load(fileName)

  end

end