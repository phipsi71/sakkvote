class AddIsActiveToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :is_active, :boolean, default: false
  end
end
