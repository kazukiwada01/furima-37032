class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :purchase_item, only: [:edit, :destroy]

  def index
    @items = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.delete
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
  
  def purchase_item
    redirect_to action: :index if @item.user_id != current_user.id || !@item.purchase.nil?
  end

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :status_id, :delivery_fee_id, :ship_from_id,
                                 :ship_day_id, :price).merge(user_id: current_user.id)
  end
end
