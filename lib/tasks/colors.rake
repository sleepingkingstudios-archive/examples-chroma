# lib/tasks/colors.rake

require 'services/color_generator'

namespace :colors do
  task :generate_colors => :environment do
    Rails.logger.info 'Running `rake colors:generate_colors`...'

    ColorGenerator.generate!

    19.times do
      Kernel.sleep 3

      ColorGenerator.generate!
    end # loop
  end # task
end # namespace
