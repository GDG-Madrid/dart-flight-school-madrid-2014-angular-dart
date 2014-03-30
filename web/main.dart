import 'package:di/di.dart';
import 'package:angular/angular.dart';
import 'package:angular/playback/playback_http.dart';
import 'controllers/cadenas_controller.dart';
import 'controllers/programas_controller.dart';
import 'controllers/audios_controller.dart';
import 'routers/rne_router.dart';

import 'dart:html';

import 'initializer-dev.dart' as init; // Use in dev.


// Everything in the 'todo' library should be preserved by MirrorsUsed.
// @MirrorsUsed(
//     targets: const ['todo'],
///    override: '*')
/// import 'dart:mirrors';


class RneAppModule extends Module {
  RneAppModule() {
    type(CadenasController);
    type(ProgramasController);
    type(AudiosController);
    type(PlaybackHttpBackendConfig);
    value(RouteInitializerFn, rneRouteInitializer);
    factory(NgRoutingUsePushState,
            (_) => new NgRoutingUsePushState.value(false));
    
    init.createParser(this);
  }
}

main() {
  print(window.location.search);

  ngBootstrap(module: new RneAppModule(), injectorFactory: init.createInjector);  
}
