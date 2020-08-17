import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:expandable/expandable.dart';
import 'package:lucasvalente_heroes_flutter/models/heroe_detail.dart';
import 'package:lucasvalente_heroes_flutter/shared/constants.dart';
import 'package:lucasvalente_heroes_flutter/shared/network/api_repository.dart';
import 'package:lucasvalente_heroes_flutter/shared/widgets/background.dart';
import 'package:lucasvalente_heroes_flutter/shared/widgets/background_espelhado.dart';
import 'package:lucasvalente_heroes_flutter/shared/widgets/key_value.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class HeroeDetailScreen extends StatefulWidget {

  final String id;

  HeroeDetailScreen({Key key, @required this.id}): super(key: key);

  @override
  _HeroeDetailScreenState createState() => _HeroeDetailScreenState();
}

class _HeroeDetailScreenState extends State<HeroeDetailScreen>
    with SingleTickerProviderStateMixin {

  bool isLoading;

  HeroeDetail heroine = HeroeDetail();

  TabController _tabController;
  ApiRepository repository = ApiRepository();

  @override
  void initState() {
    isLoading = true;
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
    repository.getHeroeDetail(widget.id).then((usersFromServer) {
      setState(() {
        print(usersFromServer);
        heroine = usersFromServer;
        isLoading = false;
      });
    });
  }

  Widget makeBody() {
    if (isLoading) {
      return this.indicator();
    } else {
      return this.Tabi();
    }
  }

  Widget indicator() {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kRoxo, //change your color here
        ),
        elevation: 0.0,
        backgroundColor: kBackground,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            NeumorphicText(
            'Loading...',
            textStyle: NeumorphicTextStyle(
              fontSize: 25.0,
              fontFamily: 'Pacifico',
            ),
            style: NeumorphicStyle(
              shape: NeumorphicShape.flat,
              depth: 2.5,
              intensity: 9,
              color: kRoxo,
            ),
          ),
          ],
        ),
      ),
      body: Center(
        child: SpinKitPulse(
          color: kRoxo,
          size: 100.0,
        ),
      ),
    );
  }

  Widget Tabi() {
    return new Scaffold(
      backgroundColor: kBackground,
      appBar: new AppBar(
        iconTheme: IconThemeData(
          color: kRoxo, //change your color here
        ),
        elevation: 5.0,
        backgroundColor: kBranco,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 20,
              child: Container(),
            ),
            Expanded(
              flex: 80,
              child: Text(
                'Heorines Catalog!',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 18.0,
                  color: kRoxo,
                  fontFamily: 'Pacifico',
                ),
              ),
            ),
          ],
        ),
        bottom: TabBar(
          unselectedLabelColor: kBackground,
          labelColor: kRoxo,
          tabs: [
            Tab(
              icon: new Icon(Icons.person),
              text: "Heroine",
            ),
            Tab(
              icon: new Icon(Icons.data_usage),
              text: "Power Stats",
            ),
          ],
          controller: _tabController,
          indicatorColor: kRoxo,
          indicatorSize: TabBarIndicatorSize.tab,
        ),
        bottomOpacity: 1,
      ),
      body: TabBarView(
        children: [
          BodyWidget(),
          produt(),
        ],
        controller: _tabController,
      ),
    );
  }

  Widget BodyWidget() {
    return Scaffold(
      backgroundColor: kBackground,
      body: BackgroundEspelhado(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kBranco,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.transparent,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: new Offset(0.0, 0.0),
                                    blurRadius: 2.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Neumorphic(
                                  style: NeumorphicStyle(
                                    shape: NeumorphicShape.flat,
                                    depth: 3,
                                    boxShape: NeumorphicBoxShape.circle(),
                                    intensity: 9,
                                  ),
                                  child: CircleAvatar(
                                    backgroundImage: NetworkImage(heroine.image.url),
                                    radius: 90,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 5,),
                          Expanded(flex: 70,child: Card(color: kBranco, child: Column(children: [Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: <Widget>[
                                    Flexible(
                                        child: NeumorphicText(
                                          '${heroine.name}',
                                          style: NeumorphicStyle(
                                            color: kRoxo,
                                            depth: 3,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 25,
                                            fontFamily: 'Pacifico',),
                                        )
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                        child: NeumorphicText(
                                          'Id',
                                          style: NeumorphicStyle(
                                            color: kRoxo,
                                            depth: 3,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Balsamiq',),
                                        )
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                        child: NeumorphicText(
                                          '#${heroine.id.toString()}',
                                          style: NeumorphicStyle(
                                            color: kRoxo,
                                            depth: 3,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Balsamiq',),
                                        )
                                    ),
                                  ],
                                ),
                                Divider(),
                                Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                        child: NeumorphicText(
                                          'Publisher',
                                          style: NeumorphicStyle(
                                            color: kRoxo,
                                            depth: 3,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 15,
                                            fontFamily: 'Balsamiq',),
                                        )
                                    ),
                                    SizedBox(width: 10),
                                    Flexible(
                                        child: NeumorphicText(
                                          '${heroine.biography.publisher.toString()}',
                                          style: NeumorphicStyle(
                                            color: kRoxo,
                                            depth: 3,
                                            intensity: 1,
                                          ),
                                          textStyle: NeumorphicTextStyle(
                                            fontSize: 18,
                                            fontFamily: 'Pacifico',),
                                        )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),],),),),
                        ],
                      ),
                    ),
                    Container(
                      child: Card(
                        elevation: 2,
                        color: kBranco,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              height: 10,
                            ),
                            KeyValue(
                                texto1: 'Height',
                                texto2: heroine.appearance.height[1]),
                            Divider(),
                            KeyValue(
                                texto1: 'Weight', texto2: heroine.appearance.weight[1]),
                            Divider(),
                            KeyValue(texto1: 'Eye Color', texto2: heroine.appearance.eyeColor),
                            Divider(),
                            KeyValue(
                                texto1: 'Hair Color', texto2: heroine.appearance.hairColor),
//                          Divider(),
//                          compras_detalhe_widget(
//                              texto1: 'Rentabilidade',
//                              texto2:
//                                  '${DateFormat("dd/MM/yyyy").format(DateTime.parse(data.toString().substring(0, 10)))}'),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        color: kBranco,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ExpandablePanel(
                              theme: ExpandableThemeData(
                                iconColor: kRoxo,
                              ),
                              header: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Allies',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Pacifico',
                                        color: kRoxo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              expanded: ListView.builder(
                                //TODO: adicionar segundo telefone
                                physics: new NeverScrollableScrollPhysics(),
                                padding: EdgeInsets.all(5.0),
                                shrinkWrap: true,
                                itemCount: heroine.biography.aliases == null ? 0 : heroine.biography.aliases.length,
                                itemBuilder: (BuildContext context, int index) {
                                  //return makeCard;
                                  return Card(
                                    elevation: 1.0,
                                    margin: new EdgeInsets.symmetric(
                                        horizontal: 2.0, vertical: 5.0),
                                    child: Container(
                                      decoration:
                                      BoxDecoration(color: kBackground),
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                               NeumorphicIcon(
                                                 Icons.account_circle,
                                                 style: NeumorphicStyle(
                                                   color: kRoxo
                                                 ),
                                               ),
                                                SizedBox(width: 10),
                                                Flexible(
                                                  child: NeumorphicText(
                                                    '${heroine.biography.aliases[index].toString()}',
                                                    style: NeumorphicStyle(
                                                      color: kRoxo,
                                                      depth: 3,
                                                      intensity: 1,
                                                    ),
                                                    textStyle: NeumorphicTextStyle(
                                                      fontSize: 18,
                                                      fontFamily: 'Balsamiq',),
                                                  )
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        color: kBranco,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ExpandablePanel(
                              theme: ExpandableThemeData(
                                iconColor: kRoxo,
                              ),
                              header: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Biography',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Pacifico',
                                        color: kRoxo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              expanded: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  KeyValue(
                                      texto1: 'Full Name',
                                      texto2: heroine.biography.fullName),
                                  Divider(),
                                  KeyValue(
                                      texto1: 'Alter-Egos',
                                      texto2: heroine.biography.alterEgos),
                                  Divider(),
                                  KeyValue(
                                      texto1: 'Place of Birth', texto2: heroine.biography.placeOfBirth),
                                  Divider(),
                                  KeyValue(texto1: 'Publisher', texto2: heroine.biography.publisher),
                                  Divider(),
                                  KeyValue(
                                      texto1: 'Aligment', texto2: heroine.biography.alignment),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        color: kBranco,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ExpandablePanel(
                              theme: ExpandableThemeData(
                                iconColor: kRoxo,
                              ),
                              header: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Work',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Pacifico',
                                        color: kRoxo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              expanded: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  KeyValue(
                                      texto1: 'Occupation',
                                      texto2: heroine.work.occupation),
                                  Divider(),
                                  KeyValue(
                                      texto1: 'Base',
                                      texto2: heroine.work.base),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Card(
                        color: kBranco,
                        margin: new EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 6.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            ExpandablePanel(
                              theme: ExpandableThemeData(
                                iconColor: kRoxo,
                              ),
                              header: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Connections',
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Pacifico',
                                        color: kRoxo,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              expanded: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  SizedBox(
                                    height: 10,
                                  ),
                                  KeyValue(
                                      texto1: 'Group',
                                      texto2: heroine.connections.groupAffiliation),
                                  Divider(),
                                  KeyValue(
                                      texto1: 'Relatives',
                                      texto2: heroine.connections.relatives),
                                  SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget produt() {
    return Scaffold(
      backgroundColor: kBackground,
      body: Background(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  "Intelligence".toUpperCase() +
                      " - ${heroine.powerstats.intelligence}%",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: kRoxo,
                      fontFamily: 'Balsamiq',
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -1,
                      intensity: 1,
                      shape: NeumorphicShape.concave
                  ),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 15.0,
                    animationDuration: 5000,
                    percent: converter(heroine.powerstats.intelligence)  / 100.0,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.blue,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Strength".toUpperCase() + " - ${heroine.powerstats.strength}%",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: kRoxo,
                      fontFamily: 'Balsamiq',
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -1,
                      intensity: 1,
                      shape: NeumorphicShape.concave
                  ),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 15.0,
                    animationDuration: 5000,
                    percent: converter(heroine.powerstats.strength)  / 100.0,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.orange,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Speed".toUpperCase() + " - ${heroine.powerstats.speed}%",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: kRoxo,
                      fontFamily: 'Balsamiq',),
                ),
                subtitle: Neumorphic(
                  style: NeumorphicStyle(
                    depth: -1,
                    intensity: 1,
                    shape: NeumorphicShape.concave
                  ),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 15.0,
                    animationDuration: 5000,
                    percent: converter(heroine.powerstats.speed)  / 100.0,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.green,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Durability".toUpperCase() +
                      " - ${heroine.powerstats.durability}%",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: kRoxo,
                      fontFamily: 'Balsamiq',
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -1,
                      intensity: 1,
                      shape: NeumorphicShape.concave
                  ),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 15.0,
                    animationDuration: 5000,
                    percent: converter(heroine.powerstats.durability)  / 100.0,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.orangeAccent,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Power".toUpperCase() + " - ${heroine.powerstats.power}%",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: kRoxo,
                      fontFamily: 'Balsamiq',
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -1,
                      intensity: 1,
                      shape: NeumorphicShape.concave
                  ),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 15.0,
                    animationDuration: 5000,
                    percent: converter(heroine.powerstats.power) / 100.0,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.red,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "Combat".toUpperCase() + " - ${heroine.powerstats.combat}%",
                  style: TextStyle(
                      fontSize: 15.0,
                      color: kRoxo,
                      fontFamily: 'Balsamiq',
                      fontWeight: FontWeight.w500),
                ),
                subtitle: Neumorphic(
                  style: NeumorphicStyle(
                      depth: -1,
                      intensity: 1,
                      shape: NeumorphicShape.concave
                  ),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 15.0,
                    animationDuration: 5000,
                    percent: converter(heroine.powerstats.combat) / 100.0,
                    linearStrokeCap: LinearStrokeCap.roundAll,
                    progressColor: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  converter(String string) {
    var numero = double.parse(string);
    return numero; // prints true
  }

  @override
  Widget build(BuildContext context) {
    return makeBody();
  }
}

class compras_detalhe_widget extends StatelessWidget {
  const compras_detalhe_widget(
      {Key key, @required this.texto1, @required this.texto2})
      : super(key: key);

  final String texto1;
  final String texto2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            texto1,
            overflow: TextOverflow.clip,
            style: TextStyle(
                fontSize: 18,
                fontFamily: 'OpenSans',
                color: Colors.black,
                fontWeight: FontWeight.w500),
          ),
          SizedBox(width: 10),
          Flexible(
            child: Text(
              texto2 ?? "-",
              style: TextStyle(
                  fontSize: 18, fontFamily: 'OpenSans', color: kCinzaEscuro),
              overflow: TextOverflow.clip,
            ),
          ),
        ],
      ),
    );
  }
}