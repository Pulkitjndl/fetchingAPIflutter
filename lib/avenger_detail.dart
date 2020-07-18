import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'avengers.dart';

class AvengerDetail extends StatelessWidget {
  final Avengers avengers;
  AvengerDetail({this.avengers});
  @override
  bodyWidget(BuildContext context) =>
    Stack(children: <Widget>[
    Positioned(height: MediaQuery.of(context).size.height/1.6,
    width: MediaQuery.of(context).size.width-20,
    left: 10.0,
    top: MediaQuery.of(context).size.height*0.12,
  
      child: Card(
       shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(15.0)),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: <Widget>[
         SizedBox(height: 15.0,),
         Text(avengers.name,
         style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
         SizedBox(height: 10.0),
         Text("Height:${avengers.height}"),
         Text("Weight:${avengers.weight}"),
         Text("Strenghts"),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:
          avengers.strength.map((e) => FilterChip(label:Text(e),
          backgroundColor: Colors.amber,
          onSelected: (b){},)).toList()
         ),
         Text("Weakness"),
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children:
         avengers.weaknesses.map((e) => FilterChip(label: Text(e),
         backgroundColor: Colors.red,
         onSelected: (e){},)).toList()
         )
       ],
       ),
       ),
    ),
    Positioned(height: 160.0,
    width: MediaQuery.of(context).size.width -20.0,
    left: 10.0,
    top: 10.0,
    child: Align(
      alignment: Alignment.topCenter,
      child: Hero(
        tag: avengers.img,
        child: Container(
          alignment: Alignment.topCenter,
          height: 200.0,
        width: 200.0,
        decoration:BoxDecoration(
          image: DecorationImage(image: NetworkImage(avengers.img))
        ),
        ),
      ),
      ),
      )
    ],
    );
    @override
    Widget build(BuildContext context){
      return Scaffold(
        backgroundColor: Colors.teal,
        appBar: AppBar(
          centerTitle: true,
          title: Text(avengers.name),
        ),
         body: bodyWidget(context),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
            child: Text(
              "</> by Pulkit",
              textAlign: TextAlign.center,
              
     ),
      onTap: () =>{launch("https://github.com/Pulkitjndl?tab=repositories")},
     )
     )
     );
    }
}