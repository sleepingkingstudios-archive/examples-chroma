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

    %i(red green blue).each do |channel|
      describe "#{channel} must be present" do
        let(:attributes) { super().merge channel => nil }

        it { expect(instance).to have_errors.on(channel).with_message("can't be blank") }
      end # describe

      describe "#{channel} must be a number" do
        let(:attributes) { super().merge channel => channel.capitalize }

        it { expect(instance).to have_errors.on(channel).with_message('is not a number') }
      end # describe

      describe "#{channel} must be an integer" do
        let(:attributes) { super().merge channel => 3.1415926535 }

        it { expect(instance).to have_errors.on(channel).with_message('must be an integer') }
      end # describe

      describe "#{channel} must be greater than or equal to 0" do
        let(:attributes) { super().merge channel => -1 }

        it { expect(instance).to have_errors.on(channel).with_message('must be greater than or equal to 0') }
      end # describe

      describe "#{channel} must be less than or equal to 255" do
        let(:attributes) { super().merge channel => 9001 }

        it { expect(instance).to have_errors.on(channel).with_message('must be less than or equal to 255') }
      end # describe
    end # describe
  end # describe
end # describe
