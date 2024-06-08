// Assuming you have a REST API endpoint like https://api.example.com/posts/{postId}?userId={userId}

// First, define the model class for Post
class Post {
  final int id;
  final int userId;
  final String title;
  final String body;

  Post({required this.id, required this.userId, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}

// Define a new page to display single post
class SinglePostPage extends StatelessWidget {
  final int postId;
  final int userId;

  SinglePostPage({required this.postId, required this.userId});

  Future<Post> fetchPost() async {
    final response = await http.get(Uri.parse('https://api.example.com/posts/$postId?userId=$userId'));

    if (response.statusCode == 200) {
      return Post.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Details'),
      ),
      body: FutureBuilder<Post>(
        future: fetchPost(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    snapshot.data!.title,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'User ID: ${snapshot.data!.userId}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.data!.body,
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
