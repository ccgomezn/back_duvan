class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :state, default: 'En proceso'
      t.string :name
      t.timestamps
    end
  end
end
