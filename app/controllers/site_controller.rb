class SiteController < ApplicationController
  def index
  end

  def story
  	story = YAML.load(File.open("public/#{params[:name]}_story.yml"))
  	render :json => story.to_json
  end

end
