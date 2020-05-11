require 'pry'

class PetFinder
    def self.get_data
      url = "https://api.petfinder.com/v2/animals?page=12"
      pets = RestClient::Request.execute(method: :get, 
      url: "https://api.petfinder.com/v2/animals?page=12", 
      headers:{
        "Authorization" => "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxQ3dUUDE4bDJWQmZhNEdoMmM4VVZlZ3NzOVF6blFrMnp1ODhCREJ4VDlKdTBSNk1SayIsImp0aSI6IjRjZWQyODIzZDA4YTdlNzE0ODQyYzgxY2Y0MzVmNjExMmU2NzdkMjYxNDRmMjQ0OTljMGI4NGFiMDUwZjdmNzAxN2U2YTc3NzZhYjIxODY4IiwiaWF0IjoxNTg4NzE4MDQ0LCJuYmYiOjE1ODg3MTgwNDQsImV4cCI6MTU4ODcyMTY0NCwic3ViIjoiIiwic2NvcGVzIjpbXX0.ifMHHR_TyPPOCGYzCk2xRNHlBHER2lZE_qLaGtRSL4aTuQIdukyEGCNeN3bJNGUMh90GwSRbnWrlazHpNVzU9zBx4DWkjgEiQ3GaGl690x_zOmeZeH8U84iDHepAYrSeNSK_G20jHCqMuQxCHsZbssbjY-NDUBwKmJlUIbGNH0i2VjQbafo7h-_MNwYtXRA-9WAUvGsQgJ88Qu0R_yJ9h-_YxHRlwh5RP51eR-nl7JSSLae8PNBqDs0kjF-sScR6i-S8GMQyWNUa3H-lOHOQ65B0Ff8AiFwVmKfDCZ39OYPdnuEd0tIuQv9_S551MG6VTz2VvxaMc2TLthznVyP8DA"
    })
      
      json_response = JSON.parse(pets.body)
      all_animals = json_response['animals']
      d_cs = json_response['animals'].filter{|animal| animal['type'] == "Cat" || animal['type'] == 'Dog'}
      d_cs.map{|animal| Pet.create(name: animal['name'],
                                   species: animal['type'],
                                   breed: animal['breeds']['primary'],
                                   age: animal['age'],
                                   gender: animal['gender'],
                                   fixed: animal['attributes']['spayed_neutered'],
                                   special_needs: animal['attributes']['special_needs'],                      
                                   location: animal['contact']['address']['state'],
                                   size: animal['size'],
                                   url: animal['url'])}
      #
      #binding.pry
      # t.string  "name" => ['name']
      # t.string  "species" => ['type']
      # t.string  "breed" => ['breeds']['primary']
      # t.integer "age" => ['age']
      # t.boolean "fixed" => ['attributes']['spayed_neutered']
      # t.boolean "special_needs" => ['attributes']['special_needs']
      # t.boolean "good_with_dogs" => ['environment']['dogs']
      # t.boolean "good_with_cats" => ['environment']['cats']
      # t.boolean "good_with_kids" => ['environment']['children']
      # t.string  "location" => ['contact']['address']['state']
      # t.string  "size" => ['size']
      # t.string  "url" => url
      
      #dogs = json_response['animals'].filter{|animal| animal['breeds'] == "Miniature Pinscher"}
      #cats = json_response['animals'].filter{|animal| animal['type'] == "Cat"}
      #cats = json_response['animals'].filter{|animal| animal['type'] == "Dog"}

      
      
      
      # binding.pry
    end
  end

  
  # #
  # #binding.pry
  # #0   "cycle" => "2020",
  #       "output" => "json"
  #   })
  #     #response_body = response.body
  #     #json_response = JSON.parse(response_body)
  #     #binding.pry
  #     #books = json_response["items"].map do |item| 
  #      # {description: item["volumeInfo"]["description"],
  #       #title: item["volumeInfo"]["title"]}
  #     end
  #     # binding.pry
  #   end
  # end
  # #
  # #binding.pry
  # #0  binding.pry
  #     books = json_response["items"].map do |item| 
  #       {description: item["volumeInfo"]["description"],
  #       title: item["volumeInfo"]["title"]}
  #     end
  #     # binding.pry
  #   end
  # end
  # #
  # #binding.pry
  #0

 # curl -d "grant_type=client_credentials&client_id=1CwTP18l2VBfa4Gh2c8UVegss9QznQk2zu88BDBxT9Ju0R6MRk&client_secret=hqAPtWrJDUfXFnTaXGnalcXWsbuwE4n0tkzBzGm3" https://api.petfinder.com/v2/oauth2/token  #0  binding.pry
   
  # 3:34 eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxQ3dUUDE4bDJWQmZhNEdoMmM4VVZlZ3NzOVF6blFrMnp1ODhCREJ4VDlKdTBSNk1SayIsImp0aSI6IjRjZWQyODIzZDA4YTdlNzE0ODQyYzgxY2Y0MzVmNjExMmU2NzdkMjYxNDRmMjQ0OTljMGI4NGFiMDUwZjdmNzAxN2U2YTc3NzZhYjIxODY4IiwiaWF0IjoxNTg4NzE4MDQ0LCJuYmYiOjE1ODg3MTgwNDQsImV4cCI6MTU4ODcyMTY0NCwic3ViIjoiIiwic2NvcGVzIjpbXX0.ifMHHR_TyPPOCGYzCk2xRNHlBHER2lZE_qLaGtRSL4aTuQIdukyEGCNeN3bJNGUMh90GwSRbnWrlazHpNVzU9zBx4DWkjgEiQ3GaGl690x_zOmeZeH8U84iDHepAYrSeNSK_G20jHCqMuQxCHsZbssbjY-NDUBwKmJlUIbGNH0i2VjQbafo7h-_MNwYtXRA-9WAUvGsQgJ88Qu0R_yJ9h-_YxHRlwh5RP51eR-nl7JSSLae8PNBqDs0kjF-sScR6i-S8GMQyWNUa3H-lOHOQ65B0Ff8AiFwVmKfDCZ39OYPdnuEd0tIuQv9_S551MG6VTz2VvxaMc2TLthznVyP8DA