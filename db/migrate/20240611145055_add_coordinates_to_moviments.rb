class AddCoordinatesToMoviments < ActiveRecord::Migration[7.1]
  def change
    add_column :movements, :latitude, :float
    add_column :movements, :longitude, :float
  end
end
