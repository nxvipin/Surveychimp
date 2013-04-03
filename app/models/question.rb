class Question < ActiveRecord::Base
  attr_accessible :question, :question_options, :question_type, :survey_id
end
