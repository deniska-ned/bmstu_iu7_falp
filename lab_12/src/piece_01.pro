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
  deposit(surname, bank, id, amount)
  auto_by_phone(phone, surname, mark, price)
  only_mark_by_phone(phone, mark)
  data_by_surname_and_city(surname, city, street, bank, phone)
  
clauses
  phonebook("Nedoluzhko", "+79681234567", addr("Moscow", "Lesnaya", 12, 2)).
  phonebook("Ivanov", "+71111111111", addr("Moscow", "Lesnaya", 13, 87)).
  phonebook("Dmitriev", "+73333333333", addr("Ekaterinburg", "Kamennaya", 13, 87)).
  phonebook("Fedorov", "+66666666666", addr("Moscow", "Hospital'naya", 123, 87)).
  auto("Nedoluzhko", "bmw", "green", 1000).
  auto("Nedoluzhko", "volkswagen", "red", 10000).
  auto("Dmitriev", "lada", "black", 20000).
  auto("Fedorov", "opel", "white", 10).
  deposit("Nedoluzhko", "Sber", 22, 1000).
  deposit("Ivanov", "Sber", 33, 10000).
  deposit("Dmitriev", "Alfa", 44, 20000).
  deposit("Fedorov", "Sper", 238, 10).
  deposit("Borisob", "Tink", 1, 10000).
  
  auto_by_phone(Phone, Surname, Mark, Price) :- phonebook(Surname, Phone, _), auto(Surname, Mark, _, Price).
  only_mark_by_phone(Phone, Mark) :- auto_by_phone(Phone, _, Mark, _).
  data_by_surname_and_city(Surname, City, Street, Bank, Phone) :- 
  	phonebook(Surname, Phone, addr(City, Street, _, _)), 
  	deposit(Surname, Bank, _, _).
  
goal
  %auto_by_phone("+79681234567", Surname, Mark, Price).
  %only_mark_by_phone("+79681234567", Mark).
  %data_by_surname_and_city("Ivanov", "Moscow", Street, Bank, Phone).
  data_by_surname_and_city(Surname, City, Street, Bank, Phone).
