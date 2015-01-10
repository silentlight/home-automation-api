class AddSensorsTable < ActiveRecord::Migration
  def change
    create_table :sensors do |t|
      t.column :value, :string, null: false
      t.column :type, :string, null: false
      t.column :created_at, :datetime, null: false
    end
  end
end
