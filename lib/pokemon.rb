class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(id:, name:, type:, db:, database_connection)
    database_connection.execute("INSERT INTO pokemon(id:, name:, type:, db:) VALUES(?, ?, ?, ?)"id, name, type, db)
  end
end
