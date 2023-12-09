
class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {

  List<CardItem>items=[
    CardItem(urlImage:
    title:

    ),

  ];

  CardItem(
  title:
  urlImage:

  ),
  CardItem(
  title:
  urlImage:

  ),
  CardItem(
  title:
  urlImage:

  ),
  CardItem(
  title:
  urlImage:

  ),
  CardItem(
  title:
  urlImage:

  ),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        titile:Text(myApp.title),

      ),
      body:Container(

      height:255,
      child:ListView.separated(
          scrollDirection:Axis.horizontal,
          itemCount:6,
          sepratorBulider:(contex,_)=>SizedBox(width:12),
          itemBulider:(context,index)=>buildCard(items[index]),


      ),


    ),

    );
}
}


