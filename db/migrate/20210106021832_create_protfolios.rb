class CreateProtfolios < ActiveRecord::Migration[6.0]
  def change
    create_table :protfolios do |t|
      t.references :user, null: false
      t.string :title, null: false
      t.text :content, null: false
      t.text :url, null: false
      t.timestamps
    end
  end
end
