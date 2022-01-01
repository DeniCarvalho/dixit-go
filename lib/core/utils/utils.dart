// ignore_for_file: non_constant_identifier_names

import 'package:dixit_go/core/domain/domain.dart';
import 'package:dixit_go/core/infrastructure/infrastructure.dart';

export 'extensions/extensions.dart';

///
/// Provides a static access to a singleton that implements [Navigation]
///
final Navigation Nav = ModularNavigation.i();

///
/// Provides a static access to a singleton that implements [DependencyManager]
///
final DependencyManager DM = ModularDependencyManager.i();
