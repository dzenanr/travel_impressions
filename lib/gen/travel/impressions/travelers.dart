part of travel_impressions; 
 
// lib/gen/travel/impressions/travelers.dart 
 
abstract class TravelerGen extends ConceptEntity<Traveler> { 
 
  TravelerGen(Concept concept) { 
    this.concept = concept;
    Concept messageConcept = concept.model.concepts.singleWhereCode("Message"); 
    setChild("messages", new Messages(messageConcept)); 
    Concept followingConcept = concept.model.concepts.singleWhereCode("Following"); 
    setChild("followedBy", new Followings(followingConcept)); 
    setChild("follows", new Followings(followingConcept)); 
  } 
 
  TravelerGen.withId(Concept concept, String email) { 
    this.concept = concept;
    setAttribute("email", email); 
    Concept messageConcept = concept.model.concepts.singleWhereCode("Message"); 
    setChild("messages", new Messages(messageConcept)); 
    Concept followingConcept = concept.model.concepts.singleWhereCode("Following"); 
    setChild("followedBy", new Followings(followingConcept)); 
    setChild("follows", new Followings(followingConcept)); 
  } 
 
  String get email => getAttribute("email"); 
  set email(String a) => setAttribute("email", a); 
  
  String get password => getAttribute("password"); 
  set password(String a) => setAttribute("password", a); 
  
  String get firstName => getAttribute("firstName"); 
  set firstName(String a) => setAttribute("firstName", a); 
  
  String get lastName => getAttribute("lastName"); 
  set lastName(String a) => setAttribute("lastName", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  Messages get messages => getChild("messages"); 
  
  Followings get followedBy => getChild("followedBy"); 
  
  Followings get follows => getChild("follows"); 
  
  Traveler newEntity() => new Traveler(concept); 
  Travelers newEntities() => new Travelers(concept); 
  
  int emailCompareTo(Traveler other) { 
    return email.compareTo(other.email); 
  } 
 
} 
 
abstract class TravelersGen extends Entities<Traveler> { 
 
  TravelersGen(Concept concept) {
    this.concept = concept;
  }
 
  Travelers newEntities() => new Travelers(concept); 
  Traveler newEntity() => new Traveler(concept); 
  
} 
 
