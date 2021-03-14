// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$videosAtom = Atom(name: '_HomeStoreBase.videos');

  @override
  ObservableList<VideoResult> get videos {
    _$videosAtom.reportRead();
    return super.videos;
  }

  @override
  set videos(ObservableList<VideoResult> value) {
    _$videosAtom.reportWrite(value, super.videos, () {
      super.videos = value;
    });
  }

  final _$_searchTextAtom = Atom(name: '_HomeStoreBase._searchText');

  @override
  String get _searchText {
    _$_searchTextAtom.reportRead();
    return super._searchText;
  }

  @override
  set _searchText(String value) {
    _$_searchTextAtom.reportWrite(value, super._searchText, () {
      super._searchText = value;
    });
  }

  final _$_maxResultAtom = Atom(name: '_HomeStoreBase._maxResult');

  @override
  int get _maxResult {
    _$_maxResultAtom.reportRead();
    return super._maxResult;
  }

  @override
  set _maxResult(int value) {
    _$_maxResultAtom.reportWrite(value, super._maxResult, () {
      super._maxResult = value;
    });
  }

  final _$statusAtom = Atom(name: '_HomeStoreBase.status');

  @override
  SearchStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(SearchStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$_HomeStoreBaseActionController =
      ActionController(name: '_HomeStoreBase');

  @override
  void changeSearchText(String newSearchText) {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.changeSearchText');
    try {
      return super.changeSearchText(newSearchText);
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void searchVideoByText() {
    final _$actionInfo = _$_HomeStoreBaseActionController.startAction(
        name: '_HomeStoreBase.searchVideoByText');
    try {
      return super.searchVideoByText();
    } finally {
      _$_HomeStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
videos: ${videos},
status: ${status}
    ''';
  }
}
