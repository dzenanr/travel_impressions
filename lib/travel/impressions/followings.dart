part of travel_impressions; 
 
// lib/travel/impressions/followings.dart 
 
class Following extends FollowingGen { 
 
  Following(Concept concept) : super(concept); 
 
  Following.withId(Concept concept, Traveler follows, Traveler followedBy) : 
    super.withId(concept, follows, followedBy); 
 
} 
 
class Followings extends FollowingsGen { 
 
  Followings(Concept concept) : super(concept); 
 
} 
 
