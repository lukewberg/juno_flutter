import 'dart:html';

abstract class API {

  void getConfig(Url magicLink);

  void getRoutes();

  void getContent();

  void getSession();

  void queryContent();
  
}