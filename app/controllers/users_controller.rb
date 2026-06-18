class UsersController < ApplicationController
        
    def create
        @user = User.new(params[:user_id])
        if @user.save
            redirect_to @user
        else
            render "new"
        end    
    end


    def new
        @user = User.new
    end
# unsure if my naming conventions are correct here, Should this instyance veriable be @SighUp = SignUp.new?
end

