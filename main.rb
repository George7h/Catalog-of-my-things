require_relative 'menu'

puts 'Welcome to your Catalog of things'

menu = Menu.new

loop do
  menu.display_menu
  print 'Enter your choice (1 - 13): '
  choice = gets.to_i

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
