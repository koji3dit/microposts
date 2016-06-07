class AddImageToPostimages < ActiveRecord::Migration
  def change
    add_column :postimages, :image, :string
  end
end
