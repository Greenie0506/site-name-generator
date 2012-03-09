require 'whois'

words = ["date", "dash", "breaker", "runaway", "escape", "bail", "phone", "call", "relationship", "blinddate", "dinner", "peaceout"]

r = words.map do |word|
  words.reject{ |item| item == word }.map do |w|
    combo = word + w
    combo + ".com"
  end
end

result = r.flatten


c = Whois::Client.new

a = result.reject do|item|
  r = c.query("#{item}")
  print "."
  r.available? == false
end

puts a.inspect


