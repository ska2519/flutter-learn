import 'package:algolia/algolia.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home/community/post_item_info.dart';
import 'package:flutter_learn/app/home/community/post_user_info.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/algolia_service.dart';

class SearchPage extends StatefulWidget {
  const SearchPage();
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.searchPage);
  }

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Algolia _algoliaApp = AlgoliaService.algolia;
  String _searchTerm = '';

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    final AlgoliaQuery query = _algoliaApp.instance.index('posts').query(input);
    final AlgoliaQuerySnapshot querySnap = await query.getObjects();
    print('Hits count: $querySnap');
    final List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: flutterPrimaryColor,
            size: 20,
          ),
        ),
        title: TextField(
          autofocus: true,
          onChanged: (val) => setState(() => _searchTerm = val),
          style: TextStyle(color: Colors.black, fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<AlgoliaObjectSnapshot>>(
          stream: Stream.fromFuture(_operation(_searchTerm)),
          builder: (context, snapshot) {
            final List<AlgoliaObjectSnapshot>? currSearchStuff = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const SizedBox();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final post = Post(
                              title: currSearchStuff?[index].data['title']
                                  as String,
                              displayName: currSearchStuff?[index]
                                  .data['displayName'] as String,
                              content: currSearchStuff?[index].data['content']
                                  as String,
                              userId: currSearchStuff?[index].data['userId']
                                  as String,
                              id: currSearchStuff?[index].data['id'] as String,
                            );
                            return _searchTerm.isNotEmpty
                                ? Padding(
                                    padding:
                                        const EdgeInsets.all(defaultPadding),
                                    child: Column(
                                      children: [
                                        // PostUserInfo(post: post),
                                        PostItemInfo(post: post),
                                      ],
                                    ),
                                  )
                                // ? DisplaySearchResult(
                                //     artDes: currSearchStuff![index]
                                //         .data['title'] as String,
                                //     artistName: currSearchStuff[index]
                                //         .data["content"] as String,
                                //     genre: currSearchStuff[index]
                                //         .data["displayName"] as String,
                                //   )
                                : const SizedBox();
                          },
                          childCount: currSearchStuff?.length ?? 0,
                        ),
                      ),
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }
}

class DisplaySearchResult extends StatelessWidget {
  final String? artDes;
  final String? artistName;
  final String? genre;

  const DisplaySearchResult({this.artistName, this.artDes, this.genre});

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Text(
        artDes ?? '',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        artistName ?? '',
        style: TextStyle(color: Colors.black),
      ),
      Text(
        genre ?? '',
        style: TextStyle(color: Colors.black),
      ),
      Divider(color: Colors.black),
      SizedBox(height: 20)
    ]);
  }
}
