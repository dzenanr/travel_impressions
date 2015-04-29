part of travel_impressions; 
 
// lib/gen/travel/impressions/places.dart 
 
abstract class PlaceGen extends ConceptEntity<Place> { 
 
  PlaceGen(Concept concept) { 
    this.concept = concept;
    Concept impressionConcept = concept.model.concepts.singleWhereCode("Impression"); 
    setChild("impressions", new Impressions(impressionConcept)); 
    Concept webLinkConcept = concept.model.concepts.singleWhereCode("WebLink"); 
    setChild("webLinks", new WebLinks(webLinkConcept)); 
  } 
 
  PlaceGen.withId(Concept concept, Country country, String name) { 
    this.concept = concept;
    setParent("country", country); 
    setAttribute("name", name); 
    Concept impressionConcept = concept.model.concepts.singleWhereCode("Impression"); 
    setChild("impressions", new Impressions(impressionConcept)); 
    Concept webLinkConcept = concept.model.concepts.singleWhereCode("WebLink"); 
    setChild("webLinks", new WebLinks(webLinkConcept)); 
  } 
 
  Country get country => getParent("country"); 
  set country(Country p) => setParent("country", p); 
  
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  String get city => getAttribute("city"); 
  set city(String a) => setAttribute("city", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  Impressions get impressions => getChild("impressions"); 
  
  WebLinks get webLinks => getChild("webLinks"); 
  
  Place newEntity() => new Place(concept); 
  Places newEntities() => new Places(concept); 
  
  int nameCompareTo(Place other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class PlacesGen extends Entities<Place> { 
 
  PlacesGen(Concept concept) {
    this.concept = concept;
  }
 
  Places newEntities() => new Places(concept); 
  Place newEntity() => new Place(concept); 
  
} 
 
