# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Store.create([
               {
                 name: 'Keu Occidental Foods',
                 category: 'restaurant',
                 status: 'ok',
                 photo_url: 'https://images.unsplash.com/photo-1552914343-54bcc3ba07f8?q=80&w=1984&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
               },
               {
                 name: 'Aguacate',
                 category: 'restaurant',
                 status: 'ok',
                 photo_url: 'https://images.unsplash.com/photo-1582169296194-e4d644c48063?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
               }
             ])
