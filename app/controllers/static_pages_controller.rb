class StaticPagesController < ApplicationController

  def index
    @results = params[:results]
    @bugger = "not in"
    if !@results.nil?
      @bugger = "oh we in"
      @results = downloadlinks(params[:results])
    end
  end
end
