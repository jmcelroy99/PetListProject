require_relative '../config/environment'
require 'tty-prompt'

prompt = TTY::Prompt.new
 

user = CommandLine.new




user.welcome_screen

user.home_screen 



#puts "Hello and Welcome to PetList, please enter your name:"
#x = gets.strip
#name = x.to_s
# user.greeting(name)

# location = gets.strip
# state_code = location.to_s.upcase


# our_user = User.create(name: @name, location: @state_code)

# puts "Please create a username"

# username = gets.strip
# username = our_user

# user.find_by_state(state_code)
    

# puts "Are you looking to adopt a dog or cat"

# animal_input = gets.strip
# animal_preference = animal_input.to_s.capitalize
# # puts "What size #{animal_preference} are you looking for?
# # Small, Medium, or Large"

# # size_input = gets.strip 
# # size_preference = size_input.to_s.capitalize

# puts "We are conducting a search based off your information..."

# user.search_by_criteria(state_code, animal_preference)

# puts "Type the id's of the #{animal_preference}s you wish to add to your PetList. ex. 73, 12, 202, 33"
# pet_id = gets.strip
# ids_to_add = pet_id.split(",").map {|s| s.to_i}

# #id_to_add = pet_id.to_i


# user.push_to_petlist(state_code, animal_preference, ids_to_add, our_user)

# puts "Here's your Petlist"

# user.my_petlist(our_user)

    


# puts "Pet #{ids_to_add} have successfully been added to your PetList. Enter the ID's of the pets you would like to remove."

# delete_pet = gets.strip 
# pet_id_to_delete = delete_pet.split(",").map {|s| s.to_i}

# user.delete_pets_by_id(pet_id_to_delete, our_user)


# user.my_petlist(our_user)


# puts "complete"

# user.search( state_code, animal_preference)

# def settings
#     choices = {"Delete Data" => 1,
#         "Delete Account" => 2,
#         "Change Address" => 3,
#         "Change Password" => 4,
#         "Return to Main Menu" => 5
#     }
#     resp = @prompt.select("Please choose from one of the following:", choices)
#         case resp
#         when 1
#             delete_data
#         when 2
#             delete_account
#         when 3
#             change_address
#         when 4 
#             change_password
#         when 5
#             main_menu
#         end
# end글

# prompt = TTY::Prompt.new
# choices = {"View petlist" => 1, "New search" => 2}
# = prompt.select("Pet #{ids_to_add} have successfully been added to your PetList.")
# case resp
# when 1
#     "View Petlist"
# when 2








