part of travel_impressions; 
 
// lib/travel/impressions/impressions.dart 
 
class Impression extends ImpressionGen { 
 
  Impression(Concept concept) : super(concept); 
 
  Impression.withId(Concept concept, Place place, Message message) : 
    super.withId(concept, place, message); 
 
} 
 
class Impressions extends ImpressionsGen { 
 
  Impressions(Concept concept) : super(concept); 
 
} 
 
