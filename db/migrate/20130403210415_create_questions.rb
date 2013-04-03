class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.string :question_type
      t.text :question_options
      t.integer :survey_id

      t.timestamps
    end
  end
end
