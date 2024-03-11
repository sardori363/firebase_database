import 'package:firestore_note/model/post_model.dart';
import 'package:firestore_note/services/firestore_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  static final id = 'home_page_id/';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  _fetchData() async {
    await FireStoreService.readAllData();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    TextEditingController contentController = TextEditingController();
    TextEditingController searchController = TextEditingController();

    Future<void> create() async {
      PostModel postModel = PostModel(
          title: "aaaaaaaaaaaa",
          content: "bbbbbbbbbbbbbb");
      await FireStoreService.storeData(data: postModel.toJson(), path: );
      print("object");
    }

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          onChanged: (value) async{
            await FireStoreService.search('$value');
          },
        ),
      ),
      body: isLoading
          ? StreamBuilder(
              stream: FireStoreService.db
                  .collection(FireStoreService.pathA)
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (_, index) {
                    var document = snapshot.data?.docs[index];
                    return Card(
                      child: ListTile(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Update item"),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // title
                                    TextField(
                                      controller: titleController,
                                      decoration: const InputDecoration(
                                        hintText: "Title",
                                      ),
                                    ),

                                    // desc
                                    TextField(
                                      controller: contentController,
                                      decoration: const InputDecoration(
                                        hintText: "Content",
                                      ),
                                    ),
                                  ],
                                ),
                                actions: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    icon: const Text("Close"),
                                  ),
                                  IconButton(
                                    onPressed: () async {
                                      if (titleController.text.isNotEmpty &&
                                          contentController.text.isNotEmpty) {
                                        await FireStoreService.update(
                                            id: document.id,
                                            data: {
                                              'title': titleController.text,
                                              'content': contentController.text
                                            });
                                        await FireStoreService.readAllData()
                                            .then((value) {
                                          Navigator.pop(context);
                                        });
                                        setState(() {});
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                                content: Text(
                                                    "Please fill all the gaps")));
                                      }
                                    },
                                    icon: const Text("Save"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        title: Text(document!.id.toString()),
                        subtitle: Text(document.data()['content']),
                        trailing: Text(document.data()["title"]),
                        leading: IconButton(
                          icon: const Icon(CupertinoIcons.delete),
                          onPressed: () async {
                            FireStoreService.delete(id: document.id);
                          },
                        ),
                      ),
                    );
                  },
                );
              },
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final note = <String, dynamic>{
            "title": "University",
            "content": "PDP University",
            "dateTime": DateTime.now(),
          };
       print(1);
          await create("agh");
          print(1);
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
