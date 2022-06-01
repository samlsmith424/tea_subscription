class ChangeFrequencyToBeIntegerInSubscriptions < ActiveRecord::Migration[5.2]
  def change
    change_column :subscriptions, :frequency, 'integer USING CAST(frequency AS integer)'
  end
end
