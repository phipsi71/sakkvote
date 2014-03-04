class CreateQuestion < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :poke
    end
  end
end
