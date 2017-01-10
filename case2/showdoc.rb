require 'rubygems'
require 'tmpdir'
require 'rexml/document'


def show(dir)
  f = open(dir + '/word/document.xml') 
  doc = REXML::Document.new(f.gets(nil))
  formatter = REXML::Formatters::Pretty.new
  e =  REXML::XPath.first(doc.root,'w:body')
  formatter.write(e, $stdout)
  puts
end


if ARGV.size ==0
  puts "Please specify input file"
  exit
end
inputfile = ARGV[0]


Dir.mktmpdir(nil,'./') do |dir|
  `cd #{dir};unzip ../#{inputfile}`
  show(dir)
end
