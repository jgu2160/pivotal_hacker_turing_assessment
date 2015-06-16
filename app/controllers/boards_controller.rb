class BoardsController < ApplicationController

  def index
    @boards = Board.all
  end

  def show
    @board = Board.find(params[:id])
    @ticket = Ticket.new
    @tickets = @board.tickets
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    if @board.save
      redirect_to boards_path
    else
      render :new
    end
  end

  private

  def board_params
    params.require(:board).permit(:title)
  end
end
