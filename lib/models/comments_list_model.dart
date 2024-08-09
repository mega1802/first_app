import 'package:adding_button/models/comment_details_model.dart';

class CommentsListModel {

  CommentsListModel({this.comments});

  late List<CommentDetailsModel>? comments;

  List<CommentDetailsModel> fromList(List<dynamic> jsonLst) {
    var comments = List<CommentDetailsModel>.empty(growable: true);
    for (var json in jsonLst) {
      comments.add(CommentDetailsModel.fromJson(json));
    }
    this.comments = comments;
    return comments;
  }
}