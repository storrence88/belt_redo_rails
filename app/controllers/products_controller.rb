class ProductsController < ApplicationController
  def index
    @products = Product.all.where(buyer: nil).where.not(user_id: current_user.id)
  end

  def create
      product = Product.create(product_params)
  
      if product.valid?
          product.user_id = current_user.id
          product.save
          redirect_to "/products"
      else
          flash[:errors] = product.errors.full_messages
          redirect_to :back
      end
  end

  def buy
    purchase = Product.find(params[:id])
    purchase.date = Time.now
    purchase.buyer = current_user.id
    purchase.save
    redirect_to :back
  end
  
  def destroy
      trash = Product.find(params[:id])
      trash.destroy
      redirect_to :back
  end
  
  private
  def product_params
      params.require(:product).permit(:name, :amount)
  end
end
