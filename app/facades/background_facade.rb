class BackgroundFacade
  def self.image(coordinates)
    image_result = BackgroundService.image(coordinates)
    image_info =  {
        location: coordinates.location,
        image_url: image_result[:results].first[:links][:html],
        credit: {
          author: image_result[:results].first[:user][:name],
          portfolio: image_result[:results].first[:user][:portfolio_url]}
          }
    BackgroundPoro.new(image: image_info)
  end
end
