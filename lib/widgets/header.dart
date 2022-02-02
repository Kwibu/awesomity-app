import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  Function toggleHandler;
  Header(this.toggleHandler);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 5.0),
            width: 25,
            height: 25,
            child: Image.asset(
              'assets/IW_logo.png',
              fit: BoxFit.contain,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  color: Colors.white,
                ),
              ),
              IconButton(
                  onPressed: () {
                    widget.toggleHandler();
                  },
                  icon: const Icon(Icons.menu),
                  color: Colors.white),
            ],
          )
        ],
      ),
    );
  }
}
