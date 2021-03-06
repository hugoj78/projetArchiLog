# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Review.destroy_all
Tome.destroy_all
Manga.destroy_all
User.destroy_all

puts 'Creating User'

admin = User.create(email: 'admin@manga.com', password: '123456', admin: true);
user = User.create(email: 'user@manga.com', password: '123456', admin: false);

['Naruto', 'One Piece', 'SNK', 'Death Note'].each do |name|
    manga = Manga.create(name: name, user_id: admin.id);
    for i in 1..5 do
      tome = Tome.create(title: "tome #{i}", manga_id: manga.id, user_id: admin.id, number: i);

      list_review = ["nul/20", "Ah OK quoi", "Je suis mitigé", "Vreeeuuumment bien", "Wow incroyable wesh canne à pêche"]
      list_review.each do |description|
        Review.create(description: description, rating: list_review.index(description), tome_id: tome.id, user_id: admin.id);
      end
    end
    puts "#{name} created"
  end
  puts 'Manga and Tome created'