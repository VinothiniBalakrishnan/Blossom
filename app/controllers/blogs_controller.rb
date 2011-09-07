class BlogsController < ApplicationController

before_filter :authenticate_user!, :except => [:show, :index, :new, :create]

  def index
    @blogs = Blog.all.paginate(:per_page => 2, :page => params[:page])
  end

  def new
    @blog = Blog.new
  end
  
  def create 
    @blog = Blog.create(params[:blogs])
    if @blog.save
      redirect_to :action => "show", :id=>@blog.id
    else
      render :action => "new"
    end
  end 
  
  def show 
    @blog = Blog.find(params[:id])
  end
  
  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])

    if @blog.update_attributes(params[:blog])
      redirect_to :action =>"show", :id=>@blog.id
   else
      render :action => "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to "/"
  end
  

end
