class PapersController < ApplicationController

  def index
    @papers = Paper.all

  end

  def show
    @paper = Paper.find(params[:id])
  end

  def new
    @paper = Paper.new
  end

  def edit

  end

  def create
    @paper = Paper.new(paper_params)
    if @paper.save
      redirect_to @paper
    else
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

  private

  def paper_params
    params.require(:paper).permit(:title, :venue, :year)
  end

end
