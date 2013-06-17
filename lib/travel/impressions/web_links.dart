part of travel_impressions; 
 
// lib/travel/impressions/web_links.dart 
 
class WebLink extends WebLinkGen { 
 
  WebLink(Concept concept) : super(concept); 
 
  WebLink.withId(Concept concept, Uri url) : 
    super.withId(concept, url); 
 
} 
 
class WebLinks extends WebLinksGen { 
 
  WebLinks(Concept concept) : super(concept); 
 
} 
 
