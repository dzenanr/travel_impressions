 
// test/travel/impressions/travel_impressions_test.dart 
 
import "package:unittest/unittest.dart"; 
 
import "package:dartling/dartling.dart"; 
 
import "package:travel_impressions/travel_impressions.dart"; 
 
testTravelImpressions(Repo repo, String domainCode, String modelCode) { 
  var models; 
  var session; 
  var entries; 
  group("Testing ${domainCode}.${modelCode}", () { 
    setUp(() { 
      models = repo.getDomainModels(domainCode); 
      session = models.newSession(); 
      entries = models.getModelEntries(modelCode); 
      expect(entries, isNotNull); 
 
 
    }); 
    tearDown(() { 
      entries.clear(); 
    }); 
    test("Empty Entries Test", () { 
      expect(entries.isEmpty, isTrue); 
    }); 
 
  }); 
} 
 
testTravelData(TravelRepo travelRepo) { 
  testTravelImpressions(travelRepo, TravelRepo.travelDomainCode, 
      TravelRepo.travelImpressionsModelCode); 
} 
 
void main() { 
  var travelRepo = new TravelRepo(); 
  testTravelData(travelRepo); 
} 
 
