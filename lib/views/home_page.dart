import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sample_for_totinsot/provider/providerop.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProviderOperation>(context,listen: false).getAllPosts();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<ProviderOperation>(
        builder: (context, value, child) {
          if(value.isLoading){
            return const Center(child: CircularProgressIndicator());
          }
          final posts = value.posts;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder:(context, index) {
          return Padding(
            padding:  const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.black,width: 1),borderRadius: BorderRadius.circular(8)),
              leading: Text(posts[index].id.toString()),
              tileColor: Colors.grey.withOpacity(0.4),
              title: Text(posts[index].title,),
              subtitle: Text(posts[index].body),
          
            ),
          );
        },);
        },
      ),
      
    );
  }
}