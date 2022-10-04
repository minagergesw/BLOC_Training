class Character {
 late int charId;
 late String name;
 late String nickname;
 late String image;
 late List<dynamic> jobs;
 late String deadOrAlive;
 late List<dynamic> appearanceOfFirstSeries;
 late String actorName;
 late String category;
 late List<dynamic> appearanceOfSecondSeries;


  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    nickname = json['nickname'];
    image = json['img'];
    jobs = json['occupation'];
    deadOrAlive = json['status'];
    appearanceOfFirstSeries = json['appearance'];
    actorName = json['portrayed'];
    category = json['category'];
    appearanceOfSecondSeries = json['better_call_saul_appearance'];
  }
}
