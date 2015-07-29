# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Photo.delete_all
Comment.delete_all
User.delete_all
Hashtag.delete_all

puts "Creating Photos and Comments..."

kevin = User.create! email: "hi@hi.com", password: "password", password_confirmation: "password"
jon = User.create! email: "ho@ho.com", password: "password", password_confirmation: "password"

cape_good_hope = Photo.create! caption: "Cape of Good Hope... I thought I was going to fall off this #cliff and die", user_id: kevin.id, public: true, image: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Cape_of_Good_Hope.jpg"


boulders = Photo.create! caption: "Boulders #Beach is so rad I fuckin' love penguins WOW", public: true, user_id: jon.id, image: "https://upload.wikimedia.org/wikipedia/commons/3/34/Boulders_Bay.jpg"

wow = Photo.create! caption: "#SouthAfrica is so so great I haven't seen an elephant yet but look how cute this is!", public: false, user_id: jon.id, image: "http://travelphotos.picturetheplanet.com/Africa/South-Africa/Wildlife/i-jFJKrBp/0/XL/Wildlife-South-Africa-21-XL.jpg"


Comment.create! body: "Was great", photo: cape_good_hope, user_id: jon.id
Comment.create! body: "Was awesome", photo: boulders, user_id: kevin.id
Comment.create! body: "Was very great", photo: wow, user_id: jon.id



boulders.hashtags.create tag: "#Beach"
wow.hashtags.create tag: "#SouthAfrica"
cape_good_hope.hashtags.create tag: "#cliff"


  # create_table "comments", force: :cascade do |t|
  #   t.text     "body"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end

  # create_table "photos", force: :cascade do |t|
  #   t.boolean  "public"
  #   t.text     "caption"
  #   t.string   "image"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  # end
