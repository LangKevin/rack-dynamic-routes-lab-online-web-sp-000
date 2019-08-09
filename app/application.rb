class Application
 
  # @@songs = [Song.new("Sorry", "Justin Bieber"),
  #           Song.new("Hello","Adele")]
@@items = [] 
  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)
 
    if req.path.match(/items/)
 
      song_title = req.path.split("/items/").last #turn /songs/Sorry into Sorry
      song = @@songs.find{|s| s.title == song_title}
 
      resp.write song.artist
    else
      resp.write "Route not found"
      resp.status = 404
    end
 
    resp.finish
  end
end
