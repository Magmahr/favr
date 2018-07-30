class CreateUserFavors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favors do |t|
      t.references :requester, foreign_key: true
      t.references :requestee, foreign_key: true
      t.references :favor, foreign_key: true

      t.timestamps
    end
  end
end
