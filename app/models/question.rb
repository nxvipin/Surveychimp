class Question < ActiveRecord::Base
  attr_accessible :question, :question_options, :question_type, :survey_id
  belongs_to :survey
  validates :question, :presence => true
  validates :question_type, :presence => true
  validates :question_options, :presence => true
  validates :survey_id, :existence => true
  validates :question_type,
    :inclusion => {
      :in => %w(numeric essay date),
      :message => "Not valid type" }
end
