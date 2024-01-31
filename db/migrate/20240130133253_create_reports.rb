class CreateReports < ActiveRecord::Migration[7.1]
  def change
    create_table :reports do |t|
      t.string :title
      t.text :content
      t.datetime :date
      t.integer :emp_transid
      t.string :report_type
      t.string :office
      t.integer :user_id
      t.string :remarks

      t.timestamps
    end
  end
end
