part of travel_impressions; 
 
// lib/travel/impressions/messages.dart 
 
class Message extends MessageGen { 
 
  Message(Concept concept) : super(concept); 
 
  Message.withId(Concept concept, Traveler traveler, DateTime date) : 
    super.withId(concept, traveler, date); 
 
} 
 
class Messages extends MessagesGen { 
 
  Messages(Concept concept) : super(concept); 
 
} 
 
