class CreatePets < ActiveRecord::Migration[5.0]
    def change
        create_table :pets do |t|
            t.string :name
            t.string :species
            t.string :breed
            t.string :age
            t.string :gender
            t.boolean :fixed
            t.boolean :special_needs
            t.string :location
            t.string :size
            t.string :url
        end
    end
end