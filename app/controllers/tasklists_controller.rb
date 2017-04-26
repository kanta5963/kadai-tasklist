class TasklistsController < ApplicationController
   before_action :set_tasklist, only: [:show, :edit, :update, :destroy]
   
  def index
    @tasklist = Tasklist.all
  end
  
  def show
  end
  
  def new
    @tasklist = Tasklist.new
  end
  
  def create
    @tasklist = Tasklist.new(tasklist_params)
    
    if @tasklist.save
      flash[:success] = '投稿できました。'
      redirect_to @tasklist
    else
      flash.now[:danger] = '投稿出来ませんでした。'
      render :new
    end
  end

  def edit
  end
  
  def update
    if @tasklist.update(tasklist_params)
      flash[:success] = '正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = '更新されませんでした'
      render :edit
    end
  end
  
  def destroy
    @tasklist.destroy

    flash[:success] = '正常に削除されました'
    redirect_to tasklists_url
  end
  
  private
  
  def set_tasklist
    @tasklist = Tasklist.find(params[:id])
  end
  
  def tasklist_params
    params.require(:tasklist).permit(:content, :status)
  end
end
