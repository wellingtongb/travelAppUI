import 'package:travelApp/model/activity_model.dart';

class Destination {
  String imageUrl;
  String city;
  String country;
  String description;
  List<Activity> activities;

  Destination({
    this.imageUrl,
    this.city,
    this.country,
    this.description,
    this.activities,
  });
}

List<Activity> activities = [
  Activity(
    imageUrl: 'assets/images/stmarksbasilica.jpg',
    name: 'St Mark\'s Basilica',
    type: 'Sightseeing Tour',
    startTimes: ['9:00 am', '11:00 am'],
    rating: 5,
    price: 30,
  ),
  Activity(
    imageUrl: 'assets/images/gondola.jpg',
    name: 'Walking Tour and Gondola Ride',
    type: 'Sightseeing Tour',
    startTimes: ['11:00 pm', '1:00 am'],
    rating: 4,
    price: 210,
  ),
  Activity(
    imageUrl: 'assets/images/murano.jpg',
    name: 'Murano and Burano Tour',
    type: 'Sightseeing Tour',
    startTimes: ['12:30 pm', '2:00 pm'],
    rating: 3,
    price: 125,
  ),
];

List<Destination> destination = [
  Destination(
    imageUrl: 'assets/images/venice.jpg',
    city: 'Venice',
    country: 'Italy',
    description: 'Visit Venice for an amazing and unforgetable Tour',
    activities: activities,    
  ),
    Destination(
    imageUrl: 'assets/images/paris.jpg',
    city: 'Paris',
    country: 'France',
    description: 'Visit Paris for an amazing and unforgetable Tour',
    activities: activities,    
  ),
    Destination(
    imageUrl: 'assets/images/newdelhi.jpg',
    city: 'New Delhi',
    country: 'India',
    description: 'Visit New Delhi for an amazing and unforgetable Tour',
    activities: activities,    
  ),
    Destination(
    imageUrl: 'assets/images/saopaulo.jpg',
    city: 'São Paulo',
    country: 'Brazil',
    description: 'Visit São Paulo for an amazing and unforgetable Tour',
    activities: activities,    
  ),
    Destination(
    imageUrl: 'assets/images/newyork.jpg',
    city: 'New York',
    country: 'United States',
    description: 'Visit New York for an amazing and unforgetable Tour',
    activities: activities,    
  ),
];