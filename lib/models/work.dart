class Work {
  Work({
    this.occupation,
    this.base,
  });

  String? occupation;
  String? base;

  factory Work.fromJson(Map<String, dynamic> json) => Work(
        occupation: json["occupation"],
        base: json["base"],
      );
}
