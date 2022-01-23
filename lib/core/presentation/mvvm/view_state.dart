import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'viewmodel.dart';

/// An abstract class to inject a [ViewModel] into a page/widget
/// and dispose the [ViewModel] when the widget is disposed.
///
/// IMPORTANT: [ViewState] should only be used by the feature's main page.
/// If used in an internal widget, may cause unexpected errors.
abstract class ViewState<S extends StatefulWidget, M extends ViewModel>
    extends ModularState<S, M> {
  /// Get the injected [ViewModel]
  M get viewModel => super.controller;
}
