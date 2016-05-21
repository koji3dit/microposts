class CreatePlofiles < ActiveRecord::Migration
  def change
    create_table :plofiles do |t|
      t.string :nickname
      t.string :pr
      t.string :place
      t.string :wwebsite
      t.date :birthday

      t.index:nickname,unique: true #重複ニックネームを排除
      t.timestamps null: false
    end
  end
end
