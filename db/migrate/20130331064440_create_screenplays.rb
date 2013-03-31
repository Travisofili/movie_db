class CreateScreenplays < ActiveRecord::Migration
  def change
    create_table :screenplays do |t|
      t.integer :actor_id
      t.integer :movie_id

      t.timestamps
    end
  end
end
