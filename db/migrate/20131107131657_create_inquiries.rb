class CreateInquiries < ActiveRecord::Migration
  def change
    create_table :inquiries do |t|
      t.string :answer
      t.string :remark

      t.timestamps
    end
  end
end
