class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel ({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'assets/images/hotel0.jpg',
    name: 'Hotel 0',
    address: '742 Kingdon Ave',
    price: 175,
  ),
    Hotel(
    imageUrl: 'assets/images/hotel1.jpg',
    name: 'Hotel 1',
    address: '671 Market Street',
    price: 300,
  ),
    Hotel(
    imageUrl: 'assets/images/hotel2.jpg',
    name: 'Hotel 2',
    address: '1745 College Ave',
    price: 270,
  ),
    Hotel(
    imageUrl: 'assets/images/hotel3.png',
    name: 'Hotel 3',
    address: '1147 Unit Ave',
    price: 350,
  ),
];