import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_search_20220258/model/moviemodel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SearchPage(),
    );
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

 

  @override
  State<SearchPage> createState() => _SearchPageState();
}


class _SearchPageState extends State<SearchPage> {

  static List<MovieModel> main_movies_list = [
    MovieModel('One piece', 1999, 10, 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2024/01/one-piece-arco-egghead-3260423.jpg'),
    MovieModel('Two piece', 1998, 9.7, 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2024/01/one-piece-arco-egghead-3260423.jpg'),
    MovieModel('Three piece', 2000, 9.0, 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2024/01/one-piece-arco-egghead-3260423.jpg'),
    MovieModel('Four piece', 1997, 9.6, 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2024/01/one-piece-arco-egghead-3260423.jpg'),
    MovieModel('Five piece', 2001, 9.3, 'https://cdn.hobbyconsolas.com/sites/navi.axelspringer.es/public/media/image/2024/01/one-piece-arco-egghead-3260423.jpg'),
  ];

  List<MovieModel> display_list = List.from(main_movies_list);
  
  void updateList(String value){
    setState(() {
      display_list = main_movies_list
      .where((element) => 
        element.movie_title!.toLowerCase().contains(value.toLowerCase()))
      .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text('Search'),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Search for Movie', 
              style: TextStyle(
                color: Colors.white, 
                fontSize: 22.0, 
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20.0,),

            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff302360),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                  borderSide: BorderSide.none
                ),
                hintText: "eg: The Dark Knight",
                prefixIcon: Icon(Icons.search),
                prefixIconColor: Colors.purple,
              ),
            ),

            const SizedBox(height: 20.0,),

            Expanded(
              child: display_list.length == 0 
              ?Center(
                child: Text(
                  'Now results found', 
                  style: TextStyle(
                    color: Colors.black, 
                    fontSize: 22.0, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ): ListView.builder(
                itemCount: display_list.length,
                itemBuilder: (context, index) => ListTile(
                  contentPadding: EdgeInsets.all(8.0),

                  title: Text(
                    display_list[index].movie_title!, 
                    style: const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), 
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  subtitle: Text(
                    '${display_list[index].movie_release_year!}', 
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),

                  trailing: Text(
                    '${display_list[index].rating}', 
                    style: TextStyle(color: Colors.amber),
                  ),

                  leading: Image.network(display_list[index].movie_poster_url!),


                ),
              ),
            ),
          ],
        ),
        
      ),
      
    );
  }
}
