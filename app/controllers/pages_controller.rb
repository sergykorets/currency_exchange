class PagesController < ApplicationController
  layout 'pages'

  def index
    @currencies = Currency.where.not(name: 'UAH')
    @last_update = Version.last.created_at.strftime('%d.%m.%Y %H:%M')
    @admin = current_user&.admin? || current_user&.cashier?
  end
end
