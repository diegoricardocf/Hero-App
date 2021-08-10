import 'package:flutter_test/flutter_test.dart';
import 'package:hero_app/stores/search_hero_store.dart';

import 'mock_context.dart';
import 'mock_hero_repository.dart';

void main() {
  testWidgets(
      'should return a not empty list when search for an valid hero name',
      (WidgetTester tester) async {
    MockBuildContext mockContext = MockBuildContext();

    //GIVEN A STORE WITH A MOCKED REPOSITORY
    final store = SearchHeroStore();
    final mockRepository = MockHeroRepository(returnEmptyList: false);
    store.herosRepository = mockRepository;

    //WHEN SEARCH A HERO BY THE NAME
    await store.searchHeroByName("heroname", mockContext);

    //THEN EXPECTS A NOT EMPTY LIST
    expect(true, store.heros.isNotEmpty);
  });

  testWidgets(
      'should return a empty list when search for an not valid hero name',
      (WidgetTester tester) async {
    MockBuildContext mockContext = MockBuildContext();

    //GIVEN A STORE WITH A MOCKED REPOSITORY
    final store = SearchHeroStore();
    final mockRepository = MockHeroRepository(returnEmptyList: true);
    store.herosRepository = mockRepository;

    //WHEN SEARCH A NOT VALID HERO BY THE NAME
    await store.searchHeroByName("heroname", mockContext);

    //THEN EXPECTS A  EMPTY LIST
    expect(true, store.heros.isEmpty);
  });

  testWidgets(
      'showEmptyState should be true when the returned list from repository is empty',
      (WidgetTester tester) async {
    MockBuildContext mockContext = MockBuildContext();

    //GIVEN A STORE WITH A MOCKED REPOSITORY
    final store = SearchHeroStore();
    final mockRepository = MockHeroRepository(returnEmptyList: true);
    store.herosRepository = mockRepository;

    //WHEN SEARCH A NOT VALID HERO BY THE NAME
    await store.searchHeroByName("heroname", mockContext);

    //THEN EXPECTS THAT SHOWEMPTYSTATE IS TRUE
    expect(true, store.showEmptyState);
  });

  testWidgets(
      'showEmptyState should be false when when the returned list from repository is not empty',
      (WidgetTester tester) async {
    MockBuildContext mockContext = MockBuildContext();

    //GIVEN A STORE WITH A MOCKED REPOSITORY
    final store = SearchHeroStore();
    final mockRepository = MockHeroRepository(returnEmptyList: false);
    store.herosRepository = mockRepository;

    //WHEN SEARCH A NOT VALID HERO BY THE NAME
    await store.searchHeroByName("heroname", mockContext);

    //THEN EXPECTS THAT SHOWEMPTYSTATE IS FALSE
    expect(false, store.showEmptyState);
  });
}
