class PetList < ActiveRecord::Base
    belongs_to :user
    belongs_to :pet
    
     

# attr_reader :User_Id, :Pet_Id

# def initialize(User_Id, Pet_Id)
#     @User_Id = User_Id
#     @Pet_Id = Pet_Id

# end



end 