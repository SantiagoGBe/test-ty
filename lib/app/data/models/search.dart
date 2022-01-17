class Search {
  int? id;
  final int userId;
  final String search;

  Search({
    this.id,
    required this.userId,
    required this.search,
  });

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'search': search,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, userId: $userId, search: $search}';
  }
}
