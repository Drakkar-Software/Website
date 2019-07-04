class WelcomeController < ApplicationController
  include WelcomeHelper

  def index
    @articles = Article.all.order(published_at: :desc)

    @total_active_bots = metrics
    @month_active_bots = metrics(0, -1, 0)
  end
end
