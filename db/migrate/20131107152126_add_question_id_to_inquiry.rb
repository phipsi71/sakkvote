class AddQuestionIdToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :question_id, :integer
  end
end
