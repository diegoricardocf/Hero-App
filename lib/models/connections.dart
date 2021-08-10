class Connections {
  Connections({
    this.groupAffiliation,
    this.relatives,
  });

  String? groupAffiliation;
  String? relatives;

  factory Connections.fromJson(Map<String, dynamic> json) => Connections(
        groupAffiliation: json["group-affiliation"],
        relatives: json["relatives"],
      );
}
