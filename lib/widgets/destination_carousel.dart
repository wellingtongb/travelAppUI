import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelApp/model/destination_model.dart';
import 'package:travelApp/screns/destination_screen.dart';

class DestinationCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0), //acrescenta um space de 20 nas bordas
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //acrescenta spaço maximo entre os widget
                    children: <Widget>[
                      Text("Top Destination", 
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        ),
                      ),
                      GestureDetector(
                        onTap: ()=> print("See all"),        
                        child: Text("See all",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.0,
                          letterSpacing: 1.0,
                        ),),
                      )
                    ],
                  ),
                ),
                //Inicio do carrousel horizontal
                Container(
                  height: 300,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: destination.length,
                    itemBuilder: (BuildContext context, int index){
                      Destination destinations = destination[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (context) => DestionationScreen(
                            destination: destinations,
                          ),
                        )),
                                              child: Container(
                          margin: EdgeInsets.all(10.0),
                          width: 210.0,
                          child: Stack(
                            alignment: Alignment.topCenter, //alinhando todos os filhos no top center
                            children: <Widget>[
                              Positioned(
                                bottom: 15.0,
                                //inicio do container dos textos abaixo da imagem
                                child: Container(
                                  height: 120.0,
                                  width: 200,                              
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '${destinations.activities.length} activities',
                                          style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1.2,
                                          ),
                                          ),
                                          Text(
                                            destinations.description,
                                            style: TextStyle(
                                              color: Colors.grey
                                            ),
                                          )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black54,
                                      offset: Offset(0.0, 2.0),
                                      blurRadius: 6.0,
                                    ),
                                  ],
                                ),
                                child: Stack(
                                  children: <Widget>[
                                    Hero(   //widget para realizar a animação 
                                      tag: destinations.imageUrl, //tag para alvo da animação
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image(
                                          width: 180.0,
                                          height: 180.0,
                                          image: AssetImage(destinations.imageUrl),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    //inicio da coluna de textos da imagem
                                    Positioned(
                                      left: 10.0,
                                      bottom: 10.0,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(destinations.city,
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 24.0,
                                            letterSpacing: 1.2,
                                          ),
                                          ),
                                          //inicio do icone da setinha e texto do pais
                                          Row(
                                            children: <Widget>[
                                              Icon(FontAwesomeIcons.locationArrow, 
                                                size: 10.0,
                                                color: Colors.white,),
                                              SizedBox(width: 5.0,),
                                              Text(destinations.country,
                                              style: TextStyle(
                                                color: Colors.white
                                              ),),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              ],
            );
  }
}