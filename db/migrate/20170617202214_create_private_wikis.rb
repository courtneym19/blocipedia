class CreatePrivateWikis < ActiveRecord::Migration
  def change
    create_table :private_wikis do |t|
      t.string :title
      t.text :body

      t.timestamps null: false
    end
  end
end
