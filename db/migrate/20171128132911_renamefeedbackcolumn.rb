class Renamefeedbackcolumn < ActiveRecord::Migration[5.1]
  def change
    rename_column :delivery_orders, :feedback, :feedback_submitted
  end
end
