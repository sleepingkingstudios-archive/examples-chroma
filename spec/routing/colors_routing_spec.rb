# spec/routing/colors_routing_spec.rb

require 'rails_helper'

RSpec.describe 'routing for Colors', :type => :routing do
  let(:controller) { 'colors' }

  describe 'GET /' do
    let(:path)   { '/' }
    let(:action) { 'index' }

    it 'routes to ColorsController#index' do
      expect(:get => path).to route_to({
        :controller => controller,
        :action     => action
      }) # end expect
    end # it
  end # describe

  describe 'GET /about' do
    let(:path)   { '/about' }
    let(:action) { 'about' }

    it 'routes to ColorsController#about' do
      expect(:get => path).to route_to({
        :controller => controller,
        :action     => action
      }) # end expect
    end # it
  end # describe

  describe 'DELETE /pop' do
    let(:path)   { '/pop' }
    let(:action) { 'pop' }

    it 'routes to ColorsController#pop' do
      expect(:delete => path).to route_to({
        :controller => controller,
        :action     => action
      }) # end expect
    end # it
  end # describe
end # describe
