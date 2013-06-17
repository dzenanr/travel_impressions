part of travel_impressions; 
 
// lib/travel/impressions/countries.dart 
 
class Country extends CountryGen { 
 
  Country(Concept concept) : super(concept); 
 
  Country.withId(Concept concept, String name) : 
    super.withId(concept, name); 
 
} 
 
class Countries extends CountriesGen { 
 
  Countries(Concept concept) : super(concept); 
 
} 
 
