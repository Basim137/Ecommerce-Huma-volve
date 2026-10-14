class EndPoints {
  static String baseUrl = 'https://api.escuelajs.co/api/v1/';
  static String login = 'auth/login';
  static String register = 'users';
  static String getCategories = 'categories';
  static String getCategoryProducts(int id) {
    return 'categories/${id.toString()}/products';
  }
}

/*

{
  "email": "string",
  "name": "string",
  "password": "string",
  "role": "string",
  "avatar": "string"
}

 */
class ApiKeys {
  static String email = "email";
  static String password = "password";
  static String role = "role";
  static String accessToken = "access_token";
  static String refreshToken = "refresh_token";
  static String avatar = "avatar";
  static String name = "name";
  static String price = "price";
  static String desc = "description";
  static String id = 'id';
  static String title = "title";
  static String category = "category";
  static String categorySlug = 'slug';
  static String image = 'image';
  static String images = "images";
  static String categoryCreation = 'creationAt';
  static String categoryUpdated = 'updatedAt';
}
