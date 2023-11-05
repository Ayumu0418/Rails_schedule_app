class ListsController < ApplicationController
    def index
      @lists = List.all
    end
  
    def new
      @list = List.new(
      title: "", 
      start: Date.today,
      end: Date.today,
      allday: false,
      memo: ""
      ) 
    end
  
    def create
      @list = List.new(params.require(:list).permit(:title, :start, :end, :allday, :memo))
      if @list.save
        flash[:notice] = "予定を登録しました"
        redirect_to lists_path
      else
        render "new"
      end
    end
  
    def show
      @list = List.find(params[:id])
    end
  
    def edit
      @list = List.find(params[:id])
    end
  
    def update
      @list = List.find(params[:id])
      if @list.update(params.require(:list).permit(:title, :start, :end, :allday, :memo))
        flash[:notice] = "ユーザーIDが「#{@list.id}」の情報を更新しました"
        redirect_to :lists
      else
        render "edit"
      end
    end
  
    def destroy
      @list = List.find(params[:id])
      @list.destroy
      flash[:notice] = "ユーザーを削除しました"
      redirect_to :lists
    end
  
end
