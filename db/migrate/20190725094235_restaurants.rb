# :reek:FeatureEnvy and :reek:TooManyStatements and :reek:UncommunicativeVariableName
class Restaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name, null: false
      t.string :address, null: false
      t.text :short_description
      t.text :full_description
      t.timestamps
    end
  end
end
