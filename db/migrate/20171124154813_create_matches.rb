class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :user_id
      t.date :date_played
      t.integer :opponent_id
      t.integer :oppent_score
      t.integer :own_score

      t.timestamps null: false
    end
  end
end
