class Room {
  late String number;
  late String name;
  late String teacher;
  late String image;
  late String type;
  late double startX;
  late double startY;
  late double endX;
  late double endY;

  Room.fromJson(var json, int index) {
    number = json[index]['number'];
    name = json[index]['name'];
    teacher = json[index]['teacher'];
    image = json[index]['image'];
    type = json[index]['type'];
    startX = json[index]['startpos']['x'];
    startY = json[index]['startpos']['y'];
    endX = json[index]['endpos']['x'];
    endY = json[index]['endpos']['y'];
  }
}