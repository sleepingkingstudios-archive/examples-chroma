# spec/tasks/colors_spec.rb

require 'rails_helper'

RSpec.describe 'colors:generate_colors', :type => :rake_task do
  before(:each) do
    # Stub Kernel.sleep to skip through timing delays.
    allow(Kernel).to receive(:sleep)
  end # before each

  it { expect(instance.prerequisites).to include 'environment' }

  it 'sleeps for 57 total seconds' do
    # Stub ColorGenerator.generate! to avoid unnecessary datastore calls.
    allow(ColorGenerator).to receive(:generate!)

    expect(Kernel).to receive(:sleep).with(3).exactly(19).times

    invoke_task
  end # it

  it 'creates 20 colors' do
    expect { invoke_task }.to change(Color, :count).by(20)
  end # it
end # describe
