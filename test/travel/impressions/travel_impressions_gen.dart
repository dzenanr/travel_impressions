 
// test/travel/impressions/travel_impressions_gen.dart 
 
import "package:dartling/dartling.dart"; 
 
import "package:travel_impressions/travel_impressions.dart"; 
 
genCode() { 
  var repo = new Repo(); 
 
  // change "Dartling" to "YourDomainName" 
  var travelDomain = new Domain("Travel"); 
 
  // change dartling to yourDomainName 
  // change Skeleton to YourModelName 
  // change "Skeleton" to "YourModelName" 
  Model travelImpressionsModel = 
      fromMagicBoxes(travelImpressionsModelJson, travelDomain, "Impressions"); 
 
  repo.domains.add(travelDomain); 
 
  repo.gen("travel_impressions"); 
} 
 
initTravelData(TravelRepo travelRepo) { 
   var travelModels = 
       travelRepo.getDomainModels(TravelRepo.travelDomainCode); 
 
   var travelImpressionsEntries = 
       travelModels.getModelEntries(TravelRepo.travelImpressionsModelCode); 
   initTravelImpressions(travelImpressionsEntries); 
   travelImpressionsEntries.display(); 
   travelImpressionsEntries.displayJson(); 
} 
 
void main() { 
  genCode(); 
 
  var travelRepo = new TravelRepo(); 
  initTravelData(travelRepo); 
} 
 
