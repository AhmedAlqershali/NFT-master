class ApiSettingsT {
  static const String baseUrl= "https://storesuadia-001-site1.etempurl.com";

  //Auth
  static const String login = "/api/Auth/Login";
  static const String register = "/api/Users/register";
  static const String logout = "/api/Auth/logout";
  //Collections
  static const String get_collections = "/api/Collections/GetAll?Search={search}";
  static const String create_collections = "/api/Collections/Create";
  static const String details_collections = "/api/Collections/Details?id={id}";
  static const String delete_collections = "/api/Collections/Delete?id={id}";
  //Favorites
  static const String add_favorite_product = "/api/Favorites/AddFavoriteProduct";
  static const String get_favorite_products = "/api/Favorites/GetFavoriteProducts";
  //Follows
  static const String follow = "/api/Follows/FollowUser";
  static const String unfollow = "/api/Follows/UnfollowUser";
  //Notifications
  static const String get_notifications = "/api/Notifications/GetNotifications";
  //Product
  static const String get_all_products = "/api/Products/GetAllProducts";
  static const String get_product_id = "/api/Products/GetProduct?Id={id}";
  static const String upload_product = "/api/Products/UploadProduct";
  static const String delete_product = "/api/Products/DeleteProduct?id={id}";
  static const String purchase_product = "/api/Products/PurchaseProduct";
  //Users
  static const String get_all_users = "/api/Users/Users";
  static const String get_top_selling_users = "/api/Users/GetTopSellingUsers?count={count}";
  static const String search_user = "/api/Users/SearchUser?FirstName={firstName}";
  static const String update_user_details = "/api/Users/UpdateUserDetails";
  static const String delete_account = "/api/Users/DeleteAccount";
  static const String change_password = "/api/Users/ChangePassword";
  static const String get_user_by_id = "/api/Users/GetUserById?Id={id}";




}