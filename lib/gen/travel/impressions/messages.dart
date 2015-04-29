part of travel_impressions; 
 
// lib/gen/travel/impressions/messages.dart 
 
abstract class MessageGen extends ConceptEntity<Message> { 
 
  MessageGen(Concept concept) { 
    this.concept = concept;
    Concept impressionConcept = concept.model.concepts.singleWhereCode("Impression"); 
    setChild("impressions", new Impressions(impressionConcept)); 
  } 
 
  MessageGen.withId(Concept concept, Traveler traveler, DateTime date) { 
    this.concept = concept;
    setParent("traveler", traveler); 
    setAttribute("date", date); 
    Concept impressionConcept = concept.model.concepts.singleWhereCode("Impression"); 
    setChild("impressions", new Impressions(impressionConcept)); 
  } 
 
  Traveler get traveler => getParent("traveler"); 
  set traveler(Traveler p) => setParent("traveler", p); 
  
  DateTime get date => getAttribute("date"); 
  set date(DateTime a) => setAttribute("date", a); 
  
  String get subject => getAttribute("subject"); 
  set subject(String a) => setAttribute("subject", a); 
  
  String get text => getAttribute("text"); 
  set text(String a) => setAttribute("text", a); 
  
  Impressions get impressions => getChild("impressions"); 
  
  Message newEntity() => new Message(concept); 
  Messages newEntities() => new Messages(concept); 
  
  int dateCompareTo(Message other) { 
    return date.compareTo(other.date); 
  } 
 
} 
 
abstract class MessagesGen extends Entities<Message> { 
 
  MessagesGen(Concept concept) {
    this.concept = concept;
  }
 
  Messages newEntities() => new Messages(concept); 
  Message newEntity() => new Message(concept); 
  
} 
 
