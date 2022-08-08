class ReadsController < ApplicationController

  def index
    @blogs = Blog.all
    @total_count = @blogs.all.size
    @blog = Read.find(params[:id])
    @blogs = @blogs.order('created_at desc').page(params[:page]).per(100)
    @blogs = @blogs.where('title like ?', "%#{params[:blog_title]}%") if params[:blog_title].present?
    @blogs = @blogs.where('content like ?', "%#{params[:blog_content]}%") if params[:blog_content].present?
  end

  def show
  end

end
