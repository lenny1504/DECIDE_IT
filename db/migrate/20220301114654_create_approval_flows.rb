class CreateApprovalFlows < ActiveRecord::Migration[6.1]
  def change
    create_table :approval_flows do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :proposal, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
