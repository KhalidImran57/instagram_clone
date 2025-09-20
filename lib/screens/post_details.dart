import 'package:flutter/material.dart';

class PostDetailScreen extends StatelessWidget {
  final Map<String, String> post;
  final List<Map<String, String>> allPosts;

  const PostDetailScreen({super.key, required this.post, required this.allPosts});

  @override
  Widget build(BuildContext context) {
    final suggestions = allPosts.where((p) => p["postImg"] != post["postImg"]).take(3).toList();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(post["profileImg"]!),
              radius: 16,
            ),
            const SizedBox(width: 8),
            Text(
              post["username"]!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.more_vert, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          buildPostCard(post),

          const Divider(thickness: 0.5),

          const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              "More posts you might like",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
          ),

          for (var suggestion in suggestions) buildPostCard(suggestion),
        ],
      ),
    );
  }

  Widget buildPostCard(Map<String, String> post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(post["profileImg"]!),
          ),
          title: Text(
            post["username"]!,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),

        Image.asset(
          post["postImg"]!,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 400,
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              Icon(Icons.favorite_border, size: 28),
              SizedBox(width: 12),
              Icon(Icons.chat_bubble_outline, size: 28),
              SizedBox(width: 12),
              Icon(Icons.send, size: 28),
              Spacer(),
              Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            "${post["likes"]} likes",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
        ),
        const SizedBox(height: 6),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: "${post["username"]} ",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: post["caption"]!),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            "View all 120 comments",
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            post["time"]!,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
