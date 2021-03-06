# File for Home::HomeController class
class Home::HomeController < Home::BaseController
  def index
    @card = if params[:id]
              current_user.cards.find(params[:id])
            elsif current_user.current_block
              current_user.current_block.cards.pending.first
              @card ||= current_user.current_block.cards.repeating.first
            else
              current_user.cards.pending.first
              @card ||= current_user.cards.repeating.first
            end

    respond_to do |format|
      format.html
      format.js
    end
  end
end
