class TransactionsController < ApplicationController
  before_action :check_user

  def index
    actions = Action.exchange.order('created_at DESC')
    @count = actions.count
    @actions = actions.page(params[:page] || 1).per(10).map do |action|
      { id: action.id,
        currency_buy: action.sell_currency.name,
        currency_sell: action.buy_currency.name,
        buy_amount: action.buy_amount,
        sell_amount: action.sell_amount,
        rate: action.rate,
        comment: action.comment,
        created_at: action.created_at.strftime('%d.%m.%Y %H:%M')
      }
    end
    @admin = current_user&.admin?
    respond_to do |format|
      format.html { render :index }
      format.json {{actions: @actions, count: @count }}
    end
  end

  private

  def check_user
    head :no_content if current_user.simple?
  end
end