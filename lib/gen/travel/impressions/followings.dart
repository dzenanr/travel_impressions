part of travel_impressions; 
 
// lib/gen/travel/impressions/followings.dart 
 
abstract class FollowingGen extends ConceptEntity<Following> { 
 
  FollowingGen(Concept concept) {
    this.concept = concept;
  }
 
  FollowingGen.withId(Concept concept, Traveler follows, Traveler followedBy) { 
    this.concept = concept;
    setParent("follows", follows); 
    setParent("followedBy", followedBy); 
  } 
 
  Traveler get follows => getParent("follows"); 
  set follows(Traveler p) => setParent("follows", p); 
  
  Traveler get followedBy => getParent("followedBy"); 
  set followedBy(Traveler p) => setParent("followedBy", p); 
  
  bool get updateRights => getAttribute("updateRights"); 
  set updateRights(bool a) => setAttribute("updateRights", a); 
  
  Following newEntity() => new Following(concept); 
  Followings newEntities() => new Followings(concept); 
  
} 
 
abstract class FollowingsGen extends Entities<Following> { 
 
  FollowingsGen(Concept concept) {
    this.concept = concept;
  }
 
  Followings newEntities() => new Followings(concept); 
  Following newEntity() => new Following(concept); 
  
} 
 
