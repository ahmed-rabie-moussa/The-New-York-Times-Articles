import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/articles.dart';
import '../screens/article_details_screen.dart';
import '../widgets/article_list_item.dart';

class HomePageScreen extends StatefulWidget {
  @override
  _HomePageScreenState createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  var _isInit = true;
  var _isLoading = false;

  /*
  * To ensure that this method will run only one time at initialization
  * so, _isInit bool used for that.
  * */
  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<Articles>(context)
          .fetchAndSetArticles()
          .catchError((error) {})
          .then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NY Times Most Popular Articles"),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: _isLoading
            ? Center(
                child: const CircularProgressIndicator(),
              )
            : Consumer<Articles>(
                // Value here is the value of the provided data from the Class Articles.
                builder: (_, value, __) => ListView.builder(
                  // Build a list with the number of articles.
                  itemCount: value.articles.length,
                  itemBuilder: (_, index) => Container(
                    /*
                    To detect the tapping on the article list items
                    and navigate to details screen.
                     */
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pushNamed(
                          ArticleDetailsScreen.route,
                          arguments: value.articles[index].id),
                      child: ArticleListItem(
                        title: value.articles[index].title,
                        byline: value.articles[index].byline,
                        publishedDate: value.articles[index].publishedDate,
                      ),
                    ),
                  ),
                ),
              ),
      ),
      drawer: _buildDrawer(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "NY Times Most Popular Articles",
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Container(
            child: Image.asset(
              "assets/images/logo.png",
              // fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
