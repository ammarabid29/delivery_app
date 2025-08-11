class ApiEndPoints {
  /// BaseUrl

  /*---------------------------Production-----------------------------------------*/

  /*---------------------------Development-----------------------------------------*/

  /*---------------------------NgRok-----------------------------------------*/

  static final String _baseUrl = 'http://152.53.82.172:4000/api/v1/';

  /// Endpoints

  static final String login = "${_baseUrl}users/login";
  static final String getCurrentOrders =
      "${_baseUrl}delivery-riders/current-orders";
  static final String getOnHoldOrders =
      "${_baseUrl}delivery-riders/on-hold-orders";
}
