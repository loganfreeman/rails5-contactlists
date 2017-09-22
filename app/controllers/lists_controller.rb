class ListsController < ApplicationController
  def index
    @lists = List.order('created_at DESC')
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "List succesfully added!"
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
  	@list = List.find(params[:id])
  	if @list.update(list_params)
      flash[:notice] = "List succesfully updated!"
  		redirect_to lists_path
  	else
  		render :edit
  	end
  end

  def destroy
  	@list = List.find(params[:id])
  	@list.destroy
    flash[:alert] = "List succesfully deleted!"
  	redirect_to lists_path
  end

  private
  def list_params
    params.require(:list).permit(:name)
  end
end
