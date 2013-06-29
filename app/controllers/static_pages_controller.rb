class StaticPagesController < ApplicationController

  def index
    @results = params[:results]
    if !@results.nil?
      @results = downloadlinks(params[:results])
    end
  end

  def download
    send_file @results, :type => 'audio/mpeg', :disposition => 'attachment'
    render 'index'
  end
end
