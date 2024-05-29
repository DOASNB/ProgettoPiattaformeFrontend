library constants;


  //rappresenta indirizzo del server
const String ADDRESS_STORE_SERVER = "localhost:8081";

  //richieste al server
const String REQUEST_ADD_USER = "/users";
const String REQUEST_SEARCH_PRODUCTS="/products/search/by_name";
const String REQUEST_PRODUCTS="/products";
const String REQUEST_SEARCH_USER="/users/search";
const String REQUEST_ADD_PURCHASE="/purchases";
const String REQUEST_USER_ORDERS="/purchases/user";
 const String REQUEST_ALL_USERS_ORDERS="/purchases";
const String REQUEST_ALL_USERS_REGISTERED="/users";
const String REQUEST_ADD_PRODUCT="/products";
const String REQUEST_GET_PRODUCT_REVIEWS="reviews/view/product";
const String REQUEST_ADD_PRODUCT_REVIEW="/reviews";
const String REQUEST_ADD_FAVORITE="/favorites";
const String REQUEST_GET_WISHLIST="/favorites/view/favorite";
const String REQUEST_DELETE_FAVORITE="/favorites/favorite";
const String REQUEST_UPDATE_PRODUCT="/products/edit";
const String KEYCLOAK_TOKEN_URL = "localhost:8080/realms/SpringBootKeycloak/protocol/openid-connect/token";
const String CLIENT_ID = 'progetto1';


enum Category {DECORAZIONE,GIOCATTOLO,STRUMENTO}




