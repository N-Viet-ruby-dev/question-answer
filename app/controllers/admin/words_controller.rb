class Admin::WordsController < ApplicationController
  def index
    if params[:category_id].blank?
      @words = Word.paginate page: params[:page], per_page: 100
    else
      category = Category.find params[:category_id]
      @words = category.words.paginate page: params[:page], per_page: 100
    end
  end

  def new
    if params[:category_id].blank?
      @word = Word.new
    else
      @category = Category.find params[:category_id]
      @word = @category.words.new
    end
    4.times { @word.answers.build }
  end

  def edit
    if params[:category_id].blank?
      @word = Word.find params[:id]
    else
      @category = Category.find params[:category_id]
      @word = @category.words.find params[:id]
    end
  end

  def create
    @word = if category
              @category.words.new word_params
            else
              Word.new word_params
            end

    if @word.save
      redirect_to admin_categories_path, success: "New word created!"
    else
      render :new
    end
  end

  def update
    @word = Word.find params[:id]
    if @word.update word_params
      flash[:success] = "Word updated"
      redirect_to admin_words_url
    else
      render :edit
    end
  end

  def destroy
    Word.find(params[:id]).destroy
    flash[:success] = "Word deleted"
    redirect_to admin_words_url
  end

  private

  def word_params
    params.require(:word).permit :japanese, :category_id, answers_attributes: [:id, :content, :correct, :_destroy]
  end

  def category
    @category ||= Category.find params[:category_id] if params[:category_id].present?
  end
end
