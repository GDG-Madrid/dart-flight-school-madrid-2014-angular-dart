library cadenas_controller;

import 'dart:async';
import 'package:angular/angular.dart';

@NgController(
  selector: '[cadenas-controller]',
  publishAs: 'cadenas'
)

class CadenasController {
  
  var cadenasList;
  String headText;
    
  String _query_url = "http://www.rtve.es/api/medios/851/cadenas.json";
  String _get_url = "/api/cadenas/:cadenaId.json";

  Http _http;
  
  CadenasController(Http this._http, RouteProvider routeProvider) {
    headText = "Cadenas RNE";
    
    _loadCadenas();
  }
  
  Future _loadCadenas() {
      return _http.get(_query_url)
          .then((HttpResponse response) {
            cadenasList = response.data['page']['items'];
      });
  }

}
