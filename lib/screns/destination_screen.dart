import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelApp/model/activity_model.dart';
import 'package:travelApp/model/destination_model.dart';

class DestionationScreen extends StatefulWidget {

  final Destination destination;

  DestionationScreen({this.destination});

  @override
  _DestionationScreenState createState() => _DestionationScreenState();
}

class _DestionationScreenState extends State<DestionationScreen> {
  
  Text _buildRatingStars(int rating){
    String stars = '';
    for (int i = 0; i < rating; i++){
      stars += '⭐ ';
    }
    stars.trim();
    return Text(stars);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          //inicio do conjunto total da imagem e suas informações
          Stack(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0,
                    )
                  ]
                ),
                child: Hero(    //widget para fazer animação de expansão
                  tag: widget.destination.imageUrl, //tag da animação para localização
                    child: ClipRRect(
                    borderRadius: BorderRadius.circular(30.0),
                    child: Image(
                      image: AssetImage(widget.destination.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),  //comando para retornar uma pagina
                    ),
                    Row(
                      children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 30.0,
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),  //comando para retornar uma pagina
                      ),
                      IconButton(
                        icon: Icon(FontAwesomeIcons.sortAmountDown),
                        iconSize: 25.0,
                        color: Colors.white,
                        onPressed: () => Navigator.pop(context),  //comando para retornar uma pagina
                      ),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                //inicio das informações de pais e cidade
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(widget.destination.city,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 30.0,
                      letterSpacing: 1.2,
                    ),
                    ),
                    //inicio do icone da setinha e texto do pais
                    Row(
                      children: <Widget>[
                        Icon(FontAwesomeIcons.locationArrow, 
                          size: 12.0,
                          color: Colors.white70,),
                        SizedBox(width: 10.0,),
                        Text(widget.destination.country,
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 20.0
                        ),),
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                right: 20.0,
                bottom: 20.0,
                child: Icon(
                  Icons.location_on,
                  color: Colors.white70,
                  size: 25.0,
                ),
              )
            ],
          ),
          //Fim do conjunto total da imagem
          //inicio da lista de atividades de cada cidade
          Expanded( //necessário colocar esse widget poi stava dando erro, na qual nao tinha especificado um tamanho pra lista (altura)
              child: ListView.builder(
              padding: EdgeInsets.only(top: 10.0, bottom: 15.0),
              itemCount: widget.destination.activities.length,
              itemBuilder: (BuildContext context, int index) {
                Activity activity = widget.destination.activities[index];
                return Stack(
                  children: <Widget>[
                    //inicio do container branco atrás da imagem
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Padding(
                        padding:  EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(    
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,                  
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Container(
                                  width: 120.0,
                                  child: Text(activity.name, 
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w600
                                    ),
                                    overflow: TextOverflow.ellipsis,  //Adicina 3 pontos quando o texto excede o tamanho maximo
                                    maxLines: 2,    //Definindo quantidade maxima de quebra de linhas
                                  ),
                                ),
                                Column(
                                  children: <Widget>[
                                    Text('\$${activity.price}',
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Text("Per tax",
                                    style: TextStyle(
                                      color: Colors.grey
                                    ),)
                                  ],
                                ),
                              ],
                            ),
                            Text(activity.type,
                            style: TextStyle(
                              color: Colors.grey,
                            ),),
                            _buildRatingStars(activity.rating),
                            SizedBox(height: 10.0),
                            Row(
                              children: <Widget>[
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    activity.startTimes[0],
                                  ),
                                ),
                                SizedBox(width: 10.0),
                                Container(
                                  padding: EdgeInsets.all(5.0),
                                  width: 70.0,
                                  decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    activity.startTimes[1],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image(
                          width: 110.0,
                          image: AssetImage(
                            activity.imageUrl
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}