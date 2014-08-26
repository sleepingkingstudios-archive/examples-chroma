# spec/support/shared_contexts/rake.rb
# see http://robots.thoughtbot.com/test-rake-tasks-like-a-boss

require 'rake'

shared_context 'rake task', :type => :rake_task do
  let(:rake)      { Rake::Application.new }
  let(:task_name) { self.class.top_level_description }
  let(:task_path) { "lib/tasks/#{task_name.split(":").first}" }
  let(:instance)  { rake[task_name] }

  def invoke_task
    instance.invoke
  end # method invoke_task

  def loaded_files_excluding_current_rake_file
    $".reject {|file| file == Rails.root.join("#{task_path}.rake").to_s }
  end # method loaded_files_excluding_current_rake_file

  before(:each) do
    Rake.application = rake
    Rake.application.rake_require(task_path, [Rails.root.to_s], loaded_files_excluding_current_rake_file)

    Rake::Task.define_task(:environment)
  end # before each
end # shared_context
