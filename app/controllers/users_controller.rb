class UsersController < ApplicationController

  def show
	@user = current_user
	@users = User.all.paginate(:page => params[:page], :per_page => 8)
	@user_posts = @user.posts.paginate(:page => params[:page], :per_page => 3)
	@order_posts = OrderPost.all.paginate(:page => params[:page], :per_page => 8)
  end

end
