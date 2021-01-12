class CityQuery {
  static var city = """
    query (\$filter: String!) {
      cities(filter: \$filter) {
        name,
        _id
      }
  }
""";
}
