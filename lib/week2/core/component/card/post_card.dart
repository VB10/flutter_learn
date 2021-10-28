import 'package:flutter/material.dart';

import '../../../post_json_place_holder/model/post_model.dart';

class PostCard extends StatefulWidget {
  final PostModel? model;

  const PostCard({Key? key, required this.model}) : super(key: key);

  @override
  _PostCardState createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool isTouch = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: isTouch ? Colors.red : Colors.white,
      child: buildListTile(),
    );
  }

  ListTile buildListTile() {
    return ListTile(
      onTap: () {
        setState(() {
          isTouch = !isTouch;
        });
      },
      leading: CircleAvatar(
        child: buildText(),
      ),
      title: Text(widget.model?.title ?? ""),
    );
  }

  Widget buildText() {
    if (widget.model?.id != null) {
      return Text(widget.model?.id.toString() ?? "");
    }

    return FlutterLogo();
  }
}
