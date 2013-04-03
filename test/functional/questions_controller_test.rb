require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:question_valid)
    @question_fail = questions(:question_invalid_survey_id)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, question: { question: @question.question, question_options: @question.question_options, question_type: @question.question_type, survey_id: @question.survey_id }
    end
    assert_redirected_to question_path(assigns(:question))
  end

test "should not create question" do
    assert_no_difference('Question.count') do
      post :create, question: { question: @question_fail.question, question_options: @question_fail.question_options, question_type: @question_fail.question_type, survey_id: @question_fail.survey_id }
    end
    assert_select "div#error_explanation ul li", "Survey does not exist"
  end


  test "should show question" do
    get :show, id: @question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question
    assert_response :success
  end

  test "should update question" do
    put :update, id: @question, question: { question: @question.question, question_options: @question.question_options, question_type: @question.question_type, survey_id: @question.survey_id }
    assert_redirected_to question_path(assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question
    end

    assert_redirected_to questions_path
  end
end
