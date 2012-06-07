#!/usr/bin/env ruby -w

# In a markdown/HTML file containing multiple heading 2s with IDs, this script
# automatically generates a table of contents.

toc = []
links = []

File.open(ARGV[0]) do |f|
  i = 1
  while line = f.gets
    if m = /<h2 id=\"([\w-]+)\">([^<]+)<\/h2>/i.match(line)
      toc << "#{i}. [#{m[2]}][#{m[1]}]"
      links << "[#{m[1]}]:##{m[1]}"
      i += 1
    end
  end
end

toc.each do |l|
  print l + "\n"
end
links.each do |l|
  print l + "\n"
end
