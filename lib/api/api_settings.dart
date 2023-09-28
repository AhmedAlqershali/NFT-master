class ApiSettings {
  static const String _baseUrl = "https://storesuadia-001-site1.etempurl.com";

  //Auth
  static const String login = "${_baseUrl}/api/Auth/Login";
  static const String register = "${_baseUrl}/api/Users/register";
  static const String logout = "${_baseUrl}/api/Auth/logout";
  //Collections
  static const String get_collections = "${_baseUrl}/api/Collections/GetAll?Search={search}";
  static const String create_collections = "${_baseUrl}/api/Collections/Create";
  static const String details_collections = "${_baseUrl}/api/Collections/Details?id={id}";
  static const String delete_collections = "${_baseUrl}/api/Collections/Delete?id={id}";
  //Favorites
  static const String add_favorite_product = "${_baseUrl}/api/Favorites/AddFavoriteProduct";
  static const String get_favorite_products = "${_baseUrl}/api/Favorites/GetFavoriteProducts";
  //Follows
  static const String follow = "${_baseUrl}/api/Follows/FollowUser";
  static const String unfollow = "${_baseUrl}/api/Follows/UnfollowUser";
  //Notifications
  static const String get_notifications = "${_baseUrl}/api/Notifications/GetNotifications";
  //Product
  static const String get_all_products = "${_baseUrl}/api/Products/GetAllProducts";
  static const String get_product_id = "${_baseUrl}/api/Products/GetProduct?Id={id}";
  static const String upload_product = "${_baseUrl}/api/Products/UploadProduct";
  static const String delete_product = "${_baseUrl}/api/Products/DeleteProduct?id={id}";
  static const String purchase_product = "${_baseUrl}/api/Products/PurchaseProduct";
  //Users
  static const String get_all_users = "${_baseUrl}/api/Users/Users";
  static const String get_top_selling_users = "${_baseUrl}/api/Users/GetTopSellingUsers?count={count}";
  static const String search_user = "${_baseUrl}/api/Users/SearchUser?FirstName={firstName}";
  static const String update_user_details = "${_baseUrl}/api/Users/UpdateUserDetails";
  static const String delete_account = "${_baseUrl}/api/Users/DeleteAccount";
  static const String change_password = "${_baseUrl}/api/Users/ChangePassword";
  static const String get_user_by_id = "${_baseUrl}/api/Users/GetUserById?Id={id}";




}