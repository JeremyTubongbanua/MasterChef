class Recipe {
  late String id;
  final String name;
  final String imageUrl;
  final String author;
  final List<int> ratings;
  final List<Map<String, dynamic>> ingredients;
  final List<String> steps;
  /**
   * [
   *  {
   *    'name': 'flour',
   *    'amount': 2,
   *  }
   * ]
   */

  Recipe(this.name, this.imageUrl, this.author, this.ratings, this.ingredients, this.steps) {
    this.id = this.name + DateTime.now().toIso8601String();
  }

  double get averageRating {
    int total = 0;
    ratings.forEach((rating) {
      total += rating;
    });
    return (total / ratings.length);
  }

  // ignore: slash_for_doc_comments
  /**
   * final List<Map<String, dynamic>> fridge = [
      {
        'name': 'Flour',
        'amount': 2,
      },
      {
        'name': 'Eggs',
        'amount': 12,
      },
      {
        'name': 'Olive Oil',
        'amount': 1,
      },
      {
        'name': 'Butter',
        'amount': 1,
      }
    ];

    RECIPE
    [
          {
            'name': 'Flour',
            'amount': 2,
          },
          {
            'name': 'Sausages',
            'amount': 4,
          }
        ],



        [
          {
            'name': 'Flour',
            'have': 2,
            'need': 2,
          },
          {
            'name': 'Sausages',
            'have' 0,
            'need' 4
          }
        ]
   */

  List<Map<String, dynamic>> getAssessment(List<Map<String, dynamic>> fridge) {
    List<Map<String, dynamic>> build = [];
    bool goodSoFar = true;
    for (int i = 0; i < ingredients.length; i++) {
      final String ingredientName = ingredients[i]['name'];
      final double ingredientAmount = ingredients[i]['amount'];
      Map<String, dynamic> smallBuild = {'name': ingredientName, 'need': ingredientAmount, 'have': 0};
      for (int j = 0; j < fridge.length; j++) {
        final String fridgeName = fridge[j]['name'];
        final double fridgeAmount = fridge[j]['amount'];
        if (ingredientName.toLowerCase() == fridgeName.toLowerCase()) {
          smallBuild['have'] = fridgeAmount;
          break;
        }
      }
      build.add(smallBuild);
    }
    return build;
  }
}
