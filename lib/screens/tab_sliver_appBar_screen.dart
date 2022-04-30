import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliver_appbar_module/models/casts_model.dart';
import 'package:flutter_sliver_appbar_module/models/screenshots_model.dart';
class TabSliverAppBarScreen extends StatefulWidget {
  const TabSliverAppBarScreen({Key? key}) : super(key: key);

  @override
  _TabSliverAppBarScreenState createState() => _TabSliverAppBarScreenState();
}

class _TabSliverAppBarScreenState extends State<TabSliverAppBarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) {
            return [
              const SliverAppBar(
                centerTitle: true,
                title: Text("Sliver Tab Appbar"),
                automaticallyImplyLeading: false,
                backgroundColor: Color(0xFFff735c),
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  tabs: [
                    Tab(icon: Icon(Icons.screenshot), text: 'Screenshots', ),
                    Tab(icon: Icon(Icons.portrait), text: 'Casts'),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              buildScreenshotsTab(),
              buildCastsTab()
            ],
          ),
        ),
      ),
    );
  }

  Widget buildScreenshotsTab()
  {
    return  GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: screenshotImageList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Card(
            elevation: 3,
            borderOnForeground: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl:
                'https://image.tmdb.org/t/p/w500${screenshotImageList[index]}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      },
    );
  }

  Widget buildCastsTab()
  {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: castImageList.length,
      itemBuilder: (context, index) {
        return Container(
          child: Column(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(100),
                ),
                elevation: 3,
                child: ClipRRect(
                  child: CachedNetworkImage(
                    imageUrl:
                    'https://image.tmdb.org/t/p/w200${castImageList[index].imageName}',
                    imageBuilder:
                        (context, imageBuilder) {
                      return Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                              Radius.circular(100)),
                          image: DecorationImage(
                            image: imageBuilder,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                    errorWidget: (context, url, error) =>
                        Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/images/img_not_found.jpg'),
                            ),
                          ),
                        ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    castImageList[index].name!,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 8,
                        fontFamily: 'NeueHaasDisplay'
                    ),
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: Text(
                    castImageList[index].character!,
                    style: TextStyle(
                        color: Colors.black54,
                        fontSize: 8,
                        fontFamily: 'NeueHaasDisplay'
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
