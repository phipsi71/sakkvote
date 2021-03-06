class QuestionsController < ApplicationController

  before_action :authenticate_admin
  before_action :set_question, only: [:show, :edit, :update, :destroy, :set_active]


  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    get_active
    #_get_nofa
    @active_question_count = Question.nofAnswers(get_active)
    logger.debug "act_quest_count : #{@active_question_count}"
    @active_question.update(nof_votes: @active_question_count) if @active_question != nil
    Question.set_false
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end


  def destroy_all
    Question.destroy_all
    redirect_to questions_path, notice:"Deleted all questions and votes"
  end


  def destroy_all_votes
    Inquiry.destroy_all
    Question.update_all({:nof_votes => 0})
    redirect_to questions_path, notice:"Deleted all votes"
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  def set_active
    #@qa = Question.all
    #@qa.each do |x|   # setze alle auf false
    #    x.is_active = 'false' 
    #    x.save
    #end
    #logger.debug "function set_active entered"
    Question.set_false  # alle Records auf 'false' setzen
    set_question        # find current active question
    @question.is_active = 'true' # setzt nur current auf 'true'
    @question.save
    _get_nofa
    #@active_question_count = Question.nofAnswers(get_active) 
    #logger.debug "function set_active exit"
  end

  def _get_nofa
    logger.debug "function get_nofa entered"
    @active_question_count = Question.nofAnswers(get_active)
    logger.debug "nofa: #{@active_question_count}"
    #@active_question_count

    respond_to do |format|
      msg = { active_question_count: @active_question_count }
      format.html
      format.js
      format.json { render json: msg }
    end

  end

  def get_active
    logger.debug "function get_active entered"
    @active_question = Question.active.first
  end


  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params) #   question_params is a hash:    {"poke"=>"Haben Sie viele Kinder?", "is_active"=>"0"}
    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render action: 'show', status: :created, location: @question }
      else
        format.html { render action: 'new' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url }
      format.json { head :no_content }
    end
  end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:poke, :is_active, :nof_answers, :condition)
    end


end
