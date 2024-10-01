# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# https://1000randomnames.com

names = ['Keilani Hart',
'Joel Rich',
'Sunny Ramirez',
'David Pennington',
'Yareli Parks',
'Gianni Richardson',
'Allison Nixon',
'Cory Schmidt',
'Kimberly Rivers',
'Bear French',
'Lorelai Sims',
'Brian Burgess',
'Emory Randolph',
'Eugene Larson',
'Alayna Watson',
'Greyson Contreras',
'Daniela Chambers',
'Orion Willis',
'Alexa Boone',
'Mauricio Bullock',
'Winnie Choi',
'Khari Myers',
'Lydia Burch',
'Gerald Arellano',
'Faye Shannon',
'Eliel Massey',
'Clementine Lambert',
'Mario Farrell',
'Kassidy Keith',
'Jagger McCormick',
'Macie Smith',
'Liam Khan',
'Mabel McGee',
'Conner McCall',
'Kai Shaw',
'Elliot Richardson',
'Allison Carlson',
'Paul Garner',
'Jacqueline Serrano',
'Milan Barry',
'Waverly Turner',
'Joshua Farmer',
'Madelynn Gilbert',
'Tobias Goodwin',
'Shiloh Summers',
'Darius Horton',
'Aitana Jennings',
'Corbin Foster',
'Brielle Vance',
'Casen Gill']

homerooms = %w[117 120B 213 227]
grad_years = (2025..2028).to_a
names.each do |name|
  first,last = name.split(/ +/)
  student = {first: first, last: last, homeroom: homerooms.sample,
             graduation_year: grad_years.sample}
  Student.create!(student)
end

