require "bundler/gem_tasks"


task :default => :spec

desc "Run RSpec code examples"
task :spec do
   sh "rspec -I. -Ilib -Ispec spec/naranjero_spec.rb"
end

