class BackgroundPoro
  attr_reader :id,
              :image


  def initialize(attributes)
    @id = ''
    @image = attributes[:image]
  end
end
