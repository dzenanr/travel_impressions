part of travel_impressions; 
 
// lib/gen/travel/impressions/countries.dart 
 
abstract class CountryGen extends ConceptEntity<Country> { 
 
  CountryGen(Concept concept) { 
    this.concept = concept;
    Concept placeConcept = concept.model.concepts.singleWhereCode("Place"); 
    setChild("places", new Places(placeConcept)); 
  } 
 
  CountryGen.withId(Concept concept, String name) { 
    this.concept = concept;
    setAttribute("name", name); 
    Concept placeConcept = concept.model.concepts.singleWhereCode("Place"); 
    setChild("places", new Places(placeConcept)); 
  } 
 
  String get name => getAttribute("name"); 
  set name(String a) => setAttribute("name", a); 
  
  Places get places => getChild("places"); 
  
  Country newEntity() => new Country(concept); 
  Countries newEntities() => new Countries(concept); 
  
  int nameCompareTo(Country other) { 
    return name.compareTo(other.name); 
  } 
 
} 
 
abstract class CountriesGen extends Entities<Country> { 
 
  CountriesGen(Concept concept) {
    this.concept = concept;
  }
 
  Countries newEntities() => new Countries(concept); 
  Country newEntity() => new Country(concept); 
  
} 
 
