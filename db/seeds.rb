# frozen_string_literal: true

['Roland Deschain',
 'Mordred Deschain',
 'Elon Musk',
 'Jeff Bezos',
 'Mark Zuckerberg',
 'John Denver',
 'Tom Hanks',
 'Clark Kent',
 'Arthur Fonzarelli',
 'Jack Bauer'].each do |name|

  first, last = name.downcase.split(' ')
  tld = last.slice!(-2..-1)
  email = "#{first}@#{last}.#{tld}"

  next if Gunslinger.find_by(email: email)
  Gunslinger.create(first_name: name.split[0],
                    last_name: name.split[1],
                    email: email)
end
