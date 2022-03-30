import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/utils/colors.dart';
import 'package:instagram/widgets/post_card.dart';
import 'package:http/http.dart' as http;

class Explore extends StatefulWidget {
  const Explore({Key? key}) : super(key: key);

  @override
  State<Explore> createState() => _ExploreState();
}

class _ExploreState extends State<Explore> {

    bool isLoading = true;
    String api = "https://li3bzg1xs9.execute-api.ap-south-1.amazonaws.com/default/getInstaPosts";
    Map<String,dynamic> InstaData = {};

  fetchCommentLen() async{
    http.Response res = await http.get(Uri.parse(api));
    Map<String,dynamic> data = jsonDecode(res.body);
    setState(() {
      InstaData = data;
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchCommentLen();
  }




  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        items: const [
           BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
           BottomNavigationBarItem(icon: Icon(Icons.search),label: 'Search'),
           BottomNavigationBarItem(icon: Icon(Icons.video_camera_back),label: 'Reel'),
           BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Favourites'),
           BottomNavigationBarItem(icon: Icon(Icons.person_pin),label: 'Profile')
        ]
      ),
      appBar: AppBar(
              backgroundColor: backgroundColor,
              centerTitle: false,
              title: SvgPicture.asset(
                'assets/ic_instagram.svg',
                color: primaryColor,
                height: 32,
              ),
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.messenger_outline,
                    color: primaryColor,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
      body : isLoading ? 
        const Center(child: CircularProgressIndicator(),)
      : ListView.builder(
            itemCount: InstaData["posts"].length,
            itemBuilder: (ctx, index) => Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 0.0
              ),
              child:  PostCard(data: InstaData["posts"][index],
              ),
            ),
          )
    );
  }
}