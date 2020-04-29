class ItemsController < ApplicationController
  before_action :find_list
  before_action :find_item, except: [:create]
 
  def create
    @item = @list.items.create(item_params) 
    
    if @item.save 
      flash[:notice] = "Create Item success!"
    else
      flash[:notice] = "Please create your Todo!"
    end
    redirect_to @list
  end

  def destroy

    if @item.destroy
      flash[:notice] = "Item was delete!"
    else
      flash[:notice] = "Item could not be delete!"
    end
    redirect_to @list
  end

  def complete
    @item.update_attribute(:completed_at, Time.now)
    redirect_to @list, notice: "Item complete"
  end

  def incomplete
    if @item.completed?
      @item.update_attribute(:completed_at, nil)
      redirect_to @list, notice: "Item rollback"
    end
  end

  private

  def find_list
    @list = List.find(params[:list_id])
  end

  def find_item
    @item = @list.items.find_by(params[:id])
  end

  def item_params
    params.require(:item).permit(:content)
  end
end
