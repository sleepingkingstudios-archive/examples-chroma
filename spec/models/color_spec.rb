# spec/models/color_spec.rb

require 'rails_helper'

RSpec.describe Color, :type => :model do
  let(:attributes) { attributes_for(:color) }
  let(:instance)   { described_class.new attributes }

  describe '#red' do
    it { expect(instance).to have_property(:red) }
  end # describe

  describe '#green' do
    it { expect(instance).to have_property(:green) }
  end # describe

  describe '#blue' do
    it { expect(instance).to have_property(:blue) }
  end # describe

  describe 'validation' do
    it { expect(instance).to be_valid }

    %i(red green blue).each do |color|
      describe "#{color} must be present" do
        let(:attributes) { super().merge color => nil }

        it { expect(instance).to have_errors.on(color).with_message("can't be blank") }
      end # describe

      describe "#{color} must be a number" do
        let(:attributes) { super().merge color => color.capitalize }

        it { expect(instance).to have_errors.on(color).with_message('is not a number') }
      end # describe

      describe "#{color} must be an integer" do
        let(:attributes) { super().merge color => 3.1415926535 }

        it { expect(instance).to have_errors.on(color).with_message('must be an integer') }
      end # describe

      describe "#{color} must be greater than or equal to 0" do
        let(:attributes) { super().merge color => -1 }

        it { expect(instance).to have_errors.on(color).with_message('must be greater than or equal to 0') }
      end # describe

      describe "#{color} must be less than or equal to 255" do
        let(:attributes) { super().merge color => 9001 }

        it { expect(instance).to have_errors.on(color).with_message('must be less than or equal to 255') }
      end # describe
    end # describe
  end # describe
end # describe
