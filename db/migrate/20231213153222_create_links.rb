class CreateLinks < ActiveRecord::Migration[7.1]
  def change
    create_table :links do |t|
      t.text :url
      t.text :signature
      t.integer :visits_count, default: 0

      t.timestamps
    end

    add_index :links, :signature, unique: true
  end
end
