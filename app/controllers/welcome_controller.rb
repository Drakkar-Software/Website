class WelcomeController < ApplicationController
  include WelcomeHelper

  def index
    @articles = Article.all.order(published_at: :desc)

    @total_active_bots = metrics
    puts @total_active_bots
    @month_active_bots = metrics(month = -1)
    puts @month_active_bots
  end
end
