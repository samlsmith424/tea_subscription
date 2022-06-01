class ChangeStatusToBeIntegerInSubscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :status, 'integer USING CAST(status AS integer)'
  end
end
