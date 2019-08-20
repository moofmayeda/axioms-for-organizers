require './TextService.rb'

task :default do
  send_axioms
end

def send_axioms
  today = Date.today

  # only send on weekdays
  return if today.saturday? || today.sunday?

  # only send 33% of the time
  return unless rand(3) == 0

  TextService.send(File.readlines('axioms.txt').sample)
end