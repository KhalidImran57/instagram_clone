import 'package:flutter/material.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> stories = [
      {"name": "Your Story", "img": "assets/images/story1.jpg"},
      {"name": "Zaman", "img": "assets/images/story2.jpg"},
      {"name": "ronaldo", "img": "assets/images/story3.png"},
      {"name": "dami", "img": "assets/images/story4.png"},
      {"name": "virat", "img": "assets/images/story5.png"},
      {"name": "bts", "img": "assets/images/story6.png"},
      {"name": "elon", "img": "assets/images/story7.png"},
    ];

    final List<Map<String, String>> posts = [
      {
        "username": "clicks_by_khalid",
        "profileImg": "assets/images/story1.jpg",
        "postImg": "assets/images/post1.jpg",
        "likes": "2,345",
        "caption": "Exploring nature 🌿",
        "time": "2 hours ago"
      },
      {
        "username": "kim_dami",
        "profileImg": "assets/images/story4.png",
        "postImg": "assets/images/post3.png",
        "likes": "8,931",
        "caption": "Queen of Beauty💚",
        "time": "5 hours ago"
      },
      {
        "username": "cristiano",
        "profileImg": "assets/images/story3.png",
        "postImg": "assets/images/post2.png",
        "likes": "1M",
        "caption": "Training hard 💪⚽",
        "time": "1 day ago"
      },
      {
        "username": "virat",
        "profileImg": "assets/images/story5.png",
        "postImg": "assets/images/post4.png",
        "likes": "1M",
        "caption": "Babar , whooooo???😎😎",
        "time": "1 day ago"
      },
      {
        "username": "bts",
        "profileImg": "assets/images/story6.png",
        "postImg": "assets/images/post5.png",
        "likes": "1M",
        "caption": "Boys, nothing more🤣🤣",
        "time": "1 day ago"
      },
      {
        "username": "elon_musk",
        "profileImg": "assets/images/story7.png",
        "postImg": "assets/images/post6.png",
        "likes": "1M",
        "caption": "Happy to be billionaire",
        "time": "1 day ago"
      },
      {
        "username": "rdj_ironman",
        "profileImg": "assets/images/post7.png",
        "postImg": "assets/images/post7.png",
        "likes": "1M",
        "caption": "are you a fan of Iron man??",
        "time": "1 day ago"
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Row(
          children: [
            Image.asset("assets/images/logo.png", height: 35), // Instagram logo
            const SizedBox(width: 5),
            const Text(
              "Instagram",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 22,
                color: Colors.black,
              ),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.favorite_border, color: Colors.black),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(Icons.chat_bubble_outline, color: Colors.black),
          ),
        ],
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: stories.length,
              itemBuilder: (context, index) {
                final story = stories[index];
                final bool isUser = index == 0;

                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: !isUser
                                  ? const LinearGradient(
                                colors: [Colors.red, Colors.orange, Colors.purple],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              )
                                  : null,
                            ),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: AssetImage(story["img"]!),
                            ),
                          ),
                          if (isUser)
                            Positioned(
                              bottom: 0,
                              right: 0,
                              child: Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.blue,
                                ),
                                child: const Icon(Icons.add, size: 18, color: Colors.white),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 65, // 🔹 Fixed width taake naam boundary me rahe
                        child: Text(
                          story["name"]!,
                          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                          textAlign: TextAlign.center, // 🔹 Center align like Instagram
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          for (var post in posts) postCard(post),
        ],
      ),
    );
  }

  Widget postCard(Map<String, String> post) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
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
          height: 350,
          width: double.infinity,
        ),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
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
            "Liked by khalid_imran03 and ${post["likes"]} others",
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 4),

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
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          child: Text(
            "View all comments",
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
        const SizedBox(height: 10),
      ],
    );
  }
}
