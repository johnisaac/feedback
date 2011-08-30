class QuestionsController < ApplicationController
  respond_to :html, :json, :xml
  def new
    @question = Question.new
    respond_with(@question)
  end

  def create
    @question = Question.new(params[:question])
    if @question.save
      respond_with(@question)
    else
      render :new
    end
  end
  
  def edit
    @question = Question.find(params[:id])
    respond_with(@question)
  end

  def update
    @question = Question.find(params[:id])
    if @question.update_attributes(params[:question])
      respond_with(@question)
    else
      render :edit
    end
  end
  
  def show
    @question = Question.find(params[:id])
    respond_with(@question)
  end
  
  def index
    @questions = Question.all
    respond_with(@questions)
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_url
  end

end
