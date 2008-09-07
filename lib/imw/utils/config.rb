#
# h2. lib/imw/utils/config.rb -- configuration parsing
#
# == About
#
# IMW looks for configuration settings in the following places, in
# order of increasing precedence:
#
#   1. Settings defined directly in this file.
#
#   2. From the <tt>etc/imwrc</tt> file in the IMW root directory.
#
#   3. From the <tt>.imwrc</tt> file in the user's home directory (the
#      filename can be changed; see
#      <tt>IMW::Config::USER_CONFIG_FILE_BASENAME</tt>).
#
#   4. From the file defined by the environment variable +IMWRC+ (the
#      value can be changed; see
#      <tt>IMW::Config::USER_CONFIG_FILE_ENV_VARIABLE</tt>
#
# Settings not found in one configuration location will be searched
# for in locations of lesser precedence.
#
# *Note:* configuration files are plain Ruby code that will be directly
# evaluated.
#
# Relevant settings include
#
# * interfaces with external programs (+tar+, +wget+, &c.)
# * paths to directories where IMW reads/writes files
# * correspondences between file extensions and IMW file classes
#
# For more detailed information, see the default configuration file,
# <tt>etc/imwrc</tt>.
#
#
# Author::    (Philip flip Kromer, Dhruv Bansal) for Infinite Monkeywrench Project (mailto:coders@infochimps.org)
# Copyright:: Copyright (c) 2008 infochimps.org
# License::   GPL 3.0
# Website::   http://infinitemonkeywrench.org/
#

module IMW
  # Paths to external programs used by IMW.
  EXTERNAL_PROGRAMS = {
    :tar => "tar",
    :rar => "rar",
    :zip => "zip",
    :unzip => "unzip",
    :gzip => "gzip",
    :bzip2 => "bzip2",
    :wget => "wget"
  } unless defined? ::IMW::EXTERNAL_PROGRAMS

  # Directories where IMW will write and look for files.
  DIRECTORIES = {
    :instructions => File.expand_path("~/imw/instructions"),

    :data => File.expand_path("~/imw/data"),
    :ripd => File.expand_path("~/imw/data/ripd"),
    :xtrd => File.expand_path("~/imw/data/xtrd"),
    :prsd => File.expand_path("~/imw/data/prsd"),
    :mungd => File.expand_path("~/imw/data/mungd"),
    :fixd => File.expand_path("~/imw/data/fixd"),
    :pkgd => File.expand_path("~/imw/data/pkgd"),

    :dump => "/tmp/imw"
  } unless defined? ::IMW::DIRECTORIES

  module Files
    # Correspondence between extensions and file types.  Used by
    # <tt>IMW::Files.identify</tt> to identify files based on known
    # extensions.
    #
    # File type strings should be stripped of the leading
    # <tt>IMW::Files</tt> prefix, i.e. - the file object
    # <tt>IMW::Files::Bz2</tt> should be referenced by the string
    # <tt>"Bz2"</tt>.
    EXTENSIONS = {
      ".bz2" => "Bz2",
      ".gz" => "Gz",
      ".tar.bz2" => "TarBz2",
      ".tbz2" => "TarBz2",
      ".tar.gz" => "TarGz",
      ".tgz" => "TarGz",
      ".rar" => "Rar",
      ".zip" => "Zip",
      ".txt" => "Text",
      ".ascii" => "Text",
      ".csv" => "Csv",
      ".xml" => "Xml",
      ".html" => "Html",
      ".yaml" => "Yaml",
      ".yml" => "Yaml"
    } unless defined? ::IMW::Files::EXTENSIONS
  end
end

# puts "#{File.basename(__FILE__)}: You carefully adjust the settings on your Monkeywrench.  Glob-monsters: beware!!" # at bottom
