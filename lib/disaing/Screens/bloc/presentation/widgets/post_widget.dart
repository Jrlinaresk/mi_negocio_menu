import 'package:flutter/material.dart';

class FacebookPostWidget extends StatelessWidget {
  final String profileImageUrl;
  final bool isVerified;
  final String authorName;
  final String postTime;
  final String postText;
  final String postImageUrl;
  final int likes;
  final int comments;
  final int shares;

  const FacebookPostWidget({
    super.key,
    required this.profileImageUrl,
    required this.isVerified,
    required this.authorName,
    required this.postTime,
    required this.postText,
    required this.postImageUrl,
    required this.likes,
    required this.comments,
    required this.shares,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileImageUrl),
                  radius: 25.0,
                ),
                const SizedBox(width: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: Text(
                            authorName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (isVerified)
                          const Icon(Icons.verified_outlined,
                              color: Colors.blue),
                      ],
                    ),
                    Text(
                      postTime,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (postText.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(postText),
            ),
          if (postImageUrl.isNotEmpty) Image.network(postImageUrl),
          Padding(
            padding: const EdgeInsets.only(left: 24.0, right: 24.0, top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Icon(Icons.circle),
                    const SizedBox(width: 4.0),
                    Text(
                      '$likes',
                      style: TextStyle(
                          fontSize: 12.0, color: Colors.grey.shade500),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const SizedBox(width: 4.0),
                    Text(
                      '$comments comentarios -',
                      style: TextStyle(
                          fontSize: 12.0, color: Colors.grey.shade500),
                    ),
                    const SizedBox(width: 4.0),
                    Text(
                      '$shares veces compartido',
                      style: TextStyle(
                          fontSize: 12.0, color: Colors.grey.shade500),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ButtonBar(
            alignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () {
                  // Handle like button press
                },
                icon: const Icon(Icons.thumb_up_alt_outlined),
                label: const Text('Like'),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(
                      0), // Establecer elevación a 0
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  // Puedes ajustar otros estilos según tus necesidades
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle comment button press
                },
                icon: const Icon(Icons.mode_comment_outlined),
                label: const Text('Comment'),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(
                      0), // Establecer elevación a 0
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  // Puedes ajustar otros estilos según tus necesidades
                ),
              ),
              ElevatedButton.icon(
                onPressed: () {
                  // Handle share button press
                },
                icon: const Icon(Icons.switch_access_shortcut_add_rounded),
                label: const Text('Share'),
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(
                      0), // Establecer elevación a 0
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  // Puedes ajustar otros estilos según tus necesidades
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
