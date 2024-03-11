class PostModel{
  int? id;
  late String title;
  late String content;


  PostModel({this.id, required this.title, required this.content});

  PostModel.fromJson(Map<String, dynamic> json){
    id = json["id"];
    title = json["title"];
    content = json["content"];
  }

  Map<String, dynamic> toJson(){
    return {
      "id":id,
      "title":title,
      "content":content,
    };
  }

}