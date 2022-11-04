class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :article_id
      t.string :description

      t.timestamps
    end
  end
end
