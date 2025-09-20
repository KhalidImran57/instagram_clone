import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> posts = [
      "assets/images/story1.jpg",
      "assets/images/kit.png",
      "assets/images/post7.png",
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "khalid_imran03",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: const [
          Icon(Icons.add_box_outlined, color: Colors.black, size: 28),
          SizedBox(width: 16),
          Icon(Icons.menu, color: Colors.black, size: 28),
          SizedBox(width: 12),
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Profile Header
          const Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/profile1.jpg"),
                ),
                Spacer(),
                Column(
                  children: [
                    Text("3",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                    Text("Posts"),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("359",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                    Text("Followers"),
                  ],
                ),
                SizedBox(width: 20),
                Column(
                  children: [
                    Text("330",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19)),
                    Text("Following"),
                  ],
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Khalid Imran",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                SizedBox(height: 4),
                Text(
                  "No reason to stay is good reason to go\n"
                      "CS Student👩‍💻 \n"
                      "uetian🎈 \n"
                      "stay humble and positive❣",
                  style: TextStyle(fontSize: 15),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Edit Profile",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: const Text("Share Profile",
                        style: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(
            height: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: const [
                HighlightCircle(
                    imagePath: "assets/images/story1.jpg", label: "Highlight 1"),
                SizedBox(width: 16),
                HighlightCircle(
                    imagePath: "assets/images/story2.jpg", label: "Highlight 2"),
              ],
            ),
          ),

          const Divider(height: 0),
          const TabBarSection(),

          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(2),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
              ),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  posts[index],
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TabBarSection extends StatelessWidget {
  const TabBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
      length: 3,
      child: TabBar(
        indicatorColor: Colors.black,
        tabs: [
          Tab(icon: Icon(Icons.grid_on, color: Colors.black)),
          Tab(icon: Icon(Icons.video_collection_outlined, color: Colors.black)),
          Tab(icon: Icon(Icons.person_pin_outlined, color: Colors.black)),
        ],
      ),
    );
  }
}

class HighlightCircle extends StatelessWidget {
  final String imagePath;
  final String label;

  const HighlightCircle({super.key, required this.imagePath, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(imagePath),
        ),
        const SizedBox(height: 6),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
