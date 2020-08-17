import 'package:flutter/material.dart';
import 'package:lucasvalente_heroes_flutter/models/all_heroes_list.dart';
import 'package:lucasvalente_heroes_flutter/models/heroes_list.dart' as heroeslist;
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:lucasvalente_heroes_flutter/screens/hero_detail_screen.dart';
import 'package:lucasvalente_heroes_flutter/shared/constants.dart';
import 'package:lucasvalente_heroes_flutter/shared/network/api_repository.dart';
import 'package:lucasvalente_heroes_flutter/shared/widgets/background.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen() : super();

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class Debouncer {
  final int milliseconds;
  VoidCallback action;
  Timer _timer;

  Debouncer({this.milliseconds});

  run(VoidCallback action) {
    if (null != _timer) {
      _timer.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}

class _HomeScreenState extends State<HomeScreen> {
  ApiRepository repository = ApiRepository();
  final _debouncer = Debouncer(milliseconds: 500);
  bool isLoading;
  bool isSearch;
  List<heroeslist.Result> result = List<heroeslist.Result>();
  List<heroeslist.Result> heroinesList = List<heroeslist.Result>();

  @override
  void initState() {
    isSearch = false;
    isLoading = false;
    super.initState();
  }

  Widget makeBody() {
    if (isLoading) {
      return this.indicator();
    } else {
      return this.makeCol();
    }
  }

  Widget makeCol() {
    if (isSearch) {
      return this.searchlist();
    } else {
      return this.welcome();
    }
  }

  Widget indicator() {
    return Center(
        child: SpinKitFoldingCube(
          color: kRoxo,
          size: 100.0,
        ),
      );
  }

  Widget searchlist() {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        shrinkWrap: true,
        itemCount: heroinesList == null ? 0 : heroinesList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 0.0,
            margin: new EdgeInsets.symmetric(horizontal: 2.0, vertical: 6.0),
            child: Neumorphic(
              style: NeumorphicStyle(
                color: kBackground,
                depth: 2.5,
                intensity: 0.8,
                shape: NeumorphicShape.flat,
              ),
              child: Container(
                child: ListTile(
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HeroeDetailScreen(id: heroinesList[index].id,),
                        ));
                  },
                  leading: Container(
                    padding: EdgeInsets.only(right: 12.0),
                    decoration: new BoxDecoration(
                      border: new Border(
                        right: new BorderSide(width: 1.0, color: kRoxo),
                      ),
                    ),
                    child:
                    Neumorphic(
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        depth:  3,
                        boxShape: NeumorphicBoxShape.circle(),
                        intensity: 0.8,
                      ),
                      child: CircleAvatar(
                        backgroundImage: NetworkImage(heroinesList[index].image.url),
                        radius: 30,
                      ),
                    ),
                  ),
                  title: Text(
                    heroinesList[index].name,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                        fontSize: 15.0,
                        color: kRoxo,
                        fontFamily: 'Balsamiq',
                        fontWeight: FontWeight.w500),
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      Icon(Icons.linear_scale, color: kRoxo),
                      Text(
                        'Heroine ID: ${heroinesList[index].id}',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 10.0,
                            color: kRoxo,
                            fontFamily: 'Balsamiq',
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(width: 10,),
                      Text(
                        '${heroinesList[index].biography.publisher}',
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                            fontSize: 10.0,
                            color: kPreto,
                            ),
                      ),
                    ],
                  ),
                  trailing: Neumorphic(
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      depth: 1.5,
                      intensity: 1,
                      color: kRosa,
                      boxShape: NeumorphicBoxShape.circle()
                    ),
                    child: Icon(Icons.keyboard_arrow_right,
                        color: kRoxo, size: 40.0),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget searchBar() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Neumorphic(
        style: NeumorphicStyle(
            boxShape:  NeumorphicBoxShape.stadium(),
            shape: NeumorphicShape.concave,
            intensity: 9,
            surfaceIntensity: 2,
            depth: -2.5,
            lightSource: LightSource.topLeft,
            color: Colors.transparent
        ),
        child: TextField(
          style: TextStyle( color: kRoxo, fontFamily: 'Balsamiq'),
          decoration: InputDecoration(
            border: InputBorder.none,
            hintStyle: TextStyle(color: kRoxo),
            contentPadding: EdgeInsets.all(15.0),
            hintText: 'Search your favorite Heroine...',
          ),
          onChanged: (string) {
            if (string == '') {
              _debouncer.run(() {
                  setState(() {
                    isLoading = false;
                    isSearch = false;
                  });
              });
            }else{
            _debouncer.run(() {
              repository.getHeroes(string).then((usersFromServer) {
                setState(() {
                  result = usersFromServer;
                  heroinesList = result.where((i) => i.appearance.gender == 'Female').toList();
                  isLoading = false;
                  isSearch = true;
                });
              });
            });}
          },
        ),
      ),
    );
  }

  Widget welcome(){
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image(
          image: AssetImage('images/heroineBlue.gif'),
          height: 500.0,
          width: 500.0,
        ),
        NeumorphicText(
          'Heroines Catalog!',
          textAlign: TextAlign.center,
          textStyle: NeumorphicTextStyle(
          fontSize: 45.0,
            fontFamily: 'Pacifico',
          ),
          style: NeumorphicStyle(
            shape: NeumorphicShape.flat,
          depth: 2.5,
          intensity: 9,
          color: Colors.transparent,
          ),
        ),
          SizedBox(height:MediaQuery.of(context).size.height*.05),
          Text(
          "From LucasValente to B2W, developed with love <3",
    textAlign: TextAlign.center,
    style: TextStyle(color: kRoxo, fontSize: 14, fontFamily: 'Balsamiq'),),
       // allHeroesList(),
      ],
    );
  }

  StatefulWidget showData() {
    return Scaffold(
      backgroundColor: kBackground,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              searchBar(),
              makeBody(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return showData();
  }
}