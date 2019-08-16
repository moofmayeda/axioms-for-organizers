require './TextService.rb'

line_count = `wc -l "axioms.txt"`.strip.split(' ')[0].to_i
axiom = rand line_count

File.foreach('axioms.txt').with_index do |line, line_num| 
  TextService.send(line) if line_num == axiom
end