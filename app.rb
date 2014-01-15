Dir["./lib/*"].each {|file| require file }

module SpaceCats
	class Spacecat < Sinatra::Application

		get '/' do
			@cat = Spacecat.new

			erb :index
		end

		post '/results' do

			erb :results
		end

		get '/new' do

			erb :new_cat
		end



			

	end
end