part of travel_impressions; 
 
// lib/gen/travel/impressions/impressions.dart 
 
abstract class ImpressionGen extends ConceptEntity<Impression> { 
 
  ImpressionGen(Concept concept) {
    this.concept = concept;
  }
 
  ImpressionGen.withId(Concept concept, Place place, Message message) { 
    this.concept = concept;
    setParent("place", place); 
    setParent("message", message); 
  } 
 
  Place get place => getParent("place"); 
  set place(Place p) => setParent("place", p); 
  
  Message get message => getParent("message"); 
  set message(Message p) => setParent("message", p); 
  
  String get text => getAttribute("text"); 
  set text(String a) => setAttribute("text", a); 
  
  Impression newEntity() => new Impression(concept); 
  Impressions newEntities() => new Impressions(concept); 
  
} 
 
abstract class ImpressionsGen extends Entities<Impression> { 
 
  ImpressionsGen(Concept concept) {
    this.concept = concept;
  }
 
  Impressions newEntities() => new Impressions(concept); 
  Impression newEntity() => new Impression(concept); 
  
} 
 
