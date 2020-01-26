import 'package:flutter/material.dart';
import 'package:travelApp/model/hotel_model.dart';

class HotelCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0), //acrescenta um space de 20 nas bordas
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, //acrescenta spaço maximo entre os widget
                    children: <Widget>[
                      Text("Excluse Hotels", 
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
                    itemCount: hotels.length,
                    itemBuilder: (BuildContext context, int index){
                      Hotel hotel = hotels[index];
                      return Container(
                        margin: EdgeInsets.all(10.0),
                        width: 240.0,
                        child: Stack(
                          alignment: Alignment.topCenter, //alinhando todos os filhos no top center
                          children: <Widget>[
                            Positioned(
                              bottom: 15.0,
                              //inicio do container dos textos abaixo da imagem
                              child: Container(
                                height: 120.0,
                                width: 240,                              
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10)
                                ),
                                child: Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Text(
                                        hotel.name,
                                        style: TextStyle(
                                          fontSize: 22.0,
                                          fontWeight: FontWeight.w600,
                                          letterSpacing: 1.2,
                                        ),
                                        ),
                                        SizedBox(height: 2.0),
                                        Text(
                                          hotel.address,
                                          style: TextStyle(
                                            color: Colors.grey
                                          ),
                                        ),
                                        SizedBox(height: 2.0,),
                                        Text(
                                          '\$${hotel.price} / night',
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w600,
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
                              child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image(
                                      width: 220.0,
                                      height: 180.0,
                                      image: AssetImage(hotel.imageUrl),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            );
  }
}