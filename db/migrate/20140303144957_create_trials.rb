class CreateTrials < ActiveRecord::Migration
  def change
    create_table :trials do |t|
      t.decimal :trl_code
      t.string :trl_name

      t.timestamps
    end
  end
end
