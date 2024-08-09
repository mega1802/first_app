import 'package:adding_button/controllers/users_list_controller.dart';
import 'package:adding_button/pages/add_new_comment_page.dart';
import 'package:adding_button/pages/comment_details_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentsListPage extends GetView<UsersListController> {
  CommentsListPage({super.key}) {
    Get.put(UsersListController());
    controller.fetchAllComments();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.name.value),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.comments.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(controller.comments[index].title ?? "-"),
              onTap: () {
                Get.to(() =>
                    CommentDetailPage(
                      commentDetailsModel: controller.comments[index],
                    ));
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate to Page 3 and wait for the result.
          final result = await Get.to(() => AddNewCommentPage());

          // If a new item is returned, add it to the list.
          if (result != null && result['newUser'] != null) {
            controller.comments.add(result['newUser']);
          }
        },
        child: Icon(Icons.add),
        tooltip: 'Add New Comment',
        //text that displays over button action
      ),
    );
  }
}
