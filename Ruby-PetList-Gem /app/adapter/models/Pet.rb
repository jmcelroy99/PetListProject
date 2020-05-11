class Pet < ActiveRecord::Base
    has_many :pet_list, dependent: :destroy
    has_many :users, through: :pet_list
   
    #json_response['animals'].filter {|animal| animal['type'] == "Dog" || animal['type'] == "Cat"}

    # def initialize(name=nil, species=nil, breed=nil)



    # end


    def good_with_dogs? 
        

    end

    def good_with_cats?


    end



    def good_with_kids?


    end

    
end