// lib/screens/list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_book_list/models/book.dart';
import 'package:flutter_book_list/repositories/book_repository.dart';
import 'package:flutter_book_list/screens/detail_screen.dart';

class ListScreen extends StatelessWidget {
  // BookRepository 클래스를 불러와 getBooks() 메서드 호출
  final List<Book> books = BookRepository().getBooks();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('도서 목록 앱'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10.0), // 상단에만 패딩을 주었습니다.
        child: ListView.builder(
          itemCount: books.length,
          itemBuilder: (context, index) {
            return BookTile(book: books[index]);
          },
        ),
      ),
    );
  }
}

class BookTile extends StatelessWidget {
  final Book book;
  BookTile({required this.book});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(book.title),
      leading: Image.network(book.image),
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DetailScreen(
            book: book,
          ),
        ));
      },
    );
  }
}
