class AddVotesToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :nof_votes, :integer
  end
end
