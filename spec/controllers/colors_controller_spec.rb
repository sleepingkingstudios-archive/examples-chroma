# spec/controllers/colors_controller_spec.rb

require 'rails_helper'

RSpec.describe ColorsController, :type => :controller do
  shared_context 'with many colors', :colors => :many do
    let!(:colors) { Array.new(3).map { create(:color) } }
  end # shared_context

  describe '#index' do
    def perform_action
      get :index
    end # method perform_action

    it 'renders the index template' do
      perform_action

      expect(response.status).to be == 200
      expect(response).to render_template(:index)
    end # it
  end # describe

  describe '#about' do
    def perform_action
      get :about
    end # method perform_action

    it 'renders the about template' do
      perform_action

      expect(response.status).to be == 200
      expect(response).to render_template(:about)

      expect(assigns(:colors_count)).to be_a Integer
    end # it
  end # describe

  describe '#pop' do
    def perform_action
      delete :pop
    end # method perform_action

    it 'redirects to root' do
      perform_action

      expect(response.status).to be == 302
      expect(response).to redirect_to root_path
    end # it

    describe 'as an XHR request' do
      def perform_action
        xhr :delete, :pop
      end # method perform_action

      context 'with no colors' do
        it 'returns a 404 Not Found response' do
          perform_action

          expect(response.status).to be == 404
          expect(response.body).to be_blank
        end # it
      end # context

      context 'with many colors', :colors => :many do
        let(:json) { JSON.parse response.body }

        it 'returns the last color as a JSON tuple' do
          color = Color.last
          perform_action

          expect(response.status).to be == 200
          expect(json).to be == [color.red, color.green, color.blue]
        end # it

        it 'deletes the last color' do
          expect { perform_action }.to change(Color, :count).by(-1)
        end # it
      end # context
    end # describe
  end # describe
end # describe
