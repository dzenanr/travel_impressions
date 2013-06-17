part of travel_impressions; 
 
// lib/gen/travel/impressions/web_links.dart 
 
abstract class WebLinkGen extends ConceptEntity<WebLink> { 
 
  WebLinkGen(Concept concept) : super.of(concept); 
 
  WebLinkGen.withId(Concept concept, Uri url) : super.of(concept) { 
    setAttribute("url", url); 
  } 
 
  Place get place => getParent("place"); 
  set place(Place p) => setParent("place", p); 
  
  Uri get url => getAttribute("url"); 
  set url(Uri a) => setAttribute("url", a); 
  
  String get title => getAttribute("title"); 
  set title(String a) => setAttribute("title", a); 
  
  String get description => getAttribute("description"); 
  set description(String a) => setAttribute("description", a); 
  
  WebLink newEntity() => new WebLink(concept); 
  WebLinks newEntities() => new WebLinks(concept); 
  
  int urlCompareTo(WebLink other) { 
    return url.toString().compareTo(other.url.toString()); 
  } 
 
} 
 
abstract class WebLinksGen extends Entities<WebLink> { 
 
  WebLinksGen(Concept concept) : super.of(concept); 
 
  WebLinks newEntities() => new WebLinks(concept); 
  WebLink newEntity() => new WebLink(concept); 
  
} 
 
