description_mac = File.open('restaurant_descriptions/mac.txt', 'r').read
description_hapines = File.open('restaurant_descriptions/hapines.txt', 'r').read

restaurants = [
    {name: 'MacDonalds', latitude: '812 Broadway, New York, NY 10003, USA', short_description: descr, full_description: description_mac },
    {name: 'Hapines', latitude: '2049 Broadway, New York, NY 10023, USA',short_description: descr, full_description: description_hapines },
    # {name: 'Gruzin_by', latitude: '303 S Broadway Ste 200, Denver, CO 80209, USA', short_description: descr, full_description: descr },
]

restaurants.each do |place|
  Restaurant.create(place)
end

# t.float :latitude, null: false
# t.float :longitude, null: false
# t.text :short_description
# t.text :full_description
