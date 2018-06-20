class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    Pokemon.all.each do |pokemon|
      Pokemon.save(Pokemon.name, Pokemon.type, db)
    end
  end
end
