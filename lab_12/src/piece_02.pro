domains
  surname = string
  city, street = string
  house, flat = integer
  phone = string
  address = addr(city, street, house, flat)
  mark = string
  color = string
  price = integer
  bank = string
  id, amount = integer
  
predicates
  phonebook(surname, phone, address)
  auto(surname, mark, color, price)
  bank_depositor(surname, bank, id, amount)
  man_by_auto(mark, color, surname, city, phone, bank)
  
clauses
  phonebook("Nedoluzhko", "+79681234567", addr("Moscow", "Lesnaya", 12, 2)).
  phonebook("Ivanov", "+71111111111", addr("Moscow", "Lesnaya", 13, 87)).
  phonebook("Dmitriev", "+73333333333", addr("Ekaterinburg", "Kamennaya", 13, 87)).
  phonebook("Fedorov", "+66666666666", addr("Moscow", "Hospital'naya", 123, 87)).
  auto("Nedoluzhko", "bmw", "green", 1000).
  auto("Nedoluzhko", "volkswagen", "red", 10000).
  auto("Dmitriev", "lada", "black", 20000).
  auto("Fedorov", "lada", "black", 20000).
  auto("Fedorov", "opel", "white", 10).
  bank_depositor("Nedoluzhko", "Sber", 22, 1000).
  bank_depositor("Ivanov", "Sber", 33, 10000).
  bank_depositor("Dmitriev", "Alfa", 44, 20000).
  bank_depositor("Fedorov", "Sber", 238, 10).
  bank_depositor("Borisob", "Tink", 1, 10000).
  
  man_by_auto(Mark, Color, Surname, City, Phone, Bank) :- 
      auto(Surname, Mark, Color, _),
      phonebook(Surname, Phone, addr(City, _, _, _)),
      bank_depositor(Surname, Bank, _, _).
  
goal
    man_by_auto("bmw", "green", Surname, City, Phone, Bank).
    %man_by_auto("lada", "black", Surname, City, Phone, Bank).
    %man_by_auto("volkswagen", "blue", Surname, City, Phone, Bank).
