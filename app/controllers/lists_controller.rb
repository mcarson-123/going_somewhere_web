class ListsController < ApplicationController

  def index
    @lists = List.get_all
  end

  def show
    @list = List.find_by_id(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(params["list"])
    redirect_to "/lists/#{@list.id}"
  end

end
