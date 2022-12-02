require_relative '../music_album'

describe MusicAlbum do
  before :each do
    @album1 = MusicAlbum.new(true, '2005/04/09')
    @album2 = MusicAlbum.new(false, '2005/04/09')
    @album3 = MusicAlbum.new(true, '2019/04/09')
  end

  context 'When instatiating MusicAlbum class' do
    it 'Return the book' do
      expect(@album1).to an_instance_of MusicAlbum
    end

    it 'should have the following properties' do
      expect(@album1.on_spotify).to eq true
      expect(@album1.publish_date).to be_kind_of String
    end
  end

  context 'can_be_archived method: ' do
    it 'is available or responds' do
      expect(@album1).to respond_to(:move_to_archive)
      expect(@album2).to respond_to(:move_to_archive)
      expect(@album3).to respond_to(:move_to_archive)
    end

    it 'returns true (archived) for album1 since it is onspotify and publish date is >10 years' do
      @album1.move_to_archive
      expect(@album1.archived).to eql true
    end

    it 'returns false (not archived) for album2 since it isn\'t on spotify and thourgh publish date is > 10 years' do
      @album2.move_to_archive
      expect(@album2.archived).to eql false
    end

    it 'return false (not archived) for album2 since though it is on spotify and publish date is < 10 years' do
      @album3.move_to_archive
      expect(@album3.archived).to eql false
    end
  end
end
