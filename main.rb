require_relative 'menu'

puts 'Welcome to your Catalog of things'

# Create an instance of the Menu class
menu = Menu.new

# Main loop for the console app
loop do
  # Display the menu and get the user's choice
  menu.display_menu
  print 'Enter your choice (1 - 13): '
  choice = gets.to_i

  # Perform the chosen action
  case choice
  when 1..12
    menu.run_options(choice)
  when 13
    puts 'Exiting the app'
    break
  else
    puts 'Invalid choice. Please input a valid choice'
  end
end
