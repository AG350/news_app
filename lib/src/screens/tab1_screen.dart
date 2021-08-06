import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:newsapp/src/models/news_response.dart';
import 'package:newsapp/src/services/news_service.dart';
import 'package:newsapp/src/widgets/news_list.dart';
import 'package:provider/provider.dart';

class Tab1Screen extends StatefulWidget {
  @override
  _Tab1ScreenState createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final List<Article> headlines = Provider.of<NewsService>(context).headlines;
    return Scaffold(
      body: Center(
        child: (headlines.length == 0)
            ? Center(child: CircularProgressIndicator())
            : NewsList(headlines),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
