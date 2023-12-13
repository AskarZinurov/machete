class CreateVisits < ActiveRecord::Migration[7.1]
  def change
    create_table :visits do |t|
      t.belongs_to :link, null: false
      t.json :agent, default: {}

      t.timestamps
    end
  end
end
