part of travel_impressions; 
 
// lib/gen/travel/models.dart 
 
class TravelModels extends DomainModels { 
 
  TravelModels(Domain domain) : super(domain) { 
    add(fromJsonToImpressionsEntries()); 
  } 
 
  ImpressionsEntries fromJsonToImpressionsEntries() { 
    return new ImpressionsEntries(fromMagicBoxes( 
      travelImpressionsModelJson, 
      domain, 
      TravelRepo.travelImpressionsModelCode)); 
  } 
 
} 
 
