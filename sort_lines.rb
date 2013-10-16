File.open(ARGV[1], 'w') { |file| file.write(File.read(ARGV[0]).lines.sort.join) }
