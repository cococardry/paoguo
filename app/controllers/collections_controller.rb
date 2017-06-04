class CollectionsController < ApplicationController
  def index
    @collections=Collection.all
  end
  def show
    @collection=Collection.find(params[:id])
    # @answer=Answer.new
  end
  def saveAnswer
    @collection=Collection.find(params[:id])
    # for i in 1..@collection.questions.count
    @collection.questions.each do |question|
        @answer=Answer.new(answer_params)
        @answer.question_id=question.id

    end
  end
  def new
    @collection=Collection.new
    @questions=Question.all
  end

  def create
    @collection=Collection.new(collection_params)
    if @collection.save
      redirect_to collections_path
    else
      render :new
    end
  end

  def edit
    @collection=Collection.find(params[:id])
    # binding.pry
    @questions=Question.all
  end

  def update
    @collection=Collection.find(params[:id])

    for ii in 1..Question.count
      @question=Question.find(ii)

      @question.update(params[:is_included])

      if @question.is_included
        byebug
        if !@question.collections.include?(@collection)
          @question.collection_id=params[:id]
        end

      else
        if @question.collections.include?(@collection)
          @question.collections.delete(params[:id])
        end
      end
    end

    if @collection.update(collection_params)
      redirect_to collections_path
    else
      render :edit
    end


  end
  def join

    @collection=Collection.find(collection.id)
      # byebugs
    @question=Question.find[params[:id]]
    @collection.join!(@question)
    # redirect_to questions_path
    # end
  end

  private
  def answer_params
    params.require(:answer).permit(:content)
  end
  def collection_params
    params.require(:collection).permit(:title,:content,:price, :is_included)
  end
end
