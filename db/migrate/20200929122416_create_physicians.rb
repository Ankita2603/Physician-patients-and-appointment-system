class CreatePhysicians < ActiveRecord::Migration[6.0]
  def change
    create_table :physicians do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :department

      t.timestamps
    end
  end
end
