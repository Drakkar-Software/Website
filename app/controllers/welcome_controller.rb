class WelcomeController < ApplicationController
  def index
    @articles = Article.all
  end
end
