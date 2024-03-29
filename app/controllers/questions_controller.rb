class QuestionsController < ApplicationController

  before_filter :load_survey

  # GET /questions
  # GET /questions.json
  def index
    @questions = @survey.questions.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @questions }
    end
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
    @question = @survey.questions.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/new
  # GET /questions/new.json
  def new
    @question = @survey.questions.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @question }
    end
  end

  # GET /questions/1/edit
  def edit
    @question = Question.find(params[:id])
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = @survey.questions.new(params[:question])

    respond_to do |format|
      if @question.save
        format.html { redirect_to \
          [@survey, @question], \
          notice: 'Question was successfully created.' }
        format.json { render \
          json: @question, \
          status: :created, location: @question }
      else
        format.html { render action: "new" }
        format.json { render \
          json: @question.errors, \
          status: :unprocessable_entity }
      end
    end
  end

  # PUT /questions/1
  # PUT /questions/1.json
  def update
    @question = @survey.questions.find(params[:id])

    respond_to do |format|
      if @question.update_attributes(params[:question])
        format.html { redirect_to \
          [@survey,@question], \
          notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render \
          json: @question.errors, \
          status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question = @survey.questions.find(params[:id])
    @question.destroy

    respond_to do |format|
      format.html { redirect_to @survey }
      format.json { head :no_content }
    end
  end

  private
    def load_survey
      @survey = Survey.find(params[:survey_id])
    end

end
