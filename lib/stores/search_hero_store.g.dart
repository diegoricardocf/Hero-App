// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_hero_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SearchHeroStore on _SearchHeroStoreBase, Store {
  Computed<int>? _$totalItemsComputed;

  @override
  int get totalItems =>
      (_$totalItemsComputed ??= Computed<int>(() => super.totalItems,
              name: '_SearchHeroStoreBase.totalItems'))
          .value;

  final _$herosAtom = Atom(name: '_SearchHeroStoreBase.heros');

  @override
  ObservableList<SuperHero> get heros {
    _$herosAtom.reportRead();
    return super.heros;
  }

  @override
  set heros(ObservableList<SuperHero> value) {
    _$herosAtom.reportWrite(value, super.heros, () {
      super.heros = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_SearchHeroStoreBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$showHistoricListAtom =
      Atom(name: '_SearchHeroStoreBase.showHistoricList');

  @override
  bool get showHistoricList {
    _$showHistoricListAtom.reportRead();
    return super.showHistoricList;
  }

  @override
  set showHistoricList(bool value) {
    _$showHistoricListAtom.reportWrite(value, super.showHistoricList, () {
      super.showHistoricList = value;
    });
  }

  final _$showHistoricAtom = Atom(name: '_SearchHeroStoreBase.showHistoric');

  @override
  bool get showHistoric {
    _$showHistoricAtom.reportRead();
    return super.showHistoric;
  }

  @override
  set showHistoric(bool value) {
    _$showHistoricAtom.reportWrite(value, super.showHistoric, () {
      super.showHistoric = value;
    });
  }

  final _$showEmptyStateAtom =
      Atom(name: '_SearchHeroStoreBase.showEmptyState');

  @override
  bool get showEmptyState {
    _$showEmptyStateAtom.reportRead();
    return super.showEmptyState;
  }

  @override
  set showEmptyState(bool value) {
    _$showEmptyStateAtom.reportWrite(value, super.showEmptyState, () {
      super.showEmptyState = value;
    });
  }

  final _$searchHeroByNameAsyncAction =
      AsyncAction('_SearchHeroStoreBase.searchHeroByName');

  @override
  Future searchHeroByName(String heroName, BuildContext ctx) {
    return _$searchHeroByNameAsyncAction
        .run(() => super.searchHeroByName(heroName, ctx));
  }

  final _$searchHeroByIdAsyncAction =
      AsyncAction('_SearchHeroStoreBase.searchHeroById');

  @override
  Future searchHeroById(BuildContext ctx) {
    return _$searchHeroByIdAsyncAction.run(() => super.searchHeroById(ctx));
  }

  final _$_SearchHeroStoreBaseActionController =
      ActionController(name: '_SearchHeroStoreBase');

  @override
  dynamic loadHistoricHeros() {
    final _$actionInfo = _$_SearchHeroStoreBaseActionController.startAction(
        name: '_SearchHeroStoreBase.loadHistoricHeros');
    try {
      return super.loadHistoricHeros();
    } finally {
      _$_SearchHeroStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
heros: ${heros},
isLoading: ${isLoading},
showHistoricList: ${showHistoricList},
showHistoric: ${showHistoric},
showEmptyState: ${showEmptyState},
totalItems: ${totalItems}
    ''';
  }
}
