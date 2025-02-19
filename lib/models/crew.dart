class Crew {
  final int id;
  final String name;
  final String? job;
  final String? department;
  final String? profilePath;

  Crew({
    required this.id,
    required this.name,
    this.job,
    this.department,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      department: json['department'],
      profilePath: json['profile_path'],
    );
  }
}
