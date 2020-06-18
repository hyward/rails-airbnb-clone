Car.destroy_all
City.destroy_all
User.destroy_all
require "open-uri"

car_pictures = ["https://images.unsplash.com/photo-1525609004556-c46c7d6cf023?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60", "https://k8q7r7a2.stackpathcdn.com/wp-content/uploads/2019/12/The-petrolhead-corner-The-Alpine-A110-Edition.jpg", "https://images.hgmsites.net/hug/porsche-911-carrera_100738596_h.jpg", "https://images-na.ssl-images-amazon.com/images/I/81COgiSpwWL._AC_SL1500_.jpg", "https://industryeurope.com/downloads/4704/download/Koenigsegg%20world%20record.jpg?cb=3fe6d3ea7bf0aa96dce842b82b9cf7d7&w=1032", "https://cdn.motor1.com/images/mgl/yvv0k/s1/audi-rs6-avant-project-phoenix.jpg", "https://d39a3h63xew422.cloudfront.net/wp-content/uploads/2014/09/20152947/the-ten-best-classic-cars-to-drive-daily-1476934695393-1000x563.jpg", "https://coolmaterial.com/wp-content/uploads/2012/05/1963-Aston-Martin-DB5.jpg"]

@cities = []
@users = []

10.times do
  @user = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: '123456')
  @users << @user
end

10.times do
  @city = City.new(name: Faker::Address.state)
  @city.save
  @cities << @city
end

20.times do
  make = Faker::Vehicle.make
  file = open(car_pictures.sample)
  puts @car = Car.create!(
    name: Faker::Vehicle.model(make_of_model: make),
    brand: make,
    transmission: Faker::Vehicle.transmission,
    price: Faker::Vehicle.mileage(min: 100, max: 1000),
    seats: Faker::Vehicle.door_count,
    trunk: Faker::Vehicle.mileage(min: 100, max: 1000),
    city: @cities.sample,
    user: @users.sample

    )
  @car.photos.attach(io: file, filename: 'car.png', content_type: 'image/png')
end


