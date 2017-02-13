class UsersController < ApplicationController

  def show
	@user = current_user
	@user_posts = @user.posts.paginate(:page => params[:page], :per_page => 3)
  end

end
