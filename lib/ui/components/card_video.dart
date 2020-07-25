
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:youtube_ui_meetup/models/video.dart';
import 'package:youtube_ui_meetup/ui/pages/video.dart';
import 'package:youtube_ui_meetup/ui/themes/theme_color.dart';

class CardVideo extends StatelessWidget {
  final Video video;
  CardVideo({this.video});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 350,
      margin: EdgeInsets.only(bottom: 22),
      decoration: BoxDecoration(
          color: ThemeColor.white,
          boxShadow: [ThemeColor.shadow],
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(boxShadow: [ThemeColor.shadowImage]),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                video.thumb,
                height: 190,
                width: size.width,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              video.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500, fontSize: 14, height: 1.5),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 17),
            child: Text(
              DateFormat(
                'dd-MM-yyyy hh:mm'
              ).format(video.publishedAt),
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                  color: ThemeColor.text),
            ),
          ),
          SizedBox(
            height: 9,
          ),
          Expanded(child: SizedBox()),
          Container(
            height: 62,
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(
                        width: 1,
                        style: BorderStyle.solid,
                        color: ThemeColor.grayLight))),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 18, right: 15),
                  child: Image.asset(
                    'assets/user.png',
                    width: 34,
                    height: 34,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Ho Nguyen Vu',
                      style: GoogleFonts.roboto(
                          color: ThemeColor.black,
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      'vubin1211@gmail.com',
                      style: GoogleFonts.roboto(
                          color: ThemeColor.grayDark,
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Expanded(child: SizedBox()),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                          color: ThemeColor.red,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))),
                      child: OutlineButton(
                        padding: EdgeInsets.all(0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        disabledBorderColor: Colors.transparent,
                        highlightedBorderColor: Colors.transparent,
                        borderSide: BorderSide(color: Colors.transparent),
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => VideoPage(
                                    video: video,
                                  )));
                        },
                        child: Icon(
                          Icons.play_circle_outline,
                          color: ThemeColor.white,
                        ),
                      )),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
