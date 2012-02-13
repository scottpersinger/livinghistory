require 'open-uri'

class SiteController < ApplicationController
  def index
  end

  def story

  	if params[:url]
  		story = YAML.load(open(params[:url]))
  	else
  		story = YAML.load(File.open("public/#{params[:name]}_story.yml"))
  	end
  	
  	render :json => story.to_json
  end

end
