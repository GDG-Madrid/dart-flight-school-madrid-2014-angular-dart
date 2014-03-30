library audios_controller;

import 'dart:async';
import 'package:angular/angular.dart';

@NgController(
  selector: '[audios-controller]',
  publishAs: 'audios'
)

class AudiosController {
  
  var audiosList;
  String headText;
    
  String _query_url_pre = "http://www.rtve.es/api/programas/";
  String _query_url_post = "/audios.json";

  Http _http;
  
  AudiosController(Http this._http, RouteProvider routerProvider) {
    headText = "Cadenas RNE -> Programas -> Audios";
    
    var programaId = routerProvider.parameters["programaId"];
    
    _loadAudios(programaId);
  }
  
  Future _loadAudios(String programaId) {
      return _http.get(_query_url_pre + programaId + _query_url_post)
          .then((HttpResponse response) {
            audiosList = response.data['page']['items'];
      });
  }

}
