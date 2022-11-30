require_relative './genre'
require_relative './author'
require_relative './display'

class App
    attr_reader :sources, :labels, :genres, :authors

    def initialize
        @labels = []
        @sources = []
        @genres = []
        @authors = []
    end

    def quit_app
        #it is here that we r going to persist data to files
        puts 'Thank you for using this app! Now exiting...'
        exit
    end

    def list_all_authors
        Display.list_all_authors(@authors)
    end

    def list_all_genres
        Display.list_all_genres(@genres)
    end

    def list_all_labels
        Display.list_all_labels(@labels)
    end
    
    def list_all_sources
        Display.list_all_sources(@sources)
    end
end