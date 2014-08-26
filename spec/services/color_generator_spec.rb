# spec/services/color_generator_spec.rb

require 'rails_helper'
require 'services/color_generator'

RSpec.describe ColorGenerator do
  describe '::generate!' do
    let(:red)   { 255 }
    let(:green) { 51 }
    let(:blue)  { 102 }

    it { expect(described_class).to respond_to(:generate!).with(0).arguments }

    it 'creates a color' do
      expect { described_class.generate! }.to change(Color, :count).by(1)
    end # it

    it 'returns the color' do
      expect(described_class.generate!).to be_a Color
    end # it

    it 'sets random values for the color channels' do
      allow(described_class).to receive(:rand).and_return(red, green, blue)
      color = ColorGenerator.generate!

      %i(red green blue).each do |channel|
        expect(color.send channel).to be == send(channel)
      end # each
    end # it

    context 'with 1000+ colors' do
      before(:each) { allow(Color).to receive(:count).and_return(1001) }

      it 'does not create a new color' do
        expect(Color).not_to receive(:create!)

        described_class.generate!
      end # it
    end # context
  end # describe
end # describe
