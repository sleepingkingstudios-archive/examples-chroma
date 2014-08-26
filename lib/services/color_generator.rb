# lib/services/color_generator.rb

class ColorGenerator
  class << self
    def generate!
      if Color.count < 1000
        Rails.logger.info 'Generating color...'

        Color.create! :red => rand(256), :green => rand(256), :blue => rand(256)
      end # if
    end # class method generate
  end # metaclass
end # class
