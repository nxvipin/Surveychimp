require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  
  test "Question should be added" do
    question = questions(:question_valid)
    assert question.valid?
  end
  
  test "Question attributes must not be empty" do
    question = Question.new
    assert question.invalid?
    assert question.errors[:question].any?
    assert question.errors[:question_type].any?
    assert question.errors[:question_options].any?
    assert question.errors[:survey_id].any?
  end

  test "survey_id of the question must exist" do
    question = questions(:question_invalid_survey_id)
    assert question.invalid?
    assert question.errors[:survey_id], "does not exist"
  end

  test "question type must be either 'numeric' or 'essay' or 'date'" do
    question = questions(:question_invalid_type)
    assert question.invalid?
  end

end
