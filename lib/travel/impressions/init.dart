                                                                                                                        part of travel_impressions; 
 
// lib/travel/impressions/init.dart 
 
initTravelImpressions(var entries) { 
  _initTravelers(entries); 
  _initCountries(entries); 
} 
 
_initTravelers(var entries) { 
  Traveler traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value0"; 
  traveler.password = "value0"; 
  traveler.firstName = "value0"; 
  traveler.lastName = "value0"; 
  traveler.description = "value0"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value1"; 
  traveler.password = "value1"; 
  traveler.firstName = "value1"; 
  traveler.lastName = "value1"; 
  traveler.description = "value1"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value2"; 
  traveler.password = "value2"; 
  traveler.firstName = "value2"; 
  traveler.lastName = "value2"; 
  traveler.description = "value2"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value3"; 
  traveler.password = "value3"; 
  traveler.firstName = "value3"; 
  traveler.lastName = "value3"; 
  traveler.description = "value3"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value4"; 
  traveler.password = "value4"; 
  traveler.firstName = "value4"; 
  traveler.lastName = "value4"; 
  traveler.description = "value4"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value5"; 
  traveler.password = "value5"; 
  traveler.firstName = "value5"; 
  traveler.lastName = "value5"; 
  traveler.description = "value5"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value6"; 
  traveler.password = "value6"; 
  traveler.firstName = "value6"; 
  traveler.lastName = "value6"; 
  traveler.description = "value6"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value7"; 
  traveler.password = "value7"; 
  traveler.firstName = "value7"; 
  traveler.lastName = "value7"; 
  traveler.description = "value7"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value8"; 
  traveler.password = "value8"; 
  traveler.firstName = "value8"; 
  traveler.lastName = "value8"; 
  traveler.description = "value8"; 
  entries.travelers.add(traveler); 
 
  traveler = new Traveler(entries.travelers.concept); 
  traveler.email = "value9"; 
  traveler.password = "value9"; 
  traveler.firstName = "value9"; 
  traveler.lastName = "value9"; 
  traveler.description = "value9"; 
  entries.travelers.add(traveler); 
 
} 
 
_initCountries(var entries) { 
  Country country = new Country(entries.countries.concept); 
  country.name = "value0"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value1"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value2"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value3"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value4"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value5"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value6"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value7"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value8"; 
  entries.countries.add(country); 
 
  country = new Country(entries.countries.concept); 
  country.name = "value9"; 
  entries.countries.add(country); 
 
} 
 
