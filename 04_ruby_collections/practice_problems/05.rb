flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

idx = flintstones.index { |name| name.start_with?('Be') }
p idx
