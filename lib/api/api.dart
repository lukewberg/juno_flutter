abstract class API {

  void authenticate(Uri magicLink);

  void getRoutes();

  void getContent();

  void getSession();

  void queryContent();

  void tokenLogin(Uri magicLink);

  void getNavigation();
}