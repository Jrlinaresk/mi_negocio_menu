import 'package:flutter/material.dart';
import 'package:minegociomenu/presentation/widgets/listas/generic_list.dart';
import 'package:minegociomenu/presentation/Screens/bloc/presentation/widgets/post_widget.dart';

class MBloc extends StatelessWidget {
  const MBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.white,
        body: Listwidget(
          itemCount: 4,
          widgets: [
            Center(
              child: FacebookPostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                isVerified: true,
                authorName: 'John Doe',
                postTime: '2 hours ago',
                postText: 'This is a sample post on Flutter!',
                postImageUrl:
                    'https://medias.treew.com/sliders/vedcaelectricas-spa.jpg',
                likes: 12,
                comments: 4,
                shares: 2,
              ),
            ),
            Center(
              child: FacebookPostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                isVerified: true,
                authorName: 'John Doe',
                postTime: '2 hours ago',
                postText: 'This is a sample post on Flutter!',
                postImageUrl:
                    'https://medias.treew.com/sliders/vedcaelectricas-spa.jpg',
                likes: 12,
                comments: 4,
                shares: 2,
              ),
            ),
            Center(
              child: FacebookPostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                isVerified: true,
                authorName: 'John Doe',
                postTime: '2 hours ago',
                postText: 'This is a sample post on Flutter!',
                postImageUrl:
                    'https://medias.treew.com/sliders/vedcaelectricas-spa.jpg',
                likes: 12,
                comments: 4,
                shares: 2,
              ),
            ),
            Center(
              child: FacebookPostWidget(
                profileImageUrl: 'https://example.com/profile.jpg',
                isVerified: true,
                authorName: 'John Doe',
                postTime: '2 hours ago',
                postText: 'This is a sample post on Flutter!',
                postImageUrl:
                    'https://medias.treew.com/sliders/vedcaelectricas-spa.jpg',
                likes: 12,
                comments: 4,
                shares: 2,
              ),
            ),
          ],
          orientation: Axis.vertical,
        ));
  }
}
