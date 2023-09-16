import 'package:flutter/material.dart';
import 'package:flutter_book_list/models/book.dart';

class DetailScreen extends StatefulWidget {
  // 전달받을 값 생성자로 정의
  final Book book;

  DetailScreen({required this.book});
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  bool _isBookmarked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.title),
      ),
      body: ListView(
        children: [
          Image.network(widget.book.image),
          Padding(padding: EdgeInsets.all(10)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          widget.book.title,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Text(
                        widget.book.subtitle,
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )),
              Container(
                width: MediaQuery.of(context).size.width * 0.15,
                padding: EdgeInsets.all(10),
                child: Center(
                  child: IconButton(
                    icon: Icon(
                      _isBookmarked
                          ? Icons.bookmark
                          : Icons
                              .bookmark_border_outlined, // Change the icon based on the _isBookmarked state
                      color: Colors.red,
                    ),
                    onPressed: () {
                      setState(() {
                        _isBookmarked =
                            !_isBookmarked; // Toggle the _isBookmarked state
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.phone)),
                  Text('Contact')
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.near_me)),
                  Text('Route')
                ],
              ),
              Column(
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.save)),
                  Text('Save')
                ],
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(5)),
          Container(
            padding: EdgeInsets.all(15),
            child: Text(widget.book.description),
          )
        ],
      ),
    );
  }
}
