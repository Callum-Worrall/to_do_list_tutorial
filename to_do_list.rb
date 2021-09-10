
# our main hub for our program, this is called right at the bottom
def menu()

  #our initial array with its 'nested' hashes
  listArray = [
    {name: "Learn Programming", complete: false},
    {name: "Washing", complete: false},
    {name: "Play some Games", complete: false}
  ]

  #a variable called menuLoop that is assigned the value of 'true', this makes it a boolean data type
  menuLoop = true

  #a while loop that depends on menuLoop being true to continue looping
  while menuLoop == true

     # clears the terminal
    system("clear")

     # call our print_list function and pass in listArray so that function can access it
    print_list(listArray)

    #menu print
    puts "What would you like to do?"
    puts "1. Add an Item."
    puts "2. Remove an Item"
    puts "3. Complete an Item"
    puts "4. Exit"

    # take user input 
    input = gets.chomp
    # if / else statement that redirects depending on the input
    if(input == "1")

      # call our add_item function and pass in listArray so that function can access it
      add_item(listArray)

    elsif (input == "2")

      # call our remove_item function and pass in listArray so that function can access it
      remove_item(listArray)

    elsif (input == "3")

      # call our complete_item function and pass in listArray so that function can access it
      complete_item(listArray)

    elsif (input == "4")

      # switch the boolean that was keeping the loop reiterating to false
      # as the loop needs menuLoop to be true to reiterate it stops and the application finishes
      menuLoop = false

    end
  end
end

def print_list(listArray)
  index = 0
  while index < listArray.length
    if(listArray[index][:complete] == false)

      # Printing the index + 1, converting to a string, adding filler inbetween
      # then listArray element at the location described by the index
      # and finding the name inside the has of that is in that location using the correct symbol ':name'
      # and then adding an empty 'box' at the end to indicate its not complete 
      puts (index+1).to_s + ". " + listArray[index][:name] + " [ ]"

    else

      # same as above, but the box at the end now says its complete
      puts (index+1).to_s + ". " + listArray[index][:name] + " [X]"

    end
    
    index += 1
  end
  puts
end

def add_item(listArray)

   # clears the terminal
  system("clear")

  puts "Write your task below please."

  task = gets.chomp
  listArray.push({name: task, complete:false})
end

def remove_item(listArray)

  # clears the terminal
  system("clear")

  puts "Which item would you like to remove?"
  print_list(listArray)

  # takes a string from the user and 'chomps' off the end which is a space thats comes with gets
  input = gets.chomp

  # turns that string into an integer,
  # and take away 1 so its looking at the correct location in the listArray
  index = input.to_i-1

  listArray.delete_at(index)
end

def complete_item(listArray)

  # clears the terminal
  system("clear")

  puts "Which item would you like to complete?"
  print_list(listArray)

  # gets - takes a string from the user
  # .chomp - 'chomps' off the end which is a space thats comes with gets
  # .to_i - turns that string into an integer,
  # minus 1 so its looking at the correct location in listArray
  index = gets.chomp.to_i - 1

  if(listArray[index][:complete] == false)
    listArray[index][:complete] = true
  else
    puts "You have already completed this task, ya silly!"
    puts "Press enter to continue..."
    gets
  end
end


##### VERY IMPORTANT #####
# this function call is for our menu that controls the entire app
# if you dont call your function anywhere, it will never be processed
menu()