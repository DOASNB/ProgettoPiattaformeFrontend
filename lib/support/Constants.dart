
class Constants {

  //rappresenta indirizzo del server
  static const String ADDRESS_STORE_SERVER = "localhost:8081";

  //richieste al server
  static const String REQUEST_ADD_USER = "/users";//percorso per effettuare richiesta di aggiunta di un utente
  static const String REQUEST_SEARCH_PRODUCTS="/products/search/by_name";
  static const String REQUEST_PRODUCTS="/products";
  static const String REQUEST_SEARCH_USER="/users/search";
  static const String REQUEST_ADD_PURCHASE="/purchases";
  static const String REQUEST_USER_ORDERS="/purchases/user";
  static const String REQUEST_ALL_USERS_ORDERS="/purchases";
  static const String REQUEST_ALL_USERS_REGISTERED="/users";
  static const String REQUEST_ADD_PRODUCT="/products";
  static const String REQUEST_GET_PRODUCT_REVIEWS="reviews/view/product";
  static const String REQUEST_ADD_PRODUCT_REVIEW="/reviews";
  static const String REQUEST_ADD_FAVORITE="/favorites";
  static const String REQUEST_GET_WISHLIST="/favorites/view/favorite";
  static const String REQUEST_DELETE_FAVORITE="/favorites/favorite";
  static const String REQUEST_UPDATE_PRODUCT="/products/edit";










  static const String KEYCLOAK_TOKEN_URL = "http://localhost:8080/realms/SpringBootKeycloak/protocol/openid-connect/token";
  static const String CLIENT_ID = '';



}

