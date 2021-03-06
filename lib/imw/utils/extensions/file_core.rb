#
# h2. lib/imw/utils/extensions/file.rb -- extensions to built-in file class
#
# == About
#
# Author::    (Philip flip Kromer, Dhruv Bansal) for Infinite Monkeywrench Project (mailto:coders@infochimps.org)
# Copyright:: Copyright (c) 2008 infochimps.org
# License::   GPL 3.0
# Website::   http://infinitemonkeywrench.org/
#

require 'imw/utils/error'
require 'imw/utils/config'
require 'imw/utils/extensions/string'

class File

  # Returns the name of the path given:
  #
  #   File.name_of_file("/path/to/somefile.txt") => "somefile".
  def self.name_of_file path
    basename(path)[0,basename(path).length - extname(path).length]
  end

  # Returns what would be the handle of a source or dataset
  # described by a file at +path+:
  #
  #   File.handle "/path/to/a_particular_dataset.instructions.yaml"  #=> :a_particular_dataset
  def self.handle path
    File.basename(path).split('.').first.handle
  end

  # Returns a unique (non-existing) version of the given +path+ by
  # appending successive intgers, useful for copying files ito
  # directories without clobbering existing files (a la <tt>wget
  # -nc</tt>).
  #
  # In a directory <tt>/path/to</tt> without a file named
  # <tt>data.txt</tt>
  #
  #   File.uniquify("/path/to/data.txt") #=> "/path/to/data.txt"</tt>
  #
  # If <tt>data.txt</tt> were to already exist in that directory, then
  #
  #   File.uniquify("/path/to/data.txt") #=> "/path/to/data.txt.1"
  #
  # If <tt>data.txt.1</tt> were to already exist then
  #
  #   File.uniquify("/path/to/data.txt") #=> "/path/to/data.txt.2"
  #
  # and so on.
  def self.uniquify path
    orig_path = path.clone
    copy_number = 1
    while exist? path do
      path = orig_path + ".#{copy_number}"
      copy_number += 1
    end
    path
  end

end

# puts "#{File.basename(__FILE__)}: You add a bit of glitter and jazz to all the folders in the cabinet.  It makes you feel happier when you have to sort through them." # at bottom
