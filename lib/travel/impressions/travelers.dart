part of travel_impressions; 
 
// lib/travel/impressions/travelers.dart 
 
class Traveler extends TravelerGen { 
 
  Traveler(Concept concept) : super(concept); 
 
  Traveler.withId(Concept concept, String email) : 
    super.withId(concept, email); 
 
} 
 
class Travelers extends TravelersGen { 
 
  Travelers(Concept concept) : super(concept); 
 
} 
 
