class PagesController < ApplicationController
  def home
    @post = Post.new
    @comment = Comment.new
    @users = User.all
    timeline_posts
    who_to_follow
    @user = current_user
  end

  def profile
    @user = User.find_by_username(params[:username])
    @posts = @user.posts.ordered_by_most_recent
    @post = Post.new
  end

  private

  def who_to_follow
    following_array = current_user.followees.map { |friend| friend }
    @user_timeline = User.where.not(id: following_array << current_user).all
  end

  def timeline_posts
    following_array = current_user.followees.map { |friend| friend }
    @timeline_posts ||= Post
      .where(author: following_array.compact << current_user)
      .all
      .ordered_by_most_recent
      .includes(:author)
  end
end
