class TicketsController < ApplicationController
  def create
    @ticket = Ticket.create(ticket_params)
    redirect_to board_path(ticket_params[:board_id])
  end

  def update
    @ticket = Ticket.find(params[:id])
    @ticket.update(status: params[:new_status].to_i)
    redirect_to board_path(params[:board_id])
  end

  private

  def ticket_params
    if !params[:ticket][:status].nil? && params[:ticket][:status].class == String
      params[:ticket][:status] = params[:ticket][:status].to_i
    end
    params.require(:ticket).permit(:title, :status, :desc, :board_id)
  end
end
