class CreateGratitudes < ActiveRecord::Migration[7.1]
  def change
    create_table :gratitudes do |t|
      t.string :user_id
      t.string :entry
      t.string :date

      t.timestamps
    end
  end
end
