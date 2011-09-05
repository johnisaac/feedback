class AnswersController < ApplicationController
  respond_to :html, :json, :xml
  
  def new
    @answer = Answer.new
    respond_to do|format|
      format.html
    end
  end

  def create
    @answer = Answer.new(params[:Answer])
    if @answer.save
      redirect_to question_path(params[:question_id])
    else
      render :new
    end
  end
  
  def edit
    @answer = Answer.find(params[:id])
    respond_with(@answer)
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update_attributes(params[:answer])
      redirect_to question_path(params[:question_id])
    else
      render :edit
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
    respond_with(@answer)
  end
  
  def index
    @answers = Question.find(params[:question_id]).answers
    respond_with(@answers)
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    redirect_to question_url(params[:question_id])
  end

end
