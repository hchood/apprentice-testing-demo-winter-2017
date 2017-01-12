artists = [
  {
    name: "David Bowie",
    albums: [],
  },
  {
    name: "Prince",
    albums: [
      {
        title: "Purple Rain",
        year: "1984"
      },
      {
        title: "Parade",
        year: "1985"
      },
    ]
  },
]

artists.each do |artist_attributes|
  artist = Artist.find_or_initialize_by(
    name: artist_attributes[:name]
  )
  if artist.save
    puts "Artist saved: #{artist_attributes[:name]}"
    artist_attributes[:albums].each do |album_attributes|
      album = artist.albums.find_or_initialize_by(
        title: album_attributes[:title]
      )
      if album.update(album_attributes)
        puts "- Album saved: #{album_attributes[:title]}"
      else
        puts "- Album failed to save: #{album_attributes[:title]}"
      end
    end
  else
    puts "Artist failed to save: #{artist_attributes[:name]}"
  end
end
