class ListsController < ApplicationController

  def show
    @list = List.find_by_id(params[:id])
    @list_items = ListItem.get_all({list_id: params[:id]})
    @new_list_item = ListItem.new
  end

  def new
    @list = List.new
  end

  def create
    @list = List.create(params["list"])
    redirect_to "/trips/#{@list.trip_id}"
  end

  def destroy
    List.destroy_by_id(params[:id])
    redirect_to "/trips/#{params[:trip_id]}"
  end

end
