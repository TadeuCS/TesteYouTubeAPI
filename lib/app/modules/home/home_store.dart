import 'dart:io';

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:teste_slidy/app/modules/home/home_repository.dart';
import 'package:url_launcher/url_launcher.dart';

import 'model/video_result.dart';

part 'home_store.g.dart';

enum SearchStatus { LOADING, ERROR, NONE, DONE }

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final HomeRepository _repository;

  _HomeStoreBase(this._repository) {
    status = SearchStatus.NONE;
    _pageToken.addListener(() {
      searchVideoByText();
    });
  }

  @observable
  var videos = ObservableList<VideoResult>();

  @observable
  String _searchText = '';

  @observable
  int _maxResult = 5;

  var _pageToken = ValueNotifier<String>('');

  String _nextPageToken;
  String _prevPageToken;

  @observable
  SearchStatus status;

  void showNextPage() => _pageToken.value = _nextPageToken;
  void showPrevPage() => _pageToken.value = _prevPageToken;

  @action
  void changeSearchText(String newSearchText) => _searchText = newSearchText;

  @action
  void searchVideoByText() {
    status = SearchStatus.LOADING;
    videos.clear();
    _repository
        .searchByText(
      _searchText,
      maxResult: _maxResult,
      pageToken: _pageToken.value,
    )
        .then((result) {
      switch (result.statusCode) {
        case 200:
          _nextPageToken = result?.data['nextPageToken'];
          _prevPageToken = result?.data['prevPageToken'];
          for (var item in result.data['items']) {
            videos.add(VideoResult.fromJson(item));
          }
          status = SearchStatus.DONE;
          break;
        default:
          throw Exception('${result.statusCode} Erro não tratado!');
      }
    }).catchError((error) {
      status = SearchStatus.ERROR;
      print(error);
    });
  }

  void openVideo(String idVideo) async {
    String url = 'https://www.youtube.com/watch?v=$idVideo';
    if (Platform.isIOS) {
      if (await canLaunch('youtube://$url')) {
        await launch('youtube://$url', forceSafariVC: false);
      } else {
        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }
      }
    } else {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }
}
