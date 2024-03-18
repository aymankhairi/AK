class CommentModel {
  int? commentId;
  String? commentName;
  String? commentUserName;
  String? commentDate;
  int? commentapproved;
  int? userId;
  int? spiritualId;

  CommentModel({
    this.commentId,
    this.commentName,
    this.commentUserName,
    this.commentDate,
    this.commentapproved,
    this.userId,
    this.spiritualId,
  });
  CommentModel.fromJson(Map<String, dynamic> json) {
    commentId = json['comment_id'];
    commentName = json['comment_name'];
    commentUserName = json['comment_username'];
    commentDate = json['comment_date'];
    commentapproved = json['comment_approved'];
    userId = json['user_id'];
    spiritualId = json['spiritual_id'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment_id'] = this.commentId;
    data['comment_name'] = this.commentName;
    data['comment_username'] = this.commentUserName;
    data['comment_date'] = this.commentDate;
    data['comment_approved'] = this.commentapproved;
    data['user_id'] = this.userId;
    data['spiritual_id'] = this.spiritualId;
    return data;
  }
}
