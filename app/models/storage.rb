# @client = MongoClient.new('localhost', 27017)
# @db     = @client['sample-db']
# @coll   = @db['test']

class Storage
  attr_reader :db
  def initialize
    @client = Mongo::MongoClient.new('localhost', 27017)
    @db     = @client['voting-system-demo']
  end

  def self.save(doc)
    Storage.new.db['votings'].update( { id: doc[:id]} , doc, {upsert: true})
  end

  def self.find()
    Storage.new.db['votings'].find()
  end

end
