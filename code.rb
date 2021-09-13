require 'get_process_mem'
puts
puts "-------- #{ENV["RUBY_GC_HEAP_GROWTH_FACTOR"]} --------\n"
GET_PROCESS_MEM = GetProcessMem.new

s = []
start = Time.now
GC.compact

50_000_000.times do |i|
  # if 0 == i % 1_000_000
  #   print "[#{i/1_000_000}]"
  #   # GC.start
  # end
  s << "abcdefabcdefabcdefabcdefabcdefabcdefabcdefabcdef"  
end

finish = Time.now

puts 'GC.stat[:heap_sorted_length]: ' + GC.stat[:heap_sorted_length].to_s
puts "process RSS: #{GET_PROCESS_MEM.bytes}"
puts "seconds elapsed: " + (finish-start).to_s
