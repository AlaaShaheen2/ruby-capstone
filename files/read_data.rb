class ReadData
    def self.read_music_albums
        music_albums = []
        return music_albums unless File.exist?('./data/music_albums.json')
    
        file = File.open('./data/music_albums.json')
        data = JSON.parse(file.read)
        data.each do |album|
          music_album = MusicAlbum.new(album['on_spotify'], album['publish_date'])
          label = Label.new(album['label']['title'], album['label']['color'])
          label.id = album['label']['id']
          source = Genre.new(album['source']['name'])
          source.id = album['source']['id']
          genre = Genre.new(album['genre']['name'])
          genre.id = album['genre']['id']
          author = Author.new(album['author']['first_name'], album['author']['last_name'])
          author.id = album['author']['id']
        #Add all properties of music_album instance 
        music_album.source = source
        music_album.label = label
        music_album.genre = genre
        music_album.author = author
          music_albums << music_album
        end
        file.close
        music_albums
      end

      def self.read_sources
        sources = []
        return sources unless File.exist?('./data/sources.json')
    
        file = File.open('./data/sources.json')
        data = JSON.parse(file.read)
        data.each do |source|
          source_obj = Source.new(source['name'])
          source_obj.id=source['id']
          sources << source_obj
        end
        file.close
        sources
      end

    def self.read_labels
      labels = []
      return labels unless File.exist?('./data/labels.json')
  
      file = File.open('./data/labels.json')
      data = JSON.parse(file.read)
      data.each do |label|
        label_obj = Label.new(label['title'], label['color'])
        label_obj.id=label['id']
        labels << label_obj
      end
      file.close
      labels
    end
  
    def self.read_authors
      authors = []
      return authors unless File.exist?('./data/authors.json')
  
      file = File.open('./data/authors.json')
      data = JSON.parse(file.read)
      data.each do |author|
        author_obj = Author.new(author['first_name'], author['last_name'])
        author_obj.id =author['id']
        authors << author_obj
      end
      file.close
      authors
    end
  
    def self.read_genres
      genres = []
      return genres unless File.exist?('./data/genres.json')
  
      file = File.open('./data/genres.json')
      data = JSON.parse(file.read)
      data.each do |genre|
        genre_obj = Genre.new(genre['name'])
        genre_obj.id=genre['id']
        genres << genre_obj
      end
      file.close
      genres
    end
  end