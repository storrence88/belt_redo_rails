class UsersController < ApplicationController
    def create
        if params[:user][:password] == params[:user][:password_confirmation]
            new_user = User.create(user_params)
        else
            flash[:errors] = ["Passwords do not match"]
              redirect_to :back
        end
        
        if new_user
            if new_user.valid?
              session[:user_id] = new_user.id
              redirect_to "/products"
            else
              flash[:errors] = new_user.errors.full_messages
              redirect_to :back
            end
        end
    end

    def show
        @not_sold = Product.all.where(user_id: current_user.id).where(buyer: nil)
        @sold = Product.all.where(user_id: current_user.id).where.not(buyer: nil)
        @purchased = Product.all.where(buyer: current_user.id)
    end

    private
    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
