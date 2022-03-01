class CreateLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :logs do |t|
      t.references :step, null: false, foreign_key: true
      t.string :original_status
      t.string :updated_status

      t.timestamps
    end
  end
end
