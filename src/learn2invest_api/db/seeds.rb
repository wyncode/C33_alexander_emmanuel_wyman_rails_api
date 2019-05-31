# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Customer.destroy_all
City.destroy_all

10.times do
    customer = Customer.create(
                first_name:           Faker::Name.first_name,
                last_name:            Faker::Name.last_name,
                password_digest:      'password',
                email:                Faker::Internet.email,
                mobile:               Faker::PhoneNumber.phone_number,
                street1:              Faker::Address.street_address)

                tempcity = City.create(
                    name:                 Faker::Address.city_prefix + Faker::Address.city_suffix
                    )
                tempzip = ZipCode.create(
        value:                  Faker::Address.zip_code
    )
    
    

    # tempstate = State.new(
    #     value:                Faker::Address.state_abbr
        
    # )
     
    tempzip.cities_id = tempcity.id
    tempzip.save
    #tempcity.save
     #tempstate.save
     

    


end
