part of travel_impressions; 
 
// lib/travel/impressions/places.dart 
 
class Place extends PlaceGen { 
 
  Place(Concept concept) : super(concept); 
 
  Place.withId(Concept concept, Country country, String name) : 
    super.withId(concept, country, name); 
 
} 
 
class Places extends PlacesGen { 
 
  Places(Concept concept) : super(concept); 
 
} 
 
