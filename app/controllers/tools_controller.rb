class ToolsController < ApplicationController
  def index
    @tools = current_user.tools
  end


  def show
    @tool = Tool.find(params[:id])
    cookies[:most_recent_tool_id] = @tool.id
  end

  def new
    @tool = Tool.new
  end

  def create
    @user = current_user
    @tool = @user.tools.new(tool_params)

    if @tool.save
      redirect_to tool_path(@tool.id)
      flash[:notice] = "Tool created!"
    else
      flash[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def edit
    @tool = Tool.find(params[:id])
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update(tool_params)
      redirect_to tool_path(@tool.id)
    else
      render :edit
    end
  end

  def destroy
    tool = Tool.find(params[:id])
    tool.destroy
    redirect_to tools_path
  end

  private

  def tool_params
    params.require(:tool).permit(:name, :price, :quantity, :category_id)
  end
end
