class ItemsController < ApplicationController
  before_action :find_list
 
  def create
    @item = @list.items.create(item_params) 
    
    redirect_to @list
  end

  def destroy
    @item = @list.items.find_by(params[:id])
    if @item.destroy
      flash[:notice] = "Task was delete!"
    else
      flash[:alert] = "Task could not be delete!"
    end
    redirect_to @list
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:content)
  end
end
