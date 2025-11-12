class Event{

  //constructor
  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.location,
    required this.time,
    this.imageUrl,

  });
  //fields
  final String id;
  final String name; 
  final String description; 
  final String location; 
  final DateTime time; 
  final String? imageUrl;
  bool _favorite = false;
  
  //getter
  bool get favorite => _favorite;

  void toggleIsFav(){
    _favorite = !_favorite;
  }
}

//dummy event data

List<Event> events = [
  Event(id: '1',name: 'Double Cheeseburgers', 
    description: 'Buy 1 cheeseburger get a second one for free.', 
    location: '2625 South Blvd, Charlotte, NC 28209',  time: DateTime.now()),
    Event(id: '2',name: 'Golf for free', 
    description: 'For every hour spent golfing you get a free additional hour', 
    location: '8024 Savoy Corporate Dr, Charlotte, NC 28273',  time: DateTime.now()),
    Event(id: '3', name: 'Taco Tuesday', 
    description: 'All tacos cost 1 lunch today 2:00', 
    location: '5710 South Blvd, Charlotte, NC 28217',  time: DateTime.now()),
];