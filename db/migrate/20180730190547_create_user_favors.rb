class CreateUserFavors < ActiveRecord::Migration[5.2]
  def change
    create_table :user_favors do |t|
      t.references :requester
      t.references :requestee
      t.references :favor

      t.timestamps
    end
  end
end
