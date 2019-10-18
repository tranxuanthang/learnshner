class CreateTestRecordQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :test_record_questions do |t|
      t.references :record, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.integer :number_passed
      t.integer :number_failed

      t.timestamps
    end
  end
end
