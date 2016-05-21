
require './config/environment'
require './lib/create_hash_refinement'
require './models/short_url'

class UrlShortener < Sinatra::Base
	enable :sessions
	use Rack::Flash, sweep: true


	helpers do
		def show_short_url(short_url)
			short_url = "#{request.base_url}/#{short_url.code}"
			"<a href=#{short_url} target='_blank'>#{short_url}</a>"
		end
	end

  get '/' do
		@short_url = ShortUrl.new
    erb :index
  end


	post '/' do
		@short_url = ShortUrl.new(url: params[:url])
		if @short_url.save
			flash[:notice] = 'Sucesso'
			erb :index
		else
			flash[:error] = 'Erro'
			erb :index
		end
  end
  

	get '/:code' do
		@short_url = ShortUrl.find_by(code: params[:code])
		redirect to @short_url.url
	end
end
  
