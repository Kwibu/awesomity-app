import 'package:awesomity_app/widgets/header.dart';
import 'package:flutter/material.dart';

// Widget TemplateScreen(BuildContext context, datas) {
//   bool isToggle = false;
//   return
// }
class TemplateScreen extends StatefulWidget {
  final datas;
  TemplateScreen(this.datas);

  @override
  _TemplateScreenState createState() => _TemplateScreenState();
}

class _TemplateScreenState extends State<TemplateScreen> {
  bool isToggle = false;

  @override
  Widget build(BuildContext context) {
    void toggleHandler() {
      setState(() {
        isToggle = !isToggle;
      });
    }

    return Stack(
      children: [
        Container(
          color: const Color.fromRGBO(244, 245, 246, 1),
          height: MediaQuery.of(context).size.height,
        ),
        Container(
          color: const Color.fromRGBO(28, 40, 52, 1),
          height: 230,
        ),
        Header(toggleHandler),
        Positioned(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          top: 100,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            color: Colors.white,
            child: widget.datas,
          ),
        ),
        isToggle == true
            ? Positioned(
                top: 80,
                right: 15,
                child: Material(
                  borderRadius: BorderRadius.circular(5),
                  elevation: 5,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            decoration: const BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.black12),
                              ),
                            ),
                            child: const Text(
                              "FILTER BY PRIORITY",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                          Container(
                            height: 12,
                            color: Colors.black,
                          ),
                          SizedBox(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Text(
                                    "Low Priority",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20.0, horizontal: 10),
                                  child: Text(
                                    "Medium Priority",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 10.0, right: 10, bottom: 30),
                                  child: Text(
                                    "High Priority",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            : Container(
                child: null,
              ),
      ],
    );
  }
}
