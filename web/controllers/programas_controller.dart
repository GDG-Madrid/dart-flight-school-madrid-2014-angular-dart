library programas_controller;

import 'dart:async';
import 'package:angular/angular.dart';

@NgController(
  selector: '[programas-controller]',
  publishAs: 'programas'
)

class ProgramasController {
  
  var programasList;
  String headText;
    
  String _query_url_pre = "http://www.rtve.es/api/cadenas/";
  String _query_url_post = "/programas.json";
  String _get_url = "/api/cadenas/:cadenaId.json";

  Http _http;
  
  ProgramasController(Http this._http, RouteProvider routerProvider) {
    headText = "Cadenas RNE -> Programas";
    
    var cadenaId = routerProvider.parameters["cadenaId"];
    
    _loadProgramas(cadenaId);
  }
  
  Future _loadProgramas(String cadenaId) {
      return _http.get(_query_url_pre + cadenaId + _query_url_post)
          .then((HttpResponse response) {
            programasList = response.data['page']['items'];
      });
  }

}
