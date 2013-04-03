require 'test_helper'

class SurveyTest < ActiveSupport::TestCase

  test "Survey should be added" do
    survey = surveys(:survey_valid)
    assert survey.valid?
  end
  
  test "Survey attributes must not be empty" do
    survey = Survey.new
    assert survey.invalid?
    assert survey.errors[:title].any?
    assert survey.errors[:description].any?
  end

end
