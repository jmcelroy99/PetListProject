require 'pry'
require 'tty-prompt'





class CommandLine 
   
    def welcome_screen
        
        puts "
       
 
        /$$$$$$$             /$$     /$$       /$$             /$$    
        | $$__  $$           | $$    | $$      |__/            | $$    
        | $$  \ $$ /$$$$$$  /$$$$$$  | $$       /$$  /$$$$$$$ /$$$$$$  
        | $$$$$$$//$$__  $$|_  $$_/  | $$      | $$ /$$_____/|_  $$_/  
        | $$____/| $$$$$$$$  | $$    | $$      | $$|  $$$$$$   | $$    
        | $$     | $$_____/  | $$ /$$| $$      | $$ \____  $$  | $$ /$$
        | $$     |  $$$$$$$  |  $$$$/| $$$$$$$$| $$ /$$$$$$$/  |  $$$$/
        |__/      \_______/   \___/  |________/|__/|_______/    \___/  
                                                                       
                                                                       
                                                                       
        
                                              
        "
        prompt = TTY::Prompt.new
        choices = {"New User" => 1,
            "Returning User" => 2}
        
        resp = prompt.select("Please choose from one of the following:", choices)
        case resp
        when 1
            new_user
        when 2
            puts "Welcome back"
            return_user

        end

    end

    def new_user
        puts "Hello and Welcome to PetList, please enter your name:"
        x = gets.strip
        @name = x.to_s

        puts "Please, by entering your State's abbreviation, Tell us where you are located?  (ex. California == CA)"
        location = gets.strip
        @state_code = location.to_s.upcase
        @our_user = User.create(name: @name, location: @state_code)

        puts "Here is your PetList Id, use it next time you visit: #{@our_user.id} \n"
    end

    def return_user
        puts "Enter you user Id"
        return_id = gets.strip

        @our_user = User.find(return_id)

        prompt = TTY::Prompt.new
        choices = {"New Search" => 1,
        "View MyPetList" => 2,
        "Exit" => 3}
    
       resp = prompt.select("Select", choices)
        case resp
        when 1
            new_search
        when 2
            my_petlist

        when 3
            home_screen   
        
        
        end



    end 

    def home_screen
        puts "
        

        /$$$$$$$             /$$     /$$       /$$             /$$    
        | $$__  $$           | $$    | $$      |__/            | $$    
        | $$  \ $$ /$$$$$$  /$$$$$$  | $$       /$$  /$$$$$$$ /$$$$$$  
        | $$$$$$$//$$__  $$|_  $$_/  | $$      | $$ /$$_____/|_  $$_/  
        | $$____/| $$$$$$$$  | $$    | $$      | $$|  $$$$$$   | $$    
        | $$     | $$_____/  | $$ /$$| $$      | $$ \____  $$  | $$ /$$
        | $$     |  $$$$$$$  |  $$$$/| $$$$$$$$| $$ /$$$$$$$/  |  $$$$/
        |__/      \_______/   \___/  |________/|__/|_______/    \___/  
                                  
        "
        prompt = TTY::Prompt.new
        choices = {"New Search" => 1,
        "View MyPetList" => 2,
        "Exit Programe" => 3}
    
        resp = prompt.select("Select", choices)
        case resp
        when 1
            new_search
        when 2
            my_petlist
        when 3
            exit!

        end

    end 
   
    def new_search
        puts "Which state would you like to search in?"
        location = gets.strip
        state_code = location.to_s.upcase

        puts "Are you looking for a Dog or Cat?"
        animal_input = gets.strip
        animal_preference = animal_input.to_s.capitalize

        search_by_criteria(state_code, animal_preference)

        puts "Type the id's of the #{animal_preference}s you wish to add to your PetList. ex. 73, 12, 202, 33"


         pet_id = gets.strip
         ids_to_add = pet_id.split(",").map {|s| s.to_i}

         push_to_petlist(state_code, animal_preference, ids_to_add, @our_user)

         puts "#{animal_preference} #{ids_to_add} has been added to your petlist"

         prompt = TTY::Prompt.new
         choices = {"New Search" => 1,
         "View MyPetList" => 2}
     
        resp = prompt.select("Select", choices)
         case resp
         when 1
             new_search
         when 2
             my_petlist
 
            end
 



        end
    
    
    
    
    
    def find_by_state(state_code)
    pet_location = Pet.all.select {|pet| pet.location == state_code}
    
    end

   

    def find_by_animal_type(animal_preference)
 
        find_by_state.select {|pet| pet.species == animal_preference}
    end



    def search_by_criteria(state_code, animal_preference)
        
        state_results = find_by_state(state_code)
        list = state_results.select{|pet| pet.species == animal_preference}
        
        list.each{|pet_obj| puts "Id: #{pet_obj["id"]} \nName: #{pet_obj["name"]}\nSize: #{pet_obj["size"]}\nURL: #{pet_obj["url"]}\n " }
    end

        
        


    def push_to_petlist(state_code, animal_preference, ids_to_add, our_user)
        
        
        x = search_by_criteria(state_code, animal_preference)
        ids_to_add.each {|n| PetList.create(user_id: our_user.id, pet_id: n)}

       

        puts "#{animal_preference}s"
        
    end

    def my_petlist
        
        my_petlists = PetList.where(user_id: @our_user.id)
        my_pets = my_petlists.map{|p_l| p_l.pet}
        if my_pets == []
            puts "Oh No! Your PetList is empty!"

            prompt = TTY::Prompt.new
            choices = {"Add To PetList" => 1,
            "Go Home" => 2}
        
            resp = prompt.select("Select", choices)
            case resp
            when 1
                new_search
    
            when 2
                home_screen
    
            end

        else 
        
        
        puts "Here's Your PetList! \n\n"
        
        my_pets.each{|pet_obj| puts "Id:#{pet_obj["id"]}\nName: #{pet_obj["name"]}\nBreed: #{pet_obj["breed"]}\nSize: #{pet_obj["size"]}\nURL: #{pet_obj["url"]}\n " }

        

        prompt = TTY::Prompt.new
        choices = {"Add To PetList" => 1,
        "Delete pets from my PetList" => 2,
        "Go Home" => 3}
    
        resp = prompt.select("Select", choices)
        case resp
        when 1
            new_search
        when 2
            delete_pets_by_id

        when 3
            home_screen

        end
        end 

    end
   
    def delete_pets_by_id
       
        puts "Enter the ID's of the pets you would like to remove. ex.223, 201, 222"

        delete_pet = gets.strip 
        pet_id_to_delete = delete_pet.split(",").map {|s| s.to_i}
        

       pet_id_to_delete.each {|p_id| PetList.delete_all(user_id: @our_user.id, pet_id: p_id)}
        PetList.delete_all(user_id: @our_user.id, pet_id: pet_id_to_delete)
        
        puts "Pet #{pet_id_to_delete} has been removed from your PetList"
        
        prompt = TTY::Prompt.new
        choices = {"Add To PetList" => 1,
        "view my PetList" => 2,
        "Go Home" => 3}
    
        resp = prompt.select("Select", choices)
        case resp
        when 1
            new_search
        when 2
            my_petlist

        when 3
            home_screen

        end

    
    end

    
  
end 
