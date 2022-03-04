class ChangeColumnToProposal < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:proposals, :status, from: nil, to: "initiated")
  end
end
