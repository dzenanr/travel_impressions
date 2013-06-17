part of travel_impressions; 
 
// lib/gen/travel/repository.dart 
 
class TravelRepo extends Repo { 
 
  static final travelDomainCode = "Travel"; 
  static final travelImpressionsModelCode = "Impressions"; 
 
  TravelRepo([String code="TravelRepo"]) : super(code) { 
    _initTravelDomain(); 
  } 
 
  _initTravelDomain() { 
    var travelDomain = new Domain(travelDomainCode); 
    domains.add(travelDomain); 
    add(new TravelModels(travelDomain)); 
  } 
 
} 
 
