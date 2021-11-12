class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def show
    @list = find_list
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
    redirect_to list_path(@list)
    else
      render :new
    end
  end

  private

  def find_list
    List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name)
  end

end
