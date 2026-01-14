class CreateRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :requests do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :description
      t.integer :status, null:false, default: 0
      t.jsonb :metadata, null: false, default: {}

      t.timestamps
    end
  end
end
