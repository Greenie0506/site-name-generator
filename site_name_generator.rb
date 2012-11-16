require 'whois'

words = ["date", "dash", "breaker", "runaway", "escape", "bail", "phone", "call", "relationship", "blinddate", "dinner", "peaceout"]

results = words.permutation(2).map do |w1,w2|
  domain = "#{w1}#{w2}.com"
end

c = Whois::Client.new

a = results.reject do |item|
  r = c.query("#{item}")
  print "."
  r.available? == false
end

puts a.inspect

