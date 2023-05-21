class Announcement {
  String link;
  String label;

  Announcement({
    required this.link,
    required this.label,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      link: json['link'],
      label: json['label'],
    );
  }
}
