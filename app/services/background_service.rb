class BackgroundService

  def self.image(map_poro)
    location = map_poro.location
    response = conn.get "/search/photos?query=#{location}"
      search_result = JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |faraday|
    faraday.headers[:Authorization] = "Client-ID #{ENV['PHOTO_KEY']}"
    end
  end
end
