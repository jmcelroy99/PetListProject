class User < ActiveRecord::Base
    has_many :pet_lists
    has_many :pets, through: :pet_lists

#     attr_accessor :location
#     attr_reader :name, :id

# def initialize(name, location)
#     @name = name 
#     @location = location
#     @id = id


end
