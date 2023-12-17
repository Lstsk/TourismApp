class Data {
  final String name;
  final String imagePath;
  final String description;
  final String location;
  final String category;
  final double rating;
  final String displayname;

  Data(this.name, this.imagePath, this.description, this.location, this.rating,
      this.category, this.displayname);

  static List<Data> fetchAll() {
    return [
      Data("banzaicliff", "Carson", "Saipan", "Saipan", 5, "place",
          "Banzai Cliff"),
      Data("managahaisland", "Carson", "Saipan", "Saipan", 5, "place",
          "Managaha"),
      Data("grotto", "Carson", "Saipan", "Saipan", 4.9, "place", "Grotto"),
      Data("birdisland", "Carson", "Saipan", "Saipan", 3.5, "place",
          "Bird Island"),
      // Data("oldmanbythesea", "Carson", "Carson", "Carson", 23, "place"),
      Data("forbiddenisland", "Carson", "Saipan", "Saipan", 4.3, "place",
          "Forbidden Island"),

      Data("theshacksaipan", "Carson", "Saipan", "Saipan", 4.9, "culinary",
          "The Shack Saipan"),
      Data("spicythainoodle", "Carson", "Saipan", "Saipan", 4.1, "culinary",
          "Spicy Thai Noodle"),
      Data("majestyrestaurant", "Carson", "Saipan", "Saipan", 3.4, "culinary",
          "Majesty Chinese Restaurant"),
      Data("tappedout", "Carson", "Saipan", "Saipan", 3.1, "culinary",
          "Tapped Out"),
      Data("himawari", "Carson", "Saipan", "Saipan", 5, "culinary", "Himawari"),
    ];
  }

  static List<Data> fetchFilter(String name) {
    final allList = fetchAll();

    return allList
        .where((element) => element.category == name.toLowerCase())
        .toList();
  }
}
