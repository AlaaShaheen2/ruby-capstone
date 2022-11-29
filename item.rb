class Item
    #attribute readers
    attr_reader :id, :publish_date, :archived

    #constructor
    def initialize(publish_date, archived: false)
        @id = Random.rand(1..200)
        @publish_date = publish_date
        @archived = archived
    end

    #private methos
    private

    def can_be_archived?
        (Date.today.year - Date.parse(@publish_date).year) > 10
    end
end