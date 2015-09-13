class ListItemsController < ApplicationController

  def create
    @list_item = ListItem.create(params[:list_item])
    redirect_to "/lists/#{@list_item.list_id}"
  end

  def destroy
    ListItem.destroy_by_id(params[:id])
    redirect_to "/lists/#{params[:list_id]}"
  end

end
