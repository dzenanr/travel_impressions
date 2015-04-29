
// test/travel/impressions/travel_impressions_test.dart

import "package:test/test.dart";
import "package:dartling/dartling.dart";
import "package:travel_impressions/travel_impressions.dart";

class PlaceReaction implements ActionReactionApi {
  bool reactedOnAdd = false;
  bool reactedOnUpdate = false;

  react(BasicAction action) {
    if (action is EntitiesAction) {
      reactedOnAdd = true;
    } else if (action is EntityAction) {
      reactedOnUpdate = true;
    }
  }
}

testTravelImpressions(Repo repo, String domainCode, String modelCode) {
  var models;
  var session;
  var entries;

  Countries countries;
  Country bosnia;
  Oid darivaOid;
  Oid oid;
  group("Testing ${domainCode}.${modelCode}", () {
    setUp(() {
      models = repo.getDomainModels(domainCode);
      session = models.newSession();
      entries = models.getModelEntries(modelCode);

      countries = entries.countries;
      initTravelImpressions(entries);

      var code = 'BA';
      bosnia = countries.singleWhereCode(code);
      darivaOid = bosnia.places.firstWhereAttribute('name', 'Dariva').oid;
    });
    tearDown(() {
      entries.clear();
    });
    test("Not empty entries test", () {
      expect(!entries.isEmpty, isTrue);
    });

    test('Find country by code', () {
      var code = 'BA';
      Country country = countries.singleWhereCode(code);
      expect(country, isNotNull);
      expect(country.name, equals('Bosnia and Herzegovina'));
    });
    test('Find country by id', () {
      Id id = new Id(countries.concept);
      id.setAttribute('name', 'Bosnia and Herzegovina');
      Country country = countries.singleWhereId(id);
      expect(country, isNotNull);
      expect(country.code, equals('BA'));
    });
    test('Find country by name attribute id', () {
      var name = 'Bosnia and Herzegovina';
      Country country = countries.singleWhereAttributeId('name', name);
      expect(country, isNotNull);
      expect(country.code, equals('BA'));
    });
    test('Find country by name attribute', () {
      var name = 'Bosnia and Herzegovina';
      Country country = countries.firstWhereAttribute('name', name);
      expect(country, isNotNull);
      expect(country.code, equals('BA'));
    });
    test('Find (not) country by name attribute id', () {
      var name = 'Poland';
      Country country = countries.singleWhereAttributeId('name', name);
      expect(country, isNull);
    });
    test('Find country and (not) place by name id', () {
      var countryName = 'Bosnia and Herzegovina';
      Country country = countries.singleWhereAttributeId('name', countryName);

      var placeName = 'Dariva';
      Places places = country.places;
      Place place = places.singleWhereAttributeId('name', placeName);
      expect(place, isNull);
    });
    test('Find country and place by name attribute', () {
      var countryName = 'Bosnia and Herzegovina';
      bosnia = countries.firstWhereAttribute('name', countryName);
      expect(bosnia, isNotNull);

      var placeName = 'Dariva';
      Places places = bosnia.places;
      Place place = places.firstWhereAttribute('name', placeName);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));
    });
    test('Find country and place by id', () {
      var countryName = 'Bosnia and Herzegovina';
      bosnia = countries.singleWhereAttributeId('name', countryName);

      var placeName = 'Dariva';
      Places places = bosnia.places;
      Id id = new Id(bosnia.concept);
      id.setParent('country', bosnia);
      id.setAttribute('name', placeName);
      Place place = places.singleWhereId(id);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));
    });
    test('Find place by id (method cascades)', () {
      var placeName = 'Dariva';
      Places places = bosnia.places;
      Id id = new Id(bosnia.concept)
        ..setParent('country', bosnia)
        ..setAttribute('name', placeName);
      Place place = places.singleWhereId(id);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));
      oid = place.oid;
    });
    test('Find (not) place by oid', () {
      Places places = bosnia.places;
      Place place = places.singleWhereOid(oid);
      expect(place, isNull);
    });
    test('Find place by oid', () {
      Places places = bosnia.places;
      Place place = places.singleWhereOid(darivaOid);
      expect(place, isNotNull);
      expect(place.name, equals('Dariva'));
    });
    test('Find place by oid by searching from countries down', () {
      Place place = countries.internalSingle(darivaOid);
      expect(place, isNotNull);
      expect(place.name, equals('Dariva'));
    });
    test('Find place by a specific method', () {
      var placeName = 'Dariva';
      Place place = bosnia.places.findById(placeName, bosnia);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));
    });
    test('Select places in Sarajevo', () {
      Places places = bosnia.places.selectWhereAttribute('city', 'Sarajevo');
      expect(places.length, greaterThan(0));
      //places.forEach((place) => expect(place.city, equals('Sarajevo')));
      for (var place in places) {
        expect(place.city, equals('Sarajevo'));
      }
    });
    test('Select places by function', () {
      Places places = bosnia.places.selectWhere((place) => place.old);
      expect(places.length, greaterThan(0));
      for (var place in places) {
        expect(place.description, contains('old'));
      }
    });
    test('Sort places by city in Bosnia and Herzegovina', () {
      bosnia.places.sort(
          (place1, place2) => place1.city.compareTo(place2.city));
      //bosnia.places.display(title:'Sort places by city in Bosnia and Herzegovina');
    });
    test('Order places by code or id in Bosnia and Herzegovina', () {
      Places places = bosnia.places.order();
      expect(places.isEmpty, isFalse);
      expect(places.length, equals(bosnia.places.length));
      expect(places.source.isEmpty, isFalse);
      expect(places.source.length, equals(places.length));
      //places.display(title:'Order places by id in Bosnia and Herzegovina');
    });
    test('Random place', () {
      Places places = bosnia.places;
      var place1 = places.random();
      expect(place1, isNotNull);
      //place1.display(prefix:'random1');

      var place2 = places.random();
      expect(place2, isNotNull);
      //place2.display(prefix:'random2');
    });
    test('True for every place', () {
      Places places = bosnia.places;
      expect(places.every((place) => place.code == null), isTrue);
      expect(places.every((place) => place.name != null), isTrue);
    });

    test('Add place required error', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      var added = places.add(place);
      expect(added, isFalse);
      expect(places.length, equals(placesCount));

      places.errors.display(title:'Add place required error');
      expect(places.errors.length, equals(2));
      expect(places.errors.toList()[0].category, equals('required'));
      expect(places.errors.toList()[0].message,
          equals('Place.name attribute is null.'));
      expect(places.errors.toList()[1].category, equals('required'));
      expect(places.errors.toList()[1].message,
          equals('Place.country parent is null.'));
    });
    test('Add place unique error', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Dariva';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isFalse);
      expect(places.length, equals(placesCount));

      places.errors.display(title:'Add place unique error');
      expect(places.errors.length, equals(1));
      expect(places.errors.toList()[0].category, equals('unique'));
    });
    test('Add place pre validation error', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name =
          'A new place with a name longer than 32 that cannot be accepted';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isFalse);
      expect(places.length, equals(placesCount));

      places.errors.display(title:'Add place pre validation error');
      expect(places.errors.length, equals(1));
      expect(places.errors.toList()[0].category, equals('pre'));
    });
    test('Add place', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isTrue);
      expect(places.length, equals(++placesCount));
    });
    test('Select places then add', () {
      Places oldPlaces = bosnia.places.selectWhere((place) => place.old);
      expect(oldPlaces.length, greaterThan(0));
      for (var place in oldPlaces) {
        expect(place.description, contains('old'));
      }
      expect(oldPlaces.source.isEmpty, isFalse);
      var countryPlacesCount = bosnia.places.length;

      var oldPlacesCount = oldPlaces.length;
      var place = new Place(oldPlaces.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.description = 'old bath';
      place.country = bosnia;
      var added = oldPlaces.add(place);
      expect(added, isTrue);
      expect(oldPlaces.length, equals(++oldPlacesCount));
      expect(bosnia.places.length, equals(++countryPlacesCount));
    });
    test('Select places then remove', () {
      Places oldPlaces = bosnia.places.selectWhere((place) => place.old);
      expect(oldPlaces.length, greaterThan(0));
      for (var place in oldPlaces) {
        expect(place.description, contains('old'));
      }
      expect(oldPlaces.source.isEmpty, isFalse);
      var countryPlacesCount = bosnia.places.length;

      var oldPlacesCount = oldPlaces.length;
      var placeName = 'Bascarsija';
      Place place = oldPlaces.findById(placeName, bosnia);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));
      var removed = oldPlaces.remove(place);
      expect(removed, isTrue);
      expect(oldPlaces.length, equals(--oldPlacesCount));
      expect(bosnia.places.length, equals(--countryPlacesCount));
    });
    test('Select places then (not) remove', () {
      Places oldPlaces = bosnia.places.selectWhere((place) => place.old);
      expect(oldPlaces.length, greaterThan(0));
      for (var place in oldPlaces) {
        expect(place.description, contains('old'));
      }
      expect(oldPlaces.source.isEmpty, isFalse);
      var countryPlacesCount = bosnia.places.length;

      var oldPlacesCount = oldPlaces.length;
      var placeName = 'Bascarsija';
      Place place = oldPlaces.findById(placeName, bosnia);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));
      oldPlaces.propagateToSource = false;
      var removed = oldPlaces.remove(place);
      expect(removed, isTrue);
      expect(oldPlaces.length, equals(--oldPlacesCount));
      expect(bosnia.places.length, equals(countryPlacesCount));
    });
    test('Update new place id error with try', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isTrue);
      expect(places.length, equals(++placesCount));

      var beforeNameUpdate = place.name;
      try {
        place.name = 'Ilidza town';
      } on UpdateError catch (e) {
        expect(place.name, equals(beforeNameUpdate));
      }
    });
    test('Update new place id error without try', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isTrue);
      expect(places.length, equals(++placesCount));

      var beforeNameUpdate = place.name;
      expect(() => place.name = 'Ilidza town', throws);
      expect(place.name, equals(beforeNameUpdate));
    });
    test('Update new place id', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isTrue);
      expect(places.length, equals(++placesCount));

      var placeCopy = place.copy();
      var nameAttribute = place.concept.attributes.singleWhereCode('name');
      expect(nameAttribute.update, isFalse);
      nameAttribute.update = true;
      var newName = 'Ilidza town';
      placeCopy.name = newName;
      expect(placeCopy.name, equals(newName));
      nameAttribute.update = false;
      var updated = places.update(place, placeCopy);
      expect(updated, isTrue);

      var updatedPlace = places.findById(newName, bosnia);
      updatedPlace.display();
    });
    test('Update new place description error', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isTrue);
      expect(places.length, equals(++placesCount));

      var placeCopy = place.copy();
      var newDescription = 'Ilidza town';
      placeCopy.description = newDescription;
      expect(placeCopy.description, equals(newDescription));
      // places.update can only be used if oid, code or id set.
      expect(() => places.update(place, placeCopy), throws);
    });
    test('Update new place description', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;
      var added = places.add(place);
      expect(added, isTrue);
      expect(places.length, equals(++placesCount));

      var newDescription = 'Ilidza town';
      place.description = newDescription;
      expect(place.description, equals(newDescription));
      //place.display(prefix:'new description: ');
    });

    test('New place undo and redo with action', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;

      var action = new AddAction(session, places, place);
      action.doit();
      expect(places.length, equals(++placesCount));

      action.undo();
      expect(places.length, equals(--placesCount));
      action.redo();
      expect(places.length, equals(++placesCount));
    });
    test('Several undos and redos with session', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;

      var addAction = new AddAction(session, places, place);
      addAction.doit();
      expect(places.length, equals(++placesCount));
      var removeAction = new RemoveAction(session, places, place);
      removeAction.doit();
      expect(places.length, equals(--placesCount));

      session.past.undo();  // remove
      expect(places.length, equals(++placesCount));
      session.past.undo(); // add
      expect(places.length, equals(--placesCount));
      session.past.redo(); // add
      expect(places.length, equals(++placesCount));
      session.past.redo(); // remove
      expect(places.length, equals(--placesCount));
    });
    test('Update place description undo and redo with session', () {
      var placeName = 'Dariva';
      Place place = bosnia.places.findById(placeName, bosnia);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));

      var descriptionBeforeUpdate = place.description;
      var descriptionAfterUpdate = 'old bridge over Miljacka river';
      var action =
          new SetAttributeAction(session, place, 'description',
              descriptionAfterUpdate);
      action.doit();

      session.past.undo();
      expect(place.description, equals(action.before));
      expect(place.description, equals(descriptionBeforeUpdate));
      session.past.redo();
      expect(place.description, equals(action.after));
      expect(place.description, equals(descriptionAfterUpdate));
    });
    test('Transaction undo and redo with session', () {
      Places places = bosnia.places;
      var placesCount = places.length;
      var place1 = new Place(places.concept);
      expect(place1, isNotNull);
      place1.name = 'Ilidza';
      place1.city = 'Sarajevo';
      place1.country = bosnia;
      var place2 = new Place(places.concept);
      expect(place2, isNotNull);
      place2.name = 'Igman';
      place2.city = 'Sarajevo';
      place2.country = bosnia;

      var action1 = new AddAction(session, places, place1);
      var action2 = new AddAction(session, places, place2);
      var transaction = new Transaction('two adds on places in bosnia', session);
      transaction.add(action1);
      transaction.add(action2);
      transaction.doit();
      placesCount = placesCount + 2;
      expect(places.length, equals(placesCount));
      //places.display(title:'Transaction done');

      session.past.undo();
      placesCount = placesCount - 2;
      expect(places.length, equals(placesCount));
      //places.display(title:'Transaction undone');
      session.past.redo();
      placesCount = placesCount + 2;
      expect(places.length, equals(placesCount));
      //places.display(title:'Transaction redone');
    });
    test('Reactions to actions', () {
      var reaction = new PlaceReaction();
      expect(reaction, isNotNull);
      models.startActionReaction(reaction);

      Places places = bosnia.places;
      var placesCount = places.length;
      var place = new Place(places.concept);
      expect(place, isNotNull);
      place.name = 'Ilidza';
      place.city = 'Sarajevo';
      place.country = bosnia;

      var addAction = new AddAction(session, places, place);
      addAction.doit();
      expect(places.length, equals(++placesCount));
      expect(reaction.reactedOnAdd, isTrue);

      var description = 'healthy bath';
      var setAttributeAction =
          new SetAttributeAction(session, place, 'description', description);
      setAttributeAction.doit();
      expect(reaction.reactedOnUpdate, isTrue);

      models.cancelActionReaction(reaction);
    });

    test('Copy places', () {
      Places places = bosnia.places;
      Places copiedPlaces = places.copy();
      expect(copiedPlaces.isEmpty, isFalse);
      expect(copiedPlaces.length, equals(places.length));
      expect(copiedPlaces, isNot(same(places)));
      for (var cp in copiedPlaces) {
        expect(cp, equals(places.singleWhereOid(cp.oid)));
      }
      for (var cp in copiedPlaces) {
        expect(cp, isNot(same(places.singleWhereId(cp.id))));
      }
      //copiedPlaces.display(title:'Copied places');
    });
    test('Copy place', () {
      var placeName = 'Dariva';
      Place place = bosnia.places.findById(placeName, bosnia);
      expect(place, isNotNull);
      expect(place.city, equals('Sarajevo'));

      var placeCopy = place.copy();
      expect(placeCopy, isNotNull);
      expect(placeCopy, isNot(same(place)));
      expect(place, equals(placeCopy));
      expect(place.oid, equals(placeCopy.oid));
      expect(place.name, equals(placeCopy.name));
      expect(place.country, equals(placeCopy.country));
      expect(place.description, equals(placeCopy.description));

      expect(place.id, isNotNull);
      expect(placeCopy.id, isNotNull);
      expect(place.id, equals(placeCopy.id));
    });
    test('From entries to data in json', () {
      var json = entries.toJson();
      expect(json, isNotNull);
      print(json);
      entries.displayJson();
      // copy the displayed json to lib/travel/impressions/json/data.dart
    });
    test('From data in json to entries', () {
      var json = entries.toJson();
      entries.clear();
      expect(entries.isEmpty, isTrue);
      entries.fromJson(json);
      expect(entries.isEmpty, isFalse);
      entries.display();
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

