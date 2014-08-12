class Restart2 < ActiveRecord::Migration
  create_table :restaurants do |t|
    t.string :name
    t.string :state
    t.string :city
    t.text   :cuisine
  end

  create_table :reviews do |t|
    t.text    :description
    t.integer :review
    t.integer :restaurant_id
    t.string  :reviewer_name
    t.string :created_time
    t.integer :user_id
  end

  create_table :users do |u|
    u.text :name
  end
end
