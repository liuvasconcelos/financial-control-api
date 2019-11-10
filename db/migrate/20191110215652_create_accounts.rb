class CreateAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :accounts do |t|
      t.string :title
      t.float :value
      t.date :expire_date
      t.string :category
      t.string :status

      t.timestamps
    end
  end
end
