import 'package:algolia/algolia.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/community/post_item_info.dart';
import 'package:flutter_learn/app/home/community/post_user_info.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/algolia_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final _searchTermProvider = StateProvider<String>((ref) => '');

class SearchPage extends StatefulHookWidget {
  const SearchPage();
  static Future<void> show(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushNamed(AppRoutes.searchPage);
  }

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late TextEditingController _textEditingController;
  final Algolia _algoliaApp = AlgoliaService.algolia;

  @override
  void initState() {
    super.initState();
    _textEditingController = TextEditingController();
    final searchTerm = context.read(_searchTermProvider);
    _textEditingController.text = searchTerm.state;
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  Future<List<AlgoliaObjectSnapshot>> _operation(String input) async {
    final AlgoliaQuery query = _algoliaApp.instance.index('posts').query(input);
    final AlgoliaQuerySnapshot querySnap = await query.getObjects();
    final List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final searchTerm = useProvider(_searchTermProvider);

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
          controller: _textEditingController,
          onChanged: (val) => setState(() => searchTerm.state = val),
          style: TextStyle(color: Colors.black, fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: StreamBuilder<List<AlgoliaObjectSnapshot>>(
          stream: Stream.fromFuture(_operation(searchTerm.state)),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const SizedBox();
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  final List<AlgoliaObjectSnapshot>? currSearchStuff =
                      snapshot.data;
                  return CustomScrollView(
                    shrinkWrap: true,
                    slivers: [
                      SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) {
                            final post = Post(
                              title:
                                  currSearchStuff?[i].data['title'] as String,
                              displayName: currSearchStuff?[i]
                                  .data['displayName'] as String,
                              content:
                                  currSearchStuff?[i].data['content'] as String,
                              userId:
                                  currSearchStuff?[i].data['userId'] as String,
                              id: currSearchStuff?[i].data['id'] as String,
                              timestamp: DateTime.parse(
                                currSearchStuff?[i].data['timestamp'] as String,
                              ),
                            );
                            if (searchTerm.state.isNotEmpty) {
                              return Padding(
                                padding: const EdgeInsets.all(defaultPadding),
                                child: GestureDetector(
                                  onTap: () => PostDetailPage.show(context,
                                      postId: post.id),
                                  child: Column(
                                    children: [
                                      PostUserInfo(post: post),
                                      PostItemInfo(post: post),
                                    ],
                                  ),
                                ),
                              );
                            } else {
                              return const SizedBox();
                            }
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
