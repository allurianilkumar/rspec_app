class CreateAdmins < ActiveRecord::Migration[7.1]
  def change
    create_table :admins do |t|
      t.string :firstname
      t.string :lastname

      t.timestamps
    end
  end
end
