class UsersController < ApplicationController
  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find(params[:id])

    add_breadcrumb @user.name, user_path(@user)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
