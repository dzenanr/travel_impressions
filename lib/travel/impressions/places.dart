part of travel_impressions;

// lib/travel/impressions/places.dart

class Place extends PlaceGen {

  Place(Concept concept) : super(concept);

  Place.withId(Concept concept, Country country, String name) :
    super.withId(concept, country, name);

  bool get old => description.contains('old') ? true : false;

}

class Places extends PlacesGen {

  Places(Concept concept) : super(concept);

  Place findById(String name, Country country) {
    return singleWhereId(new Id(concept)..setAttribute('name', name)..
        setParent('country', country));
  }

  bool preAdd(Place place) {
    bool validation = super.preAdd(place);
    if (validation) {
      validation = place.name.length <= 32;
      if (!validation) {
        var error = new ValidationError('pre');
        error.message =
            '${concept.codePlural}.preAdd rejects the "${place.name}" '
            'name that is longer than 32.';
        errors.add(error);
      }
    }
    return validation;
  }

}

