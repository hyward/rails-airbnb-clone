Car.destroy_all
City.destroy_all
User.destroy_all

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

100.times do
  make = Faker::Vehicle.make
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
end


