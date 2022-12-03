require 'json'

class StoreData

    def self.store_music_albums(albums)
        albums_json = []
        albums.each do |album|
          albums_json.push(make_album_json(album))
        end
        return if albums_json.empty?
        
        File.write('./data/music_albums.json', "#{JSON.generate(albums_json)}")
      end
    
      def self.make_album_json(album)
        {
          publish_date: album.publish_date,
          on_spotify: album.on_spotify,
          id: album.id,
          label: {
            title: album.label.title,
            color: album.label.color,
            id: album.label.id
          },
         
          genre: {
            name: album.genre.name,
            id: album.genre.id
          },
          source: {
            name: album.source.name,
            id: album.source.id
          },
          author: {
            first_name: album.author.first_name,
            last_name: album.author.last_name,
            id: album.author.id
          }
        }
      end

      def self.store_source(sources)
        sources_json = []
        sources.each do |source|
            source_json = {name: source.name, id: source.id }
            sources_json << source_json
        end
        return if sources_json.empty?
    
        File.write('./data/sources.json', "#{JSON.generate(sources_json)}\n")
      end
  
  def self.store_labels(labels)
    labels_json = []
    labels.each do |label|
      labels_json << {
        title: label.title,
        color: label.color,
        id: label.id
      }
    end
    return if labels_json.empty?

    File.write('./data/labels.json', "#{JSON.generate(labels_json)}\n")
  end

  
  def self.store_authors(authors)
    labels_json = []
    authors.each do |author|
      labels_json << {
        first_name: author.first_name,
        last_name: author.last_name,
        id: author.id
      }
    end
    return if labels_json.empty?

    File.write('./data/authors.json', "#{JSON.generate(labels_json)}\n")
  end

  def self.store_genres(genres)
    labels_json = []
    genres.each do |genre|
      labels_json << {
        name: genre.name,
        id: genre.id
      }
    end
    return if labels_json.empty?

    File.write('./data/genres.json', "#{JSON.generate(labels_json)}\n")
  end
end