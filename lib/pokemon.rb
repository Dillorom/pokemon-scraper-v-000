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
    selected_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
      Pokemon.new(id: selected_pokemon[0], name: selected_pokemon[1], type: selected_pokemon[2], db)
  end
end
