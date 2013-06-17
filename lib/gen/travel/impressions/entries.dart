part of travel_impressions; 
 
// lib/gen/travel/impressions/entries.dart 
 
class ImpressionsEntries extends ModelEntries { 
 
  ImpressionsEntries(Model model) : super(model); 
 
  Map<String, Entities> newEntries() { 
    var entries = new Map<String, Entities>(); 
    var concept; 
    concept = model.concepts.singleWhereCode("Traveler"); 
    entries["Traveler"] = new Travelers(concept); 
    concept = model.concepts.singleWhereCode("Country"); 
    entries["Country"] = new Countries(concept); 
    return entries; 
  } 
 
  Entities newEntities(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Traveler") { 
      return new Travelers(concept); 
    } 
    if (concept.code == "Place") { 
      return new Places(concept); 
    } 
    if (concept.code == "Impression") { 
      return new Impressions(concept); 
    } 
    if (concept.code == "Message") { 
      return new Messages(concept); 
    } 
    if (concept.code == "Country") { 
      return new Countries(concept); 
    } 
    if (concept.code == "WebLink") { 
      return new WebLinks(concept); 
    } 
    if (concept.code == "Following") { 
      return new Followings(concept); 
    } 
  } 
 
  ConceptEntity newEntity(String conceptCode) { 
    var concept = model.concepts.singleWhereCode(conceptCode); 
    if (concept == null) { 
      throw new ConceptError("${conceptCode} concept does not exist.") ; 
    } 
    if (concept.code == "Traveler") { 
      return new Traveler(concept); 
    } 
    if (concept.code == "Place") { 
      return new Place(concept); 
    } 
    if (concept.code == "Impression") { 
      return new Impression(concept); 
    } 
    if (concept.code == "Message") { 
      return new Message(concept); 
    } 
    if (concept.code == "Country") { 
      return new Country(concept); 
    } 
    if (concept.code == "WebLink") { 
      return new WebLink(concept); 
    } 
    if (concept.code == "Following") { 
      return new Following(concept); 
    } 
  } 
 
  fromJsonToData() { 
    fromJson(travelImpressionsDataJson); 
  } 
 
  Travelers get travelers => getEntry("Traveler"); 
  Countries get countries => getEntry("Country"); 
 
} 
 
