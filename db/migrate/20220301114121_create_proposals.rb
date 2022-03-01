class CreateProposals < ActiveRecord::Migration[6.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.text :description
      t.string :scope
      t.float :budget
      t.date :due_date
      t.references :user, null: false, foreign_key: true
      t.boolean :archive, default: false
      t.string :status

      t.timestamps
    end
  end
end
