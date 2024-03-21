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
                 id: 1,
                 name: 'Keu Occidental Food',
                 short_name: 'Keu',
                 category: 'restaurant',
                 status: 'ok',
                 last_checked: Time.zone.now.to_datetime,
                 website_url: 'https://kao.cl/',
                 photo_url: 'https://images.unsplash.com/photo-1552914343-54bcc3ba07f8?q=80&w=1984&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
               },
               {
                 id: 2,
                 name: 'Aguacate Mexican Grill',
                 short_name: 'Aguacate',
                 category: 'restaurant',
                 status: 'ok',
                 last_checked: Time.zone.now.to_datetime,
                 website_url: 'https://guacamole.cl/',
                 photo_url: 'https://images.unsplash.com/photo-1582169296194-e4d644c48063?q=80&w=2000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'
               }
             ])
Device.create([
                {
                  store_id: 1,
                  category: 'printer',
                  status: 'ok',
                  last_checked: Time.zone.now.to_datetime
                },
                {
                  store_id: 2,
                  category: 'printer',
                  status: 'ok',
                  last_checked: Time.zone.now.to_datetime
                }
              ])
Server.create([
                {
                  store_id: 1,
                  category: 'web',
                  status: 'ok',
                  last_checked: Time.zone.now.to_datetime
                },
                {
                  store_id: 2,
                  category: 'web',
                  status: 'ok',
                  last_checked: Time.zone.now.to_datetime
                },
                {
                  store_id: 1,
                  category: 'database',
                  status: 'ok',
                  last_checked: Time.zone.now.to_datetime
                },
                {
                  store_id: 2,
                  category: 'database',
                  status: 'ok',
                  last_checked: Time.zone.now.to_datetime
                }
              ])
