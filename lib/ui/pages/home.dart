import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_ui_meetup/models/video.dart';
import 'package:youtube_ui_meetup/services/api.dart';
import 'package:youtube_ui_meetup/ui/components/card_video.dart';
import 'package:youtube_ui_meetup/ui/themes/theme_color.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController scrollController;
  final textEditingController = TextEditingController();
  var api = Api();
  Timer t = Timer(Duration.zero, () {});
  var videos = [];
  var input = '';

  bool loading = true;
  bool loadingNextPage = false;

  _searchByField(String value) {
    if (t.isActive) {
      t.cancel();
    }
    t = Timer(Duration(seconds: 1), () {
      setState(() {
        input = value;
      });
      _getVideos(query: value);
    });
  }

  _getVideos({query = ''}) async {
    try {
      setState(() {
        loading = true;
      });
      List<Video> videos = await api.search(query: query);
      setState(() {
        this.videos = videos;
        loading = false;
      });
    } catch (e) {}
  }

  _nextPage() async {
    if (scrollController.position.maxScrollExtent == scrollController.offset &&
        !loadingNextPage) {
      try {
        setState(() {
          loadingNextPage = true;
        });
        List<Video> videos = await api.nextPage();
        setState(() {
          this.videos.addAll(videos);
          loadingNextPage = false;
        });
      } catch (e) {}
    }
  }

  Future<Null> _refreshPage() async {
    _getVideos();
    textEditingController.clear();
    return;
  }

  @override
  void initState() {
    _getVideos();
    scrollController = ScrollController()..addListener(_nextPage);
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    textEditingController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ThemeColor.grayLight,
      body: Stack(
        children: <Widget>[
          Image.asset('assets/shadow.png'),
          RefreshIndicator(
            color: ThemeColor.red,
            onRefresh: () => _refreshPage(),
            child: SingleChildScrollView(
              controller: scrollController,
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 22),
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: kToolbarHeight),
                      decoration: BoxDecoration(
                          color: ThemeColor.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ThemeColor.shadow]),
                      child: TextField(
                        controller: textEditingController,
                        onChanged: (value) => _searchByField(value),
                        style: GoogleFonts.roboto(color: ThemeColor.text),
                        cursorColor: ThemeColor.red,
                        decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 10),
                            suffixIcon: Icon(
                              Icons.search,
                              color: ThemeColor.grayDark,
                              size: 28,
                            ),
                            hintText: 'o que você procura?',
                            hintStyle:
                                GoogleFonts.roboto(color: ThemeColor.text),
                            enabledBorder:
                                OutlineInputBorder(borderSide: BorderSide.none),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    loading
                        ? Container(
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Center(
                              child: Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      ThemeColor.red),
                                ),
                              ),
                            ))
                        : ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: videos.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CardVideo(video: videos.elementAt(index));
                            },
                          ),
                    loadingNextPage
                        ? Container(
                            height: 30,
                            padding: EdgeInsets.symmetric(horizontal: 32),
                            child: Center(
                              child: Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      ThemeColor.red),
                                ),
                              ),
                            ))
                        : Container()
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
