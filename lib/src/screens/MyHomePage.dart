import 'package:flutter/material.dart';
import 'package:primerappflutter/src/api/Api.dart';
import 'package:primerappflutter/src/model/Photos.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Api api = Api();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<Photos>>(
        future: api.getPhotos(),
        builder: (BuildContext context, AsyncSnapshot<List<Photos>> snapshot){
          if (snapshot.hasData && snapshot.connectionState == ConnectionState.done){
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index){
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(snapshot.data[index].thumbnailUrl),
                    ),
                    title: Text(snapshot.data[index].id.toString()),
                    subtitle: Text('Descripción del album ${snapshot.data[index].id}'),
                  ),
                );
              });
          }else {
            return Center(child: CircularProgressIndicator());
          }
        },
          ),
      
      
      /* Center(
        child: CustomGradientButton(
          text: Text('El Salvador'),
          width: 150,
          height: 40,
          gradientsColor: [Colors.blueAccent, Colors.white, Colors.blueAccent],
          initialPosition: Alignment.centerLeft,
          finalPosition: Alignment.centerRight,
          function: () => print('Hola Desde El Salvador'),
          leadingIcon: Icon(Icons.person),
          finalIcon: Icon(Icons.chat),
        ),
      ), */
    
    );
  }

  /* Widget customContainer(){
  return Container(
        width: double.infinity,
        height: double.infinity,
        //color: Colors.red,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Text('Luis Garcia'.toUpperCase()),
        decoration: BoxDecoration(
          color: Colors.purple,
          border: Border.all(
            color: Colors.teal,
            width: 5,
          )
        ),
        transform: Matrix4.rotationZ(0.05),
        constraints: BoxConstraints(
          maxWidth: 100,
        ),
      );
  } */
}

class CustomGradientButton extends StatelessWidget {
  final Text text;
  final double width;
  final double height;
  final List<Color> gradientsColor;
  final Alignment initialPosition;
  final Alignment finalPosition;
  final Function function;
  final Icon leadingIcon;
  final Icon finalIcon;

  const CustomGradientButton(
      {Key key,
      @required this.text,
      @required this.width,
      @required this.height,
      @required this.gradientsColor,
      @required this.initialPosition,
      @required this.finalPosition,
      @required this.function,
      this.leadingIcon,
      this.finalIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topRight: Radius.circular(height/2)),
            gradient: LinearGradient(
                colors: gradientsColor,
                begin: initialPosition,
                end: finalPosition),
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                offset: Offset(2, -2),
                blurRadius: height * 0.1,
                spreadRadius: 1,
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          leadingIcon ?? Container(),
          text,
          finalIcon ?? Offstage(),
        ]),
      ),
    );
  }
}
