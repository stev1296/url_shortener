class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    url = Url.where(:random_id=>params[:id]).first

    if url
      redirect_to url.original
    else
      render "index"
    end
  end

  def new
    @url = Url.new
    myurlsays = " My url number "
    @url.random_id = myurlsays

  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    redirect_to urls_path, :notice => "Your post has been deleted"
  end


  def urls_params
    params.require(:url).permit(:original, :random_id)
  end

  def create
    @url = Url.new(urls_params)

    if @url.save
      redirect_to urls_path
    else
      render "new"
     end
   end
end
