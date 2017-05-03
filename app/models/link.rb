class Link
    include DataMapper::Resource

  property :id, Serial
  property :title, String
  property :url, Text
end

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, "postgres://localhost/bookmarkmanager")
DataMapper.finalize.auto_upgrade!
