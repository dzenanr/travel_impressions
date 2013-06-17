 
// web/travel/impressions/travel_impressions_web.dart 
 
import "dart:html"; 
 
import "package:dartling/dartling.dart"; 
import "package:dartling_default_app/dartling_default_app.dart"; 
 
import "package:travel_impressions/travel_impressions.dart"; 
 
initTravelData(TravelRepo travelRepo) { 
   var travelModels = 
       travelRepo.getDomainModels(TravelRepo.travelDomainCode); 
 
   var travelImpressionsEntries = 
       travelModels.getModelEntries(TravelRepo.travelImpressionsModelCode); 
   initTravelImpressions(travelImpressionsEntries); 
   travelImpressionsEntries.display(); 
   travelImpressionsEntries.displayJson(); 
} 
 
showTravelData(TravelRepo travelRepo) { 
   var mainView = new View(document, "main"); 
   mainView.repo = travelRepo; 
   new RepoMainSection(mainView); 
} 
 
void main() { 
  var travelRepo = new TravelRepo(); 
  initTravelData(travelRepo); 
  showTravelData(travelRepo); 
} 
 
