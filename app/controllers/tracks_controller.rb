require 'itunes_library_parser'

class TracksController < ApplicationController
  before_action :authenticate_user!

  def index
    @library ||= Library.find(params[:library_id])
    @parsed_library ||= ItunesLibraryParser::Library.new(@library.content)
  end

  def show
    @library ||= Library.find(params[:library_id])
    @parsed_library ||= ItunesLibraryParser::Library.new(@library.content)
    @track = @parsed_library.tracks.find {|t| t[:track_id] == params[:id].to_i }
  end
end
