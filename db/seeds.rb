# frozen_string_literal: true

['Roland Deschain', 'Mordred Deschain', 'Elon Musk', 'Jeff Bezos'].each do |name|
  first, last = name.downcase.split(' ')
  tld = last.slice!(-2..-1)
  email = "#{first}@#{last}.#{tld}"
  Gunslinger.create(first_name: name.split[0], last_name: name.split[1], email: email)
end
