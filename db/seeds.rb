# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Photo.delete_all
Comment.delete_all

puts "Creating Photos and Comments..."

cape_good_hope = Photo.create! caption: "Cape of Good Hope!", public: true, image: "https://upload.wikimedia.org/wikipedia/commons/2/2b/Cape_of_Good_Hope.jpg"
Comment.create! body: "Was great"

kevin = User.create! email: "hi@hi.com", password: "password", password_confirmation: "password"


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
