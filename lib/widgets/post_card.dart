
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:instagram/utils/colors.dart';



class PostCard extends StatefulWidget {
  final Map<String,dynamic> data;
  const PostCard({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  int commentLen = 0;
  bool isLikeAnimating = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color:  backgroundColor,
        ),
        color: backgroundColor,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              vertical: 4,
              horizontal: 16,
            ).copyWith(right: 0),
            child: Row(
              children: <Widget>[
                 CircleAvatar(
                  radius: 16,
                  backgroundImage: NetworkImage(
                    widget.data["profileImage"],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                    ),
                    child:  Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         Text(
                          widget.data['postedBy'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          CarouselSlider.builder(
            options: CarouselOptions(
               viewportFraction: 1,
            ),
            itemCount: widget.data['images'].length,
            itemBuilder:(ctx, index, realIdx) {
              return SizedBox(
            height: MediaQuery.of(context).size.height * 0.35,
            width: double.infinity,
            child: Image.network(
              widget.data['images'][index],
              fit: BoxFit.fill,
            ),
          );
            }         
          ),
          Row(
            children: <Widget>[
              IconButton(
                 icon:  const Icon(
                  Icons.favorite,
                ),
                onPressed: () {}
                  ),
              IconButton(
                icon: const Icon(
                  Icons.comment_outlined,
                ),
                onPressed: () {}
              ),
              IconButton(
                  icon: const Icon(
                    Icons.send,
                  ),
                  onPressed: () {}),
              Expanded(
                  child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    icon: const Icon(Icons.bookmark_border), onPressed: () {}),
              ))
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text( widget.data['interactions']['likes'].toString() + " likes",
                      style: Theme.of(context).textTheme.bodyText1,
                    )),
                    const SizedBox(height: 8.0,),
                DefaultTextStyle(
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(fontWeight: FontWeight.w800),
                    child: Text( "View all "+widget.data['interactions']['comments'].toString() + " comments",
                      style: Theme.of(context).textTheme.bodyText2,
                    )),    
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.only(
                    top: 8,
                  ),
                  child: RichText(
                    text:  TextSpan(
                      style:const TextStyle(color: primaryColor),
                      children: [
                        TextSpan(
                          text: widget.data['postedBy'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: " "+widget.data['description'],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
