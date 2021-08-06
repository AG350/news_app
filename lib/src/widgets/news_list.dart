import 'package:flutter/material.dart';
import 'package:newsapp/src/models/news_response.dart';
import 'package:newsapp/src/theme/theme.dart';

class NewsList extends StatelessWidget {
  final List<Article> articles;

  const NewsList(this.articles);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (BuildContext context, int index) {
        return _News(articles[index], index);
      },
    );
  }
}

class _News extends StatelessWidget {
  final Article news;
  final int index;

  const _News(this.news, this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _TopBarCard(news: news, index: index),
        _TitleCard(news),
        _ImageCard(news),
        _BodyCard(news),
        SizedBox(height: 10),
        Divider(),
        _FooterCard()
      ],
    );
  }
}

class _FooterCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RawMaterialButton(
            onPressed: () {},
            fillColor: myTheme.accentColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 20),
          RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  final Article news;
  const _BodyCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 10, left: 15, right: 15),
      child: Text((news.description ?? '')),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final Article news;

  const _ImageCard(this.news);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: Container(
          child: news.urlToImage == null
              ? Image(
                  image: AssetImage('assets/no-image.png'),
                )
              : FadeInImage(
                  placeholder: AssetImage('assets/giphy.gif'),
                  image: NetworkImage(news.urlToImage!)),
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  final Article news;

  const _TitleCard(this.news);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        news.title,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TopBarCard extends StatelessWidget {
  final Article news;
  final int index;

  const _TopBarCard({
    required this.news,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(top: 7),
      child: Row(
        children: <Widget>[
          Text(
            '${index + 1}.',
            style: TextStyle(
              color: myTheme.accentColor,
              fontSize: 15,
            ),
          ),
          Text('${news.source}.')
        ],
      ),
    );
  }
}
