require 'rake'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'yard'

YARD::Rake::YardocTask.new(:doc) do |t|
 t.files   = ['lib/*.rb']
 t.options = ['--markup=markdown']
 t.stats_options = ['--list-undoc']
end

RSpec::Core::RakeTask.new(:test) do |t|
  t.pattern = Dir.glob('test/*_spec.rb')
  t.rspec_opts = '--format documentation'
end

RuboCop::RakeTask.new(:lint) do |t|
  t.options = ['--display-cop-names']
end

task :default => [:doc, :test]
