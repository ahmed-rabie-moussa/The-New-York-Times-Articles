import 'package:flutter/material.dart';

class ArticleListItem extends StatelessWidget {
  final title;
  final byline;
  final publishedDate;

  ArticleListItem({this.title, this.byline, this.publishedDate});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.grey.shade500,
            minRadius: 25,
          ),
          SizedBox(
            width: 12,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis),
                SizedBox(
                  height: 16,
                ),
                Text(
                  byline,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey.shade500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.calendar_today,
                        size: 18, color: Colors.grey.shade500),
                    SizedBox(
                      width: 4,
                    ),
                    Text(
                      publishedDate,
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Icons.keyboard_arrow_right,
            size: 25,
            color: Colors.grey.shade600,
          )
        ],
      ),
    );
  }
}
