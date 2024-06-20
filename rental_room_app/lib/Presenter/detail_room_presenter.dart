import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:rental_room_app/Contract/detail_room_contract.dart';
import 'package:rental_room_app/Models/Comment/comment_model.dart';
import 'package:rental_room_app/Models/Comment/comment_repo.dart';

class DetailRoomPresenter {
  // ignore: unused_field
  final DetailRoomContract? _view;
  DetailRoomPresenter(this._view);

  final CommentRepository _commentRepository = CommentRepositoryIml();

  String? validateComment(String? content) {
    content = content?.trim();
    if (content != null) {
      if (content.isNotEmpty) {
        return null;
      }
      return "Please write something!";
    }
    return "Please write somthing!";
  }

  void postCommentButtonPressed(String roomId, String content, double rating) {
    content = content.trim();
    final now = DateTime.now();
    final formatter = DateFormat('dd/MM/yyyy');
    final formattedDate = formatter.format(now);
    Comment comment = Comment(
        content: content,
        rating: rating,
        roomId: roomId,
        userId: FirebaseAuth.instance.currentUser!.uid,
        time: formattedDate);
    _commentRepository.uploadComment(comment);
    _view?.onCommentPosted();
  }
}
