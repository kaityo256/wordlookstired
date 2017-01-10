require 'rubygems'
require 'tmpdir'
require 'rexml/document'

def show_pretty(e)
  formatter = REXML::Formatters::Pretty.new
  formatter.write(e,$stdout)
  puts
end

def show(dir)
  f = open(dir + '/word/numbering.xml') 
  doc = REXML::Document.new(f.gets(nil))
  formatter = REXML::Formatters::Pretty.new
  REXML::XPath.each(doc.root,'w:abstractNum') do |e|
    print "<w:abstractNum " 
    e.attributes.each do |k,v|
      print " #{k}='#{v}'"
    end
    puts "> ... </w:abstractNum>"
  end
  REXML::XPath.each(doc.root,'w:num') do |e|
    show_pretty(e)
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
