import 'package:flutter/material.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        title: const Text(
          "Activity",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        children: const [
          SectionHeader(title: "Today"),
          ActivityTile(
            profile: "assets/images/story1.jpg",
            username: "clicks_by_khalid",
            action: "liked your post",
            time: "2h",
            post: "assets/images/profile1.jpg",
          ),
          ActivityTile(
            profile: "assets/images/kim.png",
            username: "kim_dami",
            action: "commented: 🔥 amazing",
            time: "4h",
            post: "assets/images/profile1.jpg",
          ),
          SectionHeader(title: "This Week"),
          ActivityTile(
            profile: "assets/images/story3.png",
            username: "cristiano",
            action: "started following you",
            time: "3d",
            isFollow: true,
          ),
          ActivityTile(
            profile: "assets/images/story5.png",
            username: "virat_kohli",
            action: "liked your post",
            time: "5d",
            post: "assets/images/story1.jpg",
          ),
          SectionHeader(title: "Earlier"),
          ActivityTile(
            profile: "assets/images/story6.png",
            username: "bts_official",
            action: "commented: 💜",
            time: "1w",
            post: "assets/images/kim.png",
          ),
          ActivityTile(
            profile: "assets/images/story3.png",
            username: "ronaldo_fan",
            action: "liked your post",
            time: "2w",
            post: "assets/images/story2.jpg",
          ),
        ],
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  const SectionHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ActivityTile extends StatelessWidget {
  final String profile;
  final String username;
  final String action;
  final String time;
  final String? post;
  final bool isFollow;

  const ActivityTile({
    super.key,
    required this.profile,
    required this.username,
    required this.action,
    required this.time,
    this.post,
    this.isFollow = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(vertical: 6),
      leading: CircleAvatar(
        radius: 24,
        backgroundImage: AssetImage(profile),
      ),
      title: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontSize: 16),
          children: [
            TextSpan(
              text: username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: " "),
            TextSpan(text: action),
          ],
        ),
      ),
      subtitle: Text(time, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      trailing: isFollow
          ? OutlinedButton(
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          side: const BorderSide(color: Colors.blue),
        ),
        onPressed: () {},
        child: const Text("Follow back", style: TextStyle(color: Colors.blue)),
      )
          : (post != null
          ? Image.asset(
        post!,
        width: 50,
        height: 50,
        fit: BoxFit.cover,
      )
          : null),
    );
  }
}
