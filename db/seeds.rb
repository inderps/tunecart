# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
if User.where(email: 'hannahpearl@hotmail.com').empty?
  user = User.create(email: 'hannahpearl@hotmail.com')
  album = user.albums.create
  25.times do
    Coupon.create(album: album, code: rand.to_s[2..7])
  end
end