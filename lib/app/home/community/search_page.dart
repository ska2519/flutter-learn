import 'package:algolia/algolia.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_learn/app/home/community/post_detail_page.dart';
import 'package:flutter_learn/app/home/community/post_item_info.dart';
import 'package:flutter_learn/app/home/community/post_user_info.dart';
import 'package:flutter_learn/constants/constants.dart';
import 'package:flutter_learn/models/post.dart';
import 'package:flutter_learn/routes/app_router.dart';
import 'package:flutter_learn/services/algolia_service.dart';
import 'package:flutter_learn/translations/locale_keys.g.dart';
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
    final AlgoliaQuery query = _algoliaApp.instance
        .index(kReleaseMode ? 'Flutter Learn Posts' : 'posts')
        .query(input);
    final AlgoliaQuerySnapshot querySnap = await query.getObjects();
    final List<AlgoliaObjectSnapshot> results = querySnap.hits;
    return results;
  }

  @override
  Widget build(BuildContext context) {
    final searchTerm = useProvider(_searchTermProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 1.0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: flutterPrimaryColor,
            size: 20,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => _textEditingController.clear(),
            icon: Icon(
              Icons.cancel_outlined,
              color: flutterPrimaryColor,
              size: 20,
            ),
          ),
        ],
        title: TextField(
          autofocus: true,
          controller: _textEditingController,
          onChanged: (val) => searchTerm.state = val,
          style: TextStyle(color: Colors.black, fontSize: 20),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: _textEditingController.text.isEmpty
          ? Center(child: Text(LocaleKeys.enterSearchTerm.tr()))
          : StreamBuilder<List<AlgoliaObjectSnapshot>>(
              stream: Stream.fromFuture(_operation(searchTerm.state)),
              builder: (context, snapshot) {
                final List<AlgoliaObjectSnapshot>? currSearchStuff =
                    snapshot.data;
                return CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, i) {
                          final post = Post(
                            title: currSearchStuff?[i].data['title'] as String,
                            content:
                                currSearchStuff?[i].data['content'] as String,
                            userId:
                                currSearchStuff?[i].data['userId'] as String,
                            id: currSearchStuff?[i].data['id'] as String,
                            timestamp: DateTime.parse(
                              currSearchStuff?[i].data['timestamp'] as String,
                            ),
                            commentCount:
                                currSearchStuff?[i].data['commentCount'] as int,
                            userDisplayName: currSearchStuff?[i]
                                .data['userDisplayName'] as String,
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
              },
            ),
    );
  }
}

class DisplaySearchResult extends StatelessWidget {
  const DisplaySearchResult({this.artistName, this.artDes, this.genre});
  final String? artDes;
  final String? artistName;
  final String? genre;

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
