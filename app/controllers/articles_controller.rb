class ArticlesController < ApplicationController
  def index
    search_term = ""

    if params[:search] == ""
      search_term = "dogs"
    else
      search_term = params[:search]
    end

    response = HTTP.get("https://newsapi.org/v2/everything?q=#{search_term}&apiKey=#{Rails.application.credentials.news_api[:api_key]}")
    data = JSON.parse(response.body)
    render json: data
  end
end
