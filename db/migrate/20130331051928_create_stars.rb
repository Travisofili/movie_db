class CreateStars < ActiveRecord::Migration
  def change
    create_table :stars do |t|
      t.integer :actor_id
      t.integer :movie_id
      t.string :character

      t.timestamps
    end
  end
end
