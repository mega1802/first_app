import 'package:adding_button/models/comment_details_model.dart';
import 'package:adding_button/services/api_service.dart';
import 'package:get/get.dart';

class UsersListController extends GetxController {
  var comments = List<CommentDetailsModel>.empty(growable: true).obs;

  var name = "Users List Page".obs;

  final apiService = ApiService();

  fetchAllComments() {
    apiService.getAllComments().then((response) {
      if (response != null && response.isNotEmpty) {
        comments.value = response;
      }
    });
  }
}
