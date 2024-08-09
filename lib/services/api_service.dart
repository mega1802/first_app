import 'package:adding_button/models/comment_details_model.dart';
import 'package:adding_button/models/comments_list_model.dart';
import 'package:get/get.dart';

class ApiService extends GetConnect {
  Future<List<CommentDetailsModel>?> getAllComments() async {
    var response = await get("https://jsonplaceholder.typicode.com/todos");
    if (!response.hasError) {
      var body = response.body;
      if (body != null) {
        var data = CommentsListModel().fromList(body);
        return data;
      }
    }
    return null;
  }
}