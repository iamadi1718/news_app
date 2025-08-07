import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Newsdetails extends StatelessWidget {
   final String imageUrl;
  final String title;
  final String author;
  final String time;
  final String content;
  const Newsdetails({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.author,
    required this.time,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40,),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(Icons.arrow_back)),
                  SizedBox(width: 10,),
                Text('Back',
                style: TextStyle(
                  fontSize: 20
                ),),
              ],
        
            ),
            SizedBox(height: 20,),
             
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 330,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(imageUrl,
                      fit: BoxFit.cover,),
                      )
                    ),
                ),
                  Text(title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 21,
                    fontWeight: FontWeight.bold
                  ),),
                  SizedBox(height: 5,),
                  
                  Text(time),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.deepOrange,
                        radius: 15,
                      ),
                      SizedBox(width: 10,),
                      Text(author),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Text(content,
                  )
              ],
             ),
      ),
              
          
        
    );
  }
}