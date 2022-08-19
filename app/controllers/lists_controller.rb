class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    @list.save
    redirect_to @list
  end

  def show
    @bookmarks = Bookmark.where(list_id: @list.id)
    #@bookmarks = Bookmark.where(list: @list)
  end

  def edit
  end

  def update
    if @list.update(list_params)
      redirect_to @list, notice: "List was updated successfully"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
  end

private

  def list_params
    params.required(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
