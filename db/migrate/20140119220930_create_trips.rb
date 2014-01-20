class CreateTrips < ActiveRecord::Migration
  def change
    create_table :trips do |t|
      t.string :name
      t.string :place
      t.decimal :price, :precision => 7, :scale => 2
      t.date :from
      t.date :to
      t.string :photo
      t.text :description

      t.timestamps
    end
  end
end
