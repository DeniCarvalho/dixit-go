import '../../core.dart';
import 'mvvm.dart';

/// A mixin to inject a [ViewModel] into a page/widget
mixin View<VM extends ViewModel> {
  /// Get the injected [ViewModel]
  VM get viewModel => DM.get<VM>();
}
