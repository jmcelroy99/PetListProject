class CreatePetLists < ActiveRecord::Migration[5.0]

    def change 
        create_table :pet_lists do |t|
            t.integer :user_id
            t.integer :pet_id
        end
    end
end       