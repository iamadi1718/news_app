// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class Newstile extends StatelessWidget {
  final String imageurl;
  final String title;
  final String time;
  final String author;

  const Newstile({
    super.key,
    required this.imageurl,
    required this.title,
    required this.time,
    required this.author,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
       color: Color(0xFFF9F9F9),
      ),
      child: Row(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align content to left
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.yellow,
                      radius: 10,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        author.isNotEmpty ? author : "Unknown",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  time,
                  style: TextStyle(fontSize: 12, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
