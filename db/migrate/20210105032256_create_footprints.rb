class CreateFootprints < ActiveRecord::Migration[6.0]
  def change
    create_table :footprints do |t|
      t.text :content
      t.text :references
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
