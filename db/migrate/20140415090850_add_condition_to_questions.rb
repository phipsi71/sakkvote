class AddConditionToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :condition, :text
  end
end
