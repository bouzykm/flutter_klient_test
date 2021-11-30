import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_klient_lightbox_test/Login/login_page.dart';

class Welcome extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays ([SystemUiOverlay.bottom]);
    return Scaffold(
        body: Stack(
          children: <Widget>[
            Image.asset(
              'images/home2.jpg',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: 600,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(1),
                            Colors.black.withOpacity(0.9),
                            Colors.black.withOpacity(0.8),
                            Colors.black.withOpacity(0.7),
                            Colors.black.withOpacity(0.6),
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.4),
                            Colors.black.withOpacity(0.1),
                            Colors.black.withOpacity(0.05),
                            Colors.black.withOpacity(0.025),
                          ],
                        )
                    )
                )
            ),
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "LightBox",
                    textScaleFactor: 1,
                    style: TextStyle(
                        fontSize: 36,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Catering dietetyczny z bezpłatną dostawą \ndo domu lub biura. 5 posiłków dziennie \nz odpowiednią kalorycznością.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap:(){

                        Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.lightGreen,
                          )
                        ),
                      )
                    )
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ]
            ),
          ],
        )
    );
  }
}