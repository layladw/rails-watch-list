class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(book_mark_params)
    @list = List.find(params[:list_id])
    @bookmark.list = @list
    if @bookmark.save
    redirect_to list_path(@list)
    else
      render :new
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @list = @bookmark.list
    @bookmark.destroy
    redirect_to list_path(@list)
  end

  private

  def book_mark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end
end