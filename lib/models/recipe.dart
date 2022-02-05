class Recipe {
  late String id;
  final String name;
  final String imageUrl;

  Recipe(this.name, this.imageUrl) {
    this.id = this.name + DateTime.now().toIso8601String();
  }
}
