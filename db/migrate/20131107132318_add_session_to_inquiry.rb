class AddSessionToInquiry < ActiveRecord::Migration
  def change
    add_column :inquiries, :session_id, :string
  end
end
