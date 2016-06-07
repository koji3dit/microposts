class CreatePostimages < ActiveRecord::Migration
  def change
    create_table :postimages do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
