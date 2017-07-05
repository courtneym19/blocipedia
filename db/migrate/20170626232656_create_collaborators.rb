class CreateCollaborators < ActiveRecord::Migration
  def change
    create_table :collaborators do |t|
      t.references :user_id, foreign_key: true
      t.references :wiki_id, foreign_key: true

      t.timestamps
    end

    add_index :collaborators, :id, unique: true
    add_index :collaborators, :user_id
    add_index :collaborators, :wiki_id
  end
end
