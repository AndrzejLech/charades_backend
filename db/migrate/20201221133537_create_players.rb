class CreatePlayers < ActiveRecord::Migration[6.0]
  def change
    create_table :players do |t|
      t.string :game_id
      t.string :name
      t.integer :points
    end
  end
end
