part of travel_impressions;

// lib/travel/impressions/init.dart

initTravelImpressions(var entries) {
  _initCountries(entries);
  _initTravelers(entries);
}

_initCountries(var entries) {
  // http://countrycode.org/
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

  var webLinkConcept = entries.getConcept('WebLink');
  var webLink = new WebLink(webLinkConcept);
  webLink.url =
      Uri.parse('http://en.wikipedia.org/wiki/Ba%C5%A1%C4%8Dar%C5%A1ija');
  webLink.title = 'Wikipedia';
  webLink.description =
      "Sarajevo's old bazaar and the historical and cultural center of the city.";
  webLink.place = place;
  place.webLinks.add(webLink);

  webLink = new WebLink(webLinkConcept);
  webLink.url =
      Uri.parse('http://en.wikipedia.org/wiki/File:Ba%C5%A1%C4%8Dar%C5%A1ija_2006.jpg');
  webLink.title = 'image';
  webLink.place = place;
  place.webLinks.add(webLink);

  webLink = new WebLink(webLinkConcept);
  webLink.url =
      Uri.parse('http://www.tripadvisor.ca/Attraction_Review-g294450-d1931754-Reviews-Bascarsija-Sarajevo_Sarajevo_Canton.html');
  webLink.title = 'Trip Advisor';
  webLink.place = place;
  place.webLinks.add(webLink);

  place = new Place(placeConcept);
  place.name = 'Dariva';
  place.city = 'Sarajevo';
  place.description = 'nice walk along Miljacka river';
  place.country = country;
  country.places.add(place);

  place = new Place(placeConcept);
  place.name = 'Bjelasnica';
  place.city = 'Sarajevo';
  place.description = 'olympic mountain';
  place.country = country;
  country.places.add(place);

  place = new Place(placeConcept);
  place.name = 'Old Bridge';
  place.city = 'Mostar';
  place.description = 'a reconstruction of a 16th-century Ottoman bridge';
  place.country = country;
  country.places.add(place);

  webLink = new WebLink(webLinkConcept);
  webLink.url =
      Uri.parse('http://en.wikipedia.org/wiki/Stari_Most');
  webLink.title = 'Wikipedia';
  webLink.description =
      "Old Bridge stood for 427 years, until it was destroyed by Bosnian Croat forces during the war.";
  webLink.place = place;
  place.webLinks.add(webLink);

  webLink = new WebLink(webLinkConcept);
  webLink.url =
      Uri.parse('http://en.wikipedia.org/wiki/File:Stari_Most22.jpg');
  webLink.title = 'image';
  webLink.place = place;
  place.webLinks.add(webLink);

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

  webLink = new WebLink(webLinkConcept);
  webLink.url =
      Uri.parse('https://www.google.ca/search?q=loviste+croatia&tbm=isch&tbo=u&source=univ&sa=X&ei=yQPCUYvgEuLD0QG5xoH4Dg&ved=0CEgQsAQ&biw=1375&bih=788');
  webLink.title = 'images';
  webLink.place = place;
  place.webLinks.add(webLink);

  country = new Country(entries.countries.concept);
  country.code = "FR";
  country.name = "France";
  entries.countries.add(country);

  country = new Country(entries.countries.concept);
  country.code = "CA";
  country.name = "Canada";
  entries.countries.add(country);
}

_initTravelers(var entries) {
  var traveler = new Traveler(entries.travelers.concept);
  traveler.email = "dzenan@gmail.com";
  traveler.password = "dzenan";
  traveler.firstName = "Dzenan";
  traveler.lastName = "Ridjanovic";
  traveler.description = "working hard on Dart projects";
  entries.travelers.add(traveler);

  var messageConcept = entries.getConcept('Message');
  var message = new Message(messageConcept);
  message.subject = 'first day in Sarajevo';
  message.traveler = traveler;
  traveler.messages.add(message);

  var country = entries.countries.singleWhereCode('BA');
  var place = country.places.firstWhereAttribute('name', 'Bascarsija');
  var impressionConcept = entries.getConcept('Impression');
  var impression = new Impression.withId(impressionConcept, place, message);
  impression.text = 'as usual, my first meal is "cevapcici"';
  message.impressions.add(impression);
  place.impressions.add(impression);

  place = country.places.firstWhereAttribute('name', 'Bjelasnica');
  impression = new Impression.withId(impressionConcept, place, message);
  impression.text = 'after "cevapcici", hiking at Bjelasnica is calling';
  message.impressions.add(impression);
  place.impressions.add(impression);

  place = country.places.firstWhereAttribute('name', 'Dariva');
  impression = new Impression.withId(impressionConcept, place, message);
  impression.text = 'however, short walk will do';
  message.impressions.add(impression);
  place.impressions.add(impression);

  traveler = new Traveler.withId(entries.travelers.concept, 'tim@gmail.com');
  //traveler.email = "tim@gmail.com";
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



