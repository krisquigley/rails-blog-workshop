class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.references :post, null: false, index: true, foreign_key: true
      t.string :name, null: false
      t.text :body, null: false
      t.timestamps
    end
  end
end
