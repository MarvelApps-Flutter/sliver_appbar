import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sliver_appbar_module/models/casts_model.dart';
import 'package:flutter_sliver_appbar_module/models/screenshots_model.dart';
import 'package:flutter_sliver_appbar_module/utils/star_display.dart';

import 'custom_appbar_delegate.dart';

class MovieDetailScreen extends StatefulWidget {
  final bool? isPinned;
  final bool? isFloat;
  final bool? isSnap;
  final bool? isPersistentHeader;
  const MovieDetailScreen(
      {Key? key,
      this.isPinned,
      this.isFloat,
      this.isSnap,
      this.isPersistentHeader})
      : super(key: key);

  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  Size? size;

  @override
  void initState() {
    super.initState();
    print("widget.isPinned is ${widget.isPinned}");
    print("widget.isSnap is ${widget.isSnap}");
    print("widget.isFloat is ${widget.isFloat}");
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: body(),
        floatingActionButton: buildFloatingButton());
  }

  Widget body() {
    return CustomScrollView(
      slivers: <Widget>[
        widget.isPersistentHeader == false
            ? buildSliverAppBar()
            : SliverPersistentHeader(
                delegate: CustomSliverAppBarDelegate(expandedHeight: 300),
                pinned: true,
              ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              SizedBox(
                height: 30,
              ),
              Text(
                "THE BATMAN",
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Rubik'),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.0),
              Align(
                alignment: Alignment.center,
                child: Text(
                  "Adventure,Family and Fantasy",
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'NeueHaasDisplay',
                    fontSize: 16.0,
                  ),
                ),
              ),
              SizedBox(height: 12.0),
              Align(
                alignment: Alignment.center,
                child: IconTheme(
                  data: IconThemeData(
                    //color: Colors.red,
                    size: 20,
                  ),
                  child: StarDisplay(value: 4),
                ),
              ),
              SizedBox(height: 15.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'NeueHaasDisplay',
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "2019",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Country',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'NeueHaasDisplay',
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          "USA",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          'Length',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'NeueHaasDisplay',
                            fontSize: 16.0,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '118 min',
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'NunitoSans',
                          ),
                        ),
                      ],
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 2),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Story line',
                        style: TextStyle(
                            fontSize: 18,
                            color: Colors.black54,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Rubik'),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: Container(
                  //height: 35,
                  child: Text(
                    "Batman ventures into Gotham City's underworld when a sadistic killer leaves behind a trail of cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator's plans become clear, he must forge new relationships, unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.",
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Colors.black54,
                        //  fontWeight: FontWeight.w600,
                        fontFamily: 'NeueHaasDisplay'),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: Text(
                  'Screenshots',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Rubik'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                child: Container(
                  height: 155,
                  child: ListView.separated(
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                    scrollDirection: Axis.horizontal,
                    itemCount: screenshotImageList.length,
                    itemBuilder: (context, index) {
                      // Backdrop image =
                      // backdropList[index];
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
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 0),
                child: Text(
                  'Casts',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Rubik'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 0, 0),
                child: Container(
                  height: 110,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    separatorBuilder: (context, index) => VerticalDivider(
                      color: Colors.transparent,
                      width: 5,
                    ),
                    itemCount: castImageList.length,
                    itemBuilder: (context, index) {
                      //Cast cast = castList[index];
                      return Container(
                        child: Column(
                          children: <Widget>[
                            Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100),
                              ),
                              elevation: 3,
                              child: ClipRRect(
                                child: CachedNetworkImage(
                                  imageUrl:
                                      'https://image.tmdb.org/t/p/w200${castImageList[index].imageName}',
                                  imageBuilder: (context, imageBuilder) {
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
                                      fontFamily: 'NeueHaasDisplay'),
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
                                      fontFamily: 'NeueHaasDisplay'),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  FloatingActionButton buildFloatingButton() {
    return FloatingActionButton(
        elevation: 0.0,
        child: const Icon(Icons.favorite),
        backgroundColor: const Color(0xFFff735c),
        onPressed: () {});
  }

  SliverAppBar buildSliverAppBar() {
    return SliverAppBar(
      snap: widget.isSnap!,
      floating: widget.isFloat!,
      pinned: widget.isPinned!,
      backgroundColor: const Color(0xFFff735c),
      expandedHeight: 300,
      // shape: const RoundedRectangleBorder(
      //     borderRadius: BorderRadius.all(Radius.circular(40))),
      flexibleSpace: FlexibleSpaceBar(
        background: ClipRRect(
          // borderRadius:
          //     const BorderRadius.vertical(bottom: Radius.circular(40)),
          child: Image.network(
            "https://image.tmdb.org/t/p/original/e66tM5YOawXLxhDAfWkR7sxpb3h.jpg",
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
