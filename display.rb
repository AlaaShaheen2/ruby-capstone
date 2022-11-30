class Display

  def self.list_all_authors(authors)
    if authors.empty?
      puts 'The Items list is empty, add some items...'
    else
      puts "Authors list, count(#{authors.count}) :\n\n"
      authors.each_with_index do |author, index|
        puts "#{index + 1}) Author: #{author.first_name}, #{author.last_name}"
      end
    end
  end

  def self.list_all_genres(genres)
    if genres.empty?
      puts 'The genre list is empty, add some genres...'
    else
      puts "Genres list, count(#{genres.count}) :\n\n"
      genres.each_with_index do |genre, index|
        puts "#{index + 1}) Name: '#{genre.name}'"
      end
    end
  end

  def self.list_all_labels(labels)
    if labels.empty?
      puts 'The label list is empty, add some items...'
    else
      puts "Labels list, count(#{labels.count}) :\n\n"
      labels.each_with_index do |label, index|
        puts "#{index + 1}) Title: '#{label.title}', Color: #{label.color}"
      end
    end
  end

  def self.list_all_sources(sources)
    if sources.empty?
      puts 'The sources list is empty, add some sources...'
    else
      puts "Sources list, count(#{sources.count}) :\n\n"
      sources.each_with_index do |source, index|
        puts "#{index + 1}) Name: '#{source.name}'"
      end
    end
  end

  def self.list_all_music_albums(music_albums)
    if music_albums.empty?
      puts 'The music album list is empty, add some albums...'
    else
      puts "Music Albums list, count(#{music_albums.count}) :\n\n"
      music_albums.each_with_index do |music, index|
        puts "#{index + 1}) Title: '#{music.label.title}', Genre: #{music.genre.name}"
      end
    end
  end
end
