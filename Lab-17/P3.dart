import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class PaginationPage extends StatefulWidget {
  @override
  _PaginationPageState createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  List<Post> posts = [];
  bool isLoading = false;
  int currentPage = 1;
  int totalPages = 0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_page=$currentPage'));

    if (response.statusCode == 200) {
      final List<dynamic> data = jsonDecode(response.body);
      final List<Post> fetchedPosts = data.map((post) => Post.fromJson(post)).toList();

      setState(() {
        posts.addAll(fetchedPosts);
        isLoading = false;
        currentPage++;
      });
    } else {
      throw Exception('Failed to load posts');
    }
  }

  bool _onScrollNotification(ScrollNotification notification) {
    if (notification is ScrollEndNotification) {
      if (notification.metrics.pixels >= notification.metrics.maxScrollExtent) {
        if (!isLoading && currentPage <= totalPages) {
          fetchData();
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pagination Example'),
      ),
      body: NotificationListener<ScrollNotification>(
        onNotification: _onScrollNotification,
        child: ListView.builder(
          itemCount: posts.length + (isLoading ? 1 : 0),
          itemBuilder: (context, index) {
            if (index < posts.length) {
              final post = posts[index];
              return ListTile(
                title: Text(post.title),
                subtitle: Text(post.body),
              );
            } else {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
