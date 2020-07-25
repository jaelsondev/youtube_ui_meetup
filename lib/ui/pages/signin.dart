import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_ui_meetup/ui/pages/home.dart';
import 'package:youtube_ui_meetup/ui/themes/theme_color.dart';

class SiginPage extends StatefulWidget {
  @override
  _SiginPageState createState() => _SiginPageState();
}

class _SiginPageState extends State<SiginPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      color: ThemeColor.grayLight,
      constraints: BoxConstraints(minHeight: size.height, minWidth: size.width),
      child: Stack(
        children: <Widget>[
          Image.asset('assets/shadow.png'),
          Image.asset('assets/spider.png'),
          Positioned(
            bottom: 0,
            left: 32,
            right: 32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Continue Login with',
                    style: GoogleFonts.roboto(
                        color: ThemeColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
                SizedBox(height: 15),
                Container(
                  height: 65,
                  decoration: BoxDecoration(
                      color: ThemeColor.white,
                      boxShadow: [ThemeColor.shadow],
                      borderRadius: BorderRadius.circular(15)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Jaelson Santos',
                            style: GoogleFonts.roboto(
                                color: ThemeColor.black,
                                fontSize: 13,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text('jaelson@paguru.com.br',
                              style: GoogleFonts.roboto(
                                color: ThemeColor.grayDark,
                                fontSize: 12,
                              ))
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
                            disabledBorderColor: Colors.transparent,
                            highlightedBorderColor: Colors.transparent,
                            borderSide: BorderSide.none,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15))),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => HomePage()));
                            },
                            child: Icon(
                              Icons.arrow_forward,
                              color: ThemeColor.white,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 35),
                FlatButton(
                    onPressed: null,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.person_add,
                          color: ThemeColor.frame,
                          size: 16,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Add Account',
                          style: GoogleFonts.roboto(
                              color: ThemeColor.frame,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        )
                      ],
                    )),
                SizedBox(height: 30),
              ],
            ),
          )
        ],
      ),
    );
  }
}
