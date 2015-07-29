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

puts "Creating Photos and Comments..."

kevin = User.create! email: "hi@hi.com", password: "password", password_confirmation: "password"

jon = User.create! email: "ho@ho.com", password: "password", password_confirmation: "password"

cape_good_hope = Photo.create! caption: "Cape of Good Hope!", user_id: kevin.id, public: true, image: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Cape_of_Good_Hope.jpg"
Comment.create! body: "Was great"

boulders = Photo.create! caption: "Boulders #Beach", public: true, user_id: jon.id, image: "https://upload.wikimedia.org/wikipedia/commons/3/34/Boulders_Bay.jpg"
Comment.create! body: "Was very great"
Comment.create! body: "Was awesome"


# boulders.hashtags.create tag: "#Beach"

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
