import 'package:flutter/material.dart';
import 'package:flutter_sliver_appbar_module/models/landing_list_model.dart';
import 'movie_detail_screen.dart';
import 'tab_sliver_appBar_screen.dart';

class ChooseScreen extends StatefulWidget {
  const ChooseScreen({Key? key}) : super(key: key);

  @override
  State<ChooseScreen> createState() => _ChooseScreenState();
}

class _ChooseScreenState extends State<ChooseScreen> {
  bool isPinned = false;
  bool isFloat = false;
  bool isSnap = false;
  bool isPersistentHeader = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white, body: buildBody());
  }

  Widget buildBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 15,
              ),
              buildTopHeader(),
              Container(
                height: MediaQuery.of(context).size.height * .36,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/header.jpg'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              buildLandingList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTopHeader() {
    return const Align(
      alignment: Alignment.center,
      child: Text(
        'Choose Sliver Appbar',
        style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontWeight: FontWeight.w700,
            fontFamily: 'Rubik'
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget buildLandingList() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: chooseList.length,
        itemBuilder: (context, index) {
          return buildLandingItem(index, chooseList);
        });
  }

  Widget buildLandingItem(int index, List<ChooseListModel> landingList) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(4, 5, 4, 5),
        child: InkWell(
          splashColor: landingList[index].colors!,
          child: Card(
              color: landingList[index].colors!,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      landingList[index].text!,
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'Rubik'
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                      size: 20,
                    ),
                  ],
                ),
              )),
          onTap: () {
            if(landingList[index].text == "Pinned Sliver" || landingList[index].text == "Float with Snap Sliver" || landingList[index].text == "Float without Snap Sliver" || landingList[index].text == "Persistent Header Sliver")
            {
              if(landingList[index].text == "Pinned Sliver")
              {
                isPinned = true;
                isFloat = false;
                isSnap = false;
                isPersistentHeader = false;
              }
              else if(landingList[index].text == "Float with Snap Sliver")
              {
                isPinned = false;
                isFloat = true;
                isSnap = true;
                isPersistentHeader = false;
              }
              else if(landingList[index].text == "Float without Snap Sliver")
              {
                isPinned = false;
                isFloat = true;
                isSnap = false;
                isPersistentHeader = false;
              }
              else if(landingList[index].text == "Persistent Header Sliver")
              {
                isPinned = false;
                isFloat = true;
                isSnap = false;
                isPersistentHeader = true;
              }
              Navigator.push(context, MaterialPageRoute(builder: (context)=> MovieDetailScreen(isPinned : isPinned, isFloat: isFloat , isSnap: isSnap , isPersistentHeader : isPersistentHeader)));

            }
            else if(landingList[index].text == "Tab bar Sliver" )
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const TabSliverAppBarScreen()));
              }
            },
        ));
  }
}
