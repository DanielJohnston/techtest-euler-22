require_relative 'name_list'
require_relative 'name'
require 'csv'

module Ingest
  def self.file filename
    names = []
    names_as_text = CSV.read(filename).flatten
    names_as_text.each do |name|
      names << Name.new(name)
    end
    NameList.new(names)
  end
end
