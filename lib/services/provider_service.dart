

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sample_for_totinsot/model/post_model.dart';

class ProviderService{
  getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/posts';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if(response.statusCode == 200){

      //This line decodes the JSON string received in the response body into a Dart object.
      // The jsonDecode function is used to convert the JSON string to a dynamic object,
      // which is then cast to a List
      final json = jsonDecode(response.body) as List;

      //this line maps each element of the decoded JSON list (json) to a Post object.
      // It uses the map function to iterate over each element (e) in the list and
      // converts it to a Post object using the provided mapping function.
      //Finally, toList() converts the resulting iterable of Post objects into a list.
      final post = json.map((e) => Post(
        userId: e['UserId'],
         id: e['id'],
          title: e['title'],
           body: e['body']
           )
           ).toList();
           return post;
    }else{
      return [];
    }
    
  }
}