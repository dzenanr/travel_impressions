part of travel_impressions;

// lib/travel/impressions/init.dart

initTravelImpressions(var entries) {
  _initCountries(entries);
  _initTravelers(entries);
}

_initCountries(var entries) {
  // http://countrycode.org/
  var countries = entries.countries;

  var bosnia = new Country(countries.concept);
  bosnia.code = 'BA';
  bosnia.name = 'Bosnia and Herzegovina';
  countries.add(bosnia);

  var bascarsija = new Place(bosnia.places.concept);
  bascarsija.name = 'Bascarsija';
  bascarsija.city = 'Sarajevo';
  bascarsija.description = 'old town';
  bascarsija.country = bosnia;
  bosnia.places.add(bascarsija);

  var bascarsijaLink1 = new WebLink(bascarsija.webLinks.concept);
  bascarsijaLink1.url =
      Uri.parse('http://en.wikipedia.org/wiki/Ba%C5%A1%C4%8Dar%C5%A1ija');
  bascarsijaLink1.title = 'Wikipedia';
  bascarsijaLink1.description =
      "Sarajevo's old bazaar and the historical and cultural center of the city.";
  bascarsijaLink1.place = bascarsija;
  bascarsija.webLinks.add(bascarsijaLink1);

  var bascarsijaLink2 = new WebLink(bascarsija.webLinks.concept);
  bascarsijaLink2 = new WebLink(bascarsija.webLinks.concept);
  bascarsijaLink2.url =
      Uri.parse('http://en.wikipedia.org/wiki/File:Ba%C5%A1%C4%8Dar%C5%A1ija_2006.jpg');
  bascarsijaLink2.title = 'image';
  bascarsijaLink2.place = bascarsija;
  bascarsija.webLinks.add(bascarsijaLink2);

  var bascarsijaLink3 = new WebLink(bascarsija.webLinks.concept);
  bascarsijaLink3.url =
      Uri.parse('http://www.tripadvisor.ca/Attraction_Review-g294450-d1931754-Reviews-Bascarsija-Sarajevo_Sarajevo_Canton.html');
  bascarsijaLink3.title = 'Trip Advisor';
  bascarsijaLink3.place = bascarsija;
  bascarsija.webLinks.add(bascarsijaLink3);

  var dariva = new Place(bosnia.places.concept);
  dariva.name = 'Dariva';
  dariva.city = 'Sarajevo';
  dariva.description = 'nice walk along Miljacka river';
  dariva.country = bosnia;
  bosnia.places.add(dariva);

  var bjelasnica = new Place(bosnia.places.concept);
  bjelasnica.name = 'Bjelasnica';
  bjelasnica.city = 'Sarajevo';
  bjelasnica.description = 'olympic mountain';
  bjelasnica.country = bosnia;
  bosnia.places.add(bjelasnica);

  var bridge = new Place(bosnia.places.concept);
  bridge.name = 'Old Bridge';
  bridge.city = 'Mostar';
  bridge.description = 'a reconstruction of a 16th-century Ottoman bridge';
  bridge.country = bosnia;
  bosnia.places.add(bridge);

  var bridgeLink1 = new WebLink(bridge.webLinks.concept);
  bridgeLink1.url =
      Uri.parse('http://en.wikipedia.org/wiki/Stari_Most');
  bridgeLink1.title = 'Wikipedia';
  bridgeLink1.description =
      'Old Bridge stood for 427 years, until it was destroyed by Bosnian Croat forces during the war.';
  bridgeLink1.place = bridge;
  bridge.webLinks.add(bridgeLink1);

  var bridgeLink2 = new WebLink(bridge.webLinks.concept);
  bridgeLink2.url =
      Uri.parse('http://en.wikipedia.org/wiki/File:Stari_Most22.jpg');
  bridgeLink2.title = 'image';
  bridgeLink2.place = bridge;
  bridge.webLinks.add(bridgeLink2);


  var croatia = new Country.withId(countries.concept, 'Croatia');
  croatia.code = "HR";
  countries.add(croatia);

  var loviste = new Place.withId(croatia.places.concept, croatia, 'Loviste');
  loviste.city = '';
  loviste.description = 'charming cost village';
  croatia.places.add(loviste);

  var lovisteImagesLink =
      Uri.parse('https://www.google.ca/search?q=loviste+croatia&tbm=isch&tbo=u&source=univ&sa=X&ei=yQPCUYvgEuLD0QG5xoH4Dg&ved=0CEgQsAQ&biw=1375&bih=788');
  var lovisteLink =
      new WebLink.withId(loviste.webLinks.concept, lovisteImagesLink);
  lovisteLink.title = 'images';
  lovisteLink.place = loviste;
  loviste.webLinks.add(lovisteLink);


  var france = new Country.withId(countries.concept, 'France');
  france.code = 'FR';
  countries.add(france);

  var canada = new Country.withId(countries.concept, 'Canada');
  canada.code = 'CA';
  countries.add(canada);
}

_initTravelers(var entries) {
  var countries = entries.countries;
  var travelers = entries.travelers;

  var dzenan = new Traveler(travelers.concept);
  dzenan.email = "dzenan@gmail.com";
  dzenan.password = "dzenan";
  dzenan.firstName = "Dzenan";
  dzenan.lastName = "Ridjanovic";
  dzenan.description = "working hard on Dart projects";
  travelers.add(dzenan);

  var dzenanMessage = new Message(dzenan.messages.concept);
  dzenanMessage.subject = 'first day in Sarajevo';
  dzenanMessage.traveler = dzenan;
  dzenan.messages.add(dzenanMessage);

  var bosnia = countries.singleWhereCode('BA');
  var bascarsija = bosnia.places.firstWhereAttribute('name', 'Bascarsija');
  var dzenanBascarsijaImpression = new Impression.withId(
      dzenanMessage.impressions.concept, bascarsija, dzenanMessage);
  dzenanBascarsijaImpression.text = 'as usual, my first meal is "cevapcici"';
  dzenanMessage.impressions.add(dzenanBascarsijaImpression);
  bascarsija.impressions.add(dzenanBascarsijaImpression);

  var bjelasnica = bosnia.places.firstWhereAttribute('name', 'Bjelasnica');
  var dzenanBjelasnicaImpression = new Impression.withId(
      dzenanMessage.impressions.concept, bjelasnica, dzenanMessage);
  dzenanBjelasnicaImpression.text =
      'after "cevapcici", hiking at Bjelasnica is calling';
  dzenanMessage.impressions.add(dzenanBjelasnicaImpression);
  bjelasnica.impressions.add(dzenanBjelasnicaImpression);

  var dariva = bosnia.places.firstWhereAttribute('name', 'Dariva');
  var dzenanDarivaImpression = new Impression.withId(
      dzenanMessage.impressions.concept, dariva, dzenanMessage);
  dzenanDarivaImpression.text = 'however, short walk will do';
  dzenanMessage.impressions.add(dzenanDarivaImpression);
  dariva.impressions.add(dzenanDarivaImpression);


  var timur = new Traveler.withId(travelers.concept, 'tim@gmail.com');
  timur.password = 'tim';
  timur.firstName = 'Timur';
  timur.lastName = 'Ridjanovic';
  timur.description = 'learning programming';
  travelers.add(timur);

  var ogden = new Traveler.withId(travelers.concept, 'ogi@gmail.com');
  ogden.password = 'ogi';
  ogden.firstName = 'Ogden';
  ogden.lastName = 'Ridjanovic';
  ogden.description = 'artiste + designer web + entrepreneur';
  travelers.add(ogden);
}

/*
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
 */



