library rne_routing;

import 'package:angular/angular.dart';


void rneRouteInitializer(Router router, RouteViewFactory views) {
  views.configure({
    'cadena': ngRoute(
        defaultRoute: true,
        path: '/',
        view: 'views/cadenas.html'),
    'programas': ngRoute(
        path: '/programas/:cadenaId',
        view: 'views/programas.html'),
     'audios': ngRoute(
        path: '/audios/:programaId',
        view: 'views/audios.html')
  });
}