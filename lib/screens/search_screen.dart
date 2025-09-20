import 'package:flutter/material.dart';
import 'package:instagram_clone_ui/screens/post_details.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> explorePosts = [
      {
        "username": "clicks_by_khalid",
        "profileImg": "assets/images/story1.jpg",
        "postImg": "assets/images/post1.jpg",
        "likes": "109",
        "caption": "Beauty of Faisal Masjid",
        "time": "1h ago",
      },
      {
        "username": "ronaldo",
        "profileImg": "assets/images/story3.png",
        "postImg": "assets/images/post2.png",
        "likes": "5.3M",
        "caption": "Training hard",
        "time": "2h ago",
      },
      {
        "username": "dami",
        "profileImg": "assets/images/story4.png",
        "postImg": "assets/images/post3.png",
        "likes": "3.4M",
        "caption": "Queen of Beauty❤❤",
        "time": "3h ago",
      },
      {
        "username": "virat",
        "profileImg": "assets/images/story5.png",
        "postImg": "assets/images/post4.png",
        "likes": "2.6M",
        "caption": "Babar whooooo???",
        "time": "3h ago",
      },
      {
        "username": "bts",
        "profileImg": "assets/images/story6.png",
        "postImg": "assets/images/post5.png",
        "likes": "60k",
        "caption": "Just boys, nothing more🤣🤣",
        "time": "3h ago",
      },
      {
        "username": "elon_musk",
        "profileImg": "assets/images/story7.png",
        "postImg": "assets/images/post6.png",
        "likes": "360k",
        "caption": "Happy to be Billionaire",
        "time": "3h ago",
      },
      {
        "username": "RDJ",
        "profileImg": "assets/images/post7.png",
        "postImg": "assets/images/post7.png",
        "likes": "1.1M",
        "caption": "Are you a fan of ironman??",
        "time": "3h ago",
      },
      {
        "username": "dami",
        "profileImg": "assets/images/story4.png",
        "postImg": "assets/images/kim.png",
        "likes": "3.6M",
        "caption": "Iteawon class",
        "time": "4h ago",
      },
      {
        "username": "kit_harington",
        "profileImg": "assets/images/kit.png",
        "postImg": "assets/images/kit.png",
        "likes": "640k",
        "caption": "King in the North , jon snow",
        "time": "2d ago",
      },
      {
        "username": "roman_reign",
        "profileImg": "assets/images/roman.png",
        "postImg": "assets/images/roman.png",
        "likes": "908k",
        "caption": "Head of the table, Big Dog",
        "time": "1h ago",
      },
      {
        "username": "Squid_Game",
        "profileImg": "assets/images/squid.png",
        "postImg": "assets/images/sale.png",
        "likes": "340",
        "caption": "Auraaaa😎😎",
        "time": "3h ago",
      },
      {
        "username": "Squid_Game",
        "profileImg": "assets/images/squid.png",
        "postImg": "assets/images/squid.png",
        "likes": "1.1M",
        "caption": "everyone's favourite",
        "time": "6h ago",
      },
      {
        "username": "GOT",
        "profileImg": "assets/images/kit.png",
        "postImg": "assets/images/wed.png",
        "likes": "2.3M",
        "caption": "kit recently got married",
        "time": "1d ago",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: const TextField(
            decoration: InputDecoration(
              hintText: "Search",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.black54),
            ),
          ),
        ),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(2),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        itemCount: explorePosts.length,
        itemBuilder: (context, index) {
          final post = explorePosts[index];

          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PostDetailScreen(
                    post: post,
                    allPosts: explorePosts,
                  ),
                ),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                image: DecorationImage(
                  image: AssetImage(post["postImg"]!),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
