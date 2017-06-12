class AddTempAnswerToQuestions < ActiveRecord::Migration[5.0]
  def change
    add_column :questions, :temp_answer, :text
  end
end
