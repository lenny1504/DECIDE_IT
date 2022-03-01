class ChangeStatusToSteps < ActiveRecord::Migration[6.1]
  def change
    change_column :steps, :status, :string, default: "created"
  end
end
