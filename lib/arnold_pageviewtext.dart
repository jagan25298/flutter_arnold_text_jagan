import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'arnold_appdatatext.dart';
import 'arnold_displaytext.dart';

class PageViewText extends StatefulWidget {
  const PageViewText({super.key});

  @override
  State<PageViewText> createState() => _PageViewTextState();
}

class _PageViewTextState extends State<PageViewText> {
  var _SelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Arnold Quotes',
          style: TextStyle(fontFamily: 'riot'),
        ),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('share'),
                      value: 1,
                    )
                  ],
              elevation: 5,
              onSelected: (value) {
                if (value == 1) {
                  _shareInfo();
                }
              }),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 380,
            child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _SelectedIndex = index;
                  });
                },
                controller: PageController(viewportFraction: 0.8),
                itemCount: appdatatext.length,
                itemBuilder: (context, index) {
                  var _scale = _SelectedIndex == index ? 1.0 : 0.8;
                  return TweenAnimationBuilder(
                      tween: Tween(begin: _scale, end: _scale),
                      duration: Duration(milliseconds: 360),
                      child: DisplayText(appDataText: appdatatext[index]),
                      builder: (context, value, child) {
                        return Transform.scale(
                          scale: value,
                          child: child,
                        );
                      });
                }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    (_SelectedIndex + 1).toString() +
                        '/' +
                        appdatatext.length.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  _shareInfo() {
    print('----------> share');
    print(appdatatext[_SelectedIndex].text);
    Share.share(appdatatext[_SelectedIndex].text);
  }
}
