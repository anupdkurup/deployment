# Load all our thor files
gem 'json', '> 1.7.7'
require 'rubygems'
require "./lib/yaml"

module Main
  def self.load_thorfiles(dir)
    Dir.chdir(dir) do
      thor_files = Dir.glob('**/*.thor').delete_if { |x| not File.file?(x) }
      thor_files.each do |f|
        Thor::Util.load_thorfile(f)
      end
    end
  end
end

Main.load_thorfiles('tasks')

