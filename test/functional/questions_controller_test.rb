require 'test_helper'

class QuestionsControllerTest < ActionController::TestCase
  setup do
    @question = questions(:question_valid)
    @question_fail = questions(:question_invalid_survey_id)
  end

  test "should get index" do
    get :index, :survey_id => @question.survey_id
    assert_response :success
    assert_not_nil assigns(:questions)
  end

  test "should get new" do
    get :new, :survey_id => @question.survey_id
    assert_response :success
  end

  test "should create question" do
    assert_difference('Question.count') do
      post :create, \
      question: { \
        question: @question.question, \
        question_options: @question.question_options, \
        question_type: @question.question_type, \
        survey_id: @question.survey_id }, \
      :survey_id => @question.survey_id
    end
    assert_redirected_to survey_question_path(@question.survey_id, \
                                              assigns(:question))
  end

  test "should show question" do
    get :show, id: @question, :survey_id => @question.survey_id
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question, :survey_id => @question.survey_id
    assert_response :success
  end

  test "should update question" do
    put :update, id: @question, \
    question: { \
      question: @question.question, \
      question_options: @question.question_options, \
      question_type: @question.question_type, \
      survey_id: @question.survey_id }, \
    :survey_id => @question.survey_id
    assert_redirected_to survey_question_path(@question.survey_id, \
                                              assigns(:question))
  end

  test "should destroy question" do
    assert_difference('Question.count', -1) do
      delete :destroy, id: @question, :survey_id => @question.survey_id
    end

    assert_redirected_to survey_path @question.survey_id
  end
end
