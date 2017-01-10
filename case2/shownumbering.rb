require 'rubygems'
require 'tmpdir'
require 'rexml/document'


def show(dir)
  f = open(dir + '/word/numbering.xml') 
  doc = REXML::Document.new(f.gets(nil))
  formatter = REXML::Formatters::Pretty.new
  REXML::XPath.each(doc.root,'w:abstractNum') do |e|
    formatter.write(e, $stdout)
    puts 
  end
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
