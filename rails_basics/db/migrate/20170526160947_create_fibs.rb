class CreateFibs < ActiveRecord::Migration[5.1]
  def change
    create_table :fibs do |t|
      t.text :generated_fibs

      t.timestamps
    end
  end
end
