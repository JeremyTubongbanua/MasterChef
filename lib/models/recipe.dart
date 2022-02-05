class Recipe {
  late String id;
  final String name;
  final String imageUrl;
  final String author;
  final List<int> ratings;
  final List<Map<String, dynamic>> ingredients;
  /**
   * [
   *  {
   *    'name': 'flour',
   *    'amount': 2,
   *  }
   * ]
   */

  Recipe(this.name, this.imageUrl, this.author, this.ratings, this.ingredients) {
    this.id = this.name + DateTime.now().toIso8601String();
  }

  double get averageRating {
    int total = 0;
    ratings.forEach((rating) {
      total += rating;
    });
    return (total / ratings.length);
  }
}
