
import 'package:adding_button/models/comment_details_model.dart';
import 'package:flutter/material.dart';

class CommentDetailPage extends StatelessWidget {
  final CommentDetailsModel commentDetailsModel;

  CommentDetailPage({required this.commentDetailsModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Detail'),
      ),
      body: Center(
        child: Text(
          'Title ${commentDetailsModel.title ?? "-"}',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
