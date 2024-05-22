import 'dart:ui';

class Constants {

  //rappresenta indirizzo del server
  static final String ADDRESS_STORE_SERVER = "localhost:8081";

  //richieste al server
  static final String REQUEST_ADD_USER = "/users";//percorso per effettuare richiesta di aggiunta di un utente
  static final String REQUEST_SEARCH_PRODUCTS="/products/search/by_name";
  static final String REQUEST_PRODUCTS="/products";
  static final String REQUEST_SEARCH_USER="/users/search";
  static final String REQUEST_ADD_PURCHASE="/purchases";
  static final String REQUEST_USER_ORDERS="/purchases/user";
  static final String REQUEST_ALL_USERS_ORDERS="/purchases";
  static final String REQUEST_ALL_USERS_REGISTERED="/users";
  static final String REQUEST_ADD_PRODUCT="/products";
  static final String REQUEST_GET_PRODUCT_REVIEWS="reviews/view/product";
  static final String REQUEST_ADD_PRODUCT_REVIEW="/reviews";
  static final String REQUEST_ADD_FAVORITE="/favorites";
  static final String REQUEST_GET_WISHLIST="/favorites/view/favorite";
  static final String REQUEST_DELETE_FAVORITE="/favorites/favorite";
  static final String REQUEST_UPDATE_PRODUCT="/products/edit";










  static final String KEYCLOAK_TOKEN_URL = "http://localhost:8080/realms/SpringBootKeycloak/protocol/openid-connect/token";
  static final String CLIENT_ID = '';



}

