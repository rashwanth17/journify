class Data {
  int? id;
  int? mood;
  String? title;
  String? date;
  String? time;

  Data({this.id, this.mood, this.title, this.date, this.time});

  Data.fromJson(Map<String, dynamic> json) {
    // Specify the type here
    id = json["id"];
    mood = json["mood"];
    title = json["title"];
    date = json["date"];
    time = json["time"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> d = new Map<String, dynamic>();
    d["id"] = this.id;
    d["mood"] = this.mood;
    d["title"] = this.title;
    d["date"] = this.date;
    d["time"] = this.time;
    return d;
  }
}
