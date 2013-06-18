part of travel_impressions;

// lib/travel/impressions/init.dart

initTravelImpressions(var entries) {
  _initTravelers(entries);
  _initCountries(entries);
}

_initTravelers(var entries) {
  var traveler = new Traveler(entries.travelers.concept);
  traveler.email = "dzenan@gmail.com";
  traveler.password = "dzenan";
  traveler.firstName = "Dzenan";
  traveler.lastName = "Ridjanovic";
  traveler.description = "working hard on Dart projects";
  entries.travelers.add(traveler);

  traveler = new Traveler(entries.travelers.concept);
  traveler.email = "tim@gmail.com";
  traveler.password = "tim";
  traveler.firstName = "Timur";
  traveler.lastName = "Ridjanovic";
  traveler.description = "learning programming";
  entries.travelers.add(traveler);

  traveler = new Traveler(entries.travelers.concept);
  traveler.email = "ogi@gmail.com";
  traveler.password = "ogi";
  traveler.firstName = "Ogden";
  traveler.lastName = "Ridjanovic";
  traveler.description = "artiste + designer web + entrepreneur";
  entries.travelers.add(traveler);
}

_initCountries(var entries) {
  var country = new Country(entries.countries.concept);
  country.code = "BA";
  country.name = "Bosnia and Herzegovina";
  entries.countries.add(country);

  var placeConcept = entries.getConcept('Place');
  var place = new Place(placeConcept);
  place.name = 'Bascarsija';
  place.city = 'Sarajevo';
  place.description = 'old town';
  place.country = country;
  country.places.add(place);

  place = new Place(placeConcept);
  place.name = 'Bjelasnica';
  place.city = 'Sarajevo';
  place.description = 'olympic mountain';
  place.country = country;
  country.places.add(place);

  country = new Country(entries.countries.concept);
  country.code = "HR";
  country.name = "Croatia";
  entries.countries.add(country);

  place = new Place(placeConcept);
  place.name = 'Loviste';
  place.city = '';
  place.description = 'charming cost village';
  place.country = country;
  country.places.add(place);

  country = new Country(entries.countries.concept);
  country.code = "FR";
  country.name = "France";
  entries.countries.add(country);

  country = new Country(entries.countries.concept);
  country.code = "CA";
  country.name = "Canada";
  entries.countries.add(country);

}

