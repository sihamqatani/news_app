import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newsrapp/modules/web_view/web_view.dart';
Widget myDivider(){
  return  Container(
    width: double.infinity,
    height: 1,
  );
}

Widget buildArticleItem(articles, context) {
  return InkWell(onTap: () {
    navigateTo(context, WebViewScreen(articles["url"]));
  },
    child: Padding(
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
                        maxLines: 3,
                        style: Theme
                            .of(context)
                            .textTheme
                            .bodyText1,
                      )),
                  Text(
                    '${articles['publishedAt']}',
                    style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget articleBuilder(list, {isSearch: false}) {
  return ConditionalBuilder(
  condition:list.length>0,
  builder: (context) => ListView.separated(
    physics: BouncingScrollPhysics(),
    itemBuilder: (context, int index) =>
        buildArticleItem(list[index], context),
    itemCount: 10,
    separatorBuilder: (BuildContext context, int index) {
      return myDivider();
    },
  ),
    fallback: (context) =>
    isSearch ? Container() : Center(child: CircularProgressIndicator()),
);}

Widget defaulttextForm({@required TextEditingController controller,
  @required TextInputType type,
  Function onSubmitt,
  Function onChange,
  @required Function validator,
  @required String label,
  IconData prefix,
  Function onTap,
  bool isClickable = true}) =>
    TextFormField(
      enabled: isClickable,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        labelText: label,
      ),
      controller: controller,
      onTap: onTap,
      keyboardType: type,
      onChanged: onChange,
      onFieldSubmitted: onSubmitt,
      validator: validator,
    );

/*Widget buildTaskItem(Map model, context) {
  return Dismissible(key:Key(model['id'].toString()) ,
    onDismissed:( direction){
      AppCubit.get(context).deleteFromDataBase(id: model['id']);
    }  ,
    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 40,
            child: Text('${model['time']}'),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('${model['title']}'),
                Text('${model['date']}'),
              ],
            ),
          ),
          SizedBox(
            width: 20,
          ),
          IconButton(
              icon: Icon(
                Icons.check_circle,
                color: Colors.green,
              ),
              onPressed: () {
                AppCubit.get(context)
                    .updateDataBase(status: 'done', id: model['id']);
              }),
          SizedBox(
            width: 20,
          ),
          IconButton(
              icon: Icon(
                Icons.archive,
                color: Colors.black12,
              ),
              onPressed: () {
                AppCubit.get(context)
                    .updateDataBase(status: 'archive', id: model['id']);
              }),
        ],
      ),
    ),
  );
}*/
/*Widget buildTasks({@required List<Map>tasks}){
  return ConditionalBuilder(
    condition: tasks.length > 0,
    builder: (context) => ListView.separated(
        itemBuilder: (context, index) {
          return buildTaskItem(tasks[index], context);
        },
        separatorBuilder: (context, index) {
          return Container(
            width: double.infinity,
            height: 1,
            color: Colors.grey[300],
          );
        },
        itemCount: tasks.length),
    fallback: (context) => Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.menu,
            color: Colors.grey,
            size: 100,
          ),
          Text(
            'No tasks Yet , Please Add Some Tasks',
            style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ),
  ) ;
}*/
void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) {
    return widget;
  }));
}

