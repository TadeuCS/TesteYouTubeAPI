import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:teste_slidy/shared/OUtils.dart';

import 'home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Inicio"}) : super(key: key);
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? ''),
        actions: [
          IconButton(
            icon: Icon(Icons.exposure_plus_1),
            onPressed: store.showNextPage,
          ),
          IconButton(
            icon: Icon(Icons.exposure_minus_1),
            onPressed: store.showPrevPage,
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: store.changeSearchText,
            ),
            MaterialButton(
              color: Theme.of(context).primaryColor,
              textColor: Theme.of(context).indicatorColor,
              child: Text('Search Videos'),
              onPressed: store.searchVideoByText,
            ),
            Expanded(
              child: Observer(builder: (_) {
                return store.status == SearchStatus.NONE
                    ? Center(
                        child: Text('Lista Vazia'),
                      )
                    : store.status == SearchStatus.ERROR
                        ? Center(
                            child: Text('Erro'),
                          )
                        : store.status == SearchStatus.LOADING
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : ListView.builder(
                                padding: const EdgeInsets.all(10),
                                itemCount: store.videos.length,
                                itemBuilder: (_, index) {
                                  return InkWell(
                                    onTap: () => store.openVideo(
                                        store?.videos[index].id?.videoId),
                                    child: Container(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      height: 100,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: NetworkImage(store
                                                        .videos[index]
                                                        .snippet
                                                        .thumbnails
                                                        .high
                                                        .url),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.stretch,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    store.videos[index].snippet
                                                        .title,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 2,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15),
                                                  ),
                                                  Text(
                                                    '${OUtils.formataDataHora(OUtils.getDataTimeWithTimeZone(store.videos[index].snippet.publishedAt))}',
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: Colors.black87),
                                                  )
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
