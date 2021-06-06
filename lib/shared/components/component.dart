import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
Widget myDivider(){
  return  Container(
    width: double.infinity,
    height: 1,
  );
}
Widget buildArticleItem(articles){
  return  Padding(
    padding: const EdgeInsets.all(20.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('${articles['urlToImage']}'
                 // "https://s.yimg.com/ny/api/res/1.2/RD7cqpCmiqIlr1md9AVk4Q--/YXBwaWQ9aGlnaGxhbmRlcjt3PTIwMDA7aD0xMzMz/https://s.yimg.com/os/creatr-uploaded-images/2021-06/0f074890-c53b-11eb-be45-3954dbcbd756",
                )),
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text(
                      '${articles['title']}',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600),
                    )),
                Text(
                  '${articles['publishedAt']}',
                  style: TextStyle(fontSize: 18,color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        )
      ],
    ),
  );
}
Widget articleBuilder(list){return ConditionalBuilder(
  condition:list.length>0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, int index) =>
        buildArticleItem(list[index]),
    itemCount: 10,
    separatorBuilder: (BuildContext context, int index) {
      return myDivider();
    },
  ),
  fallback: (context) => Center(child: CircularProgressIndicator()),
);}
