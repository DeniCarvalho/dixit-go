class AppImages {
  static String _avatar1 = "assets/images/avatar/lion.png";
  static String _avatar2 = "assets/images/avatar/dog.png";
  static String _avatar3 = "assets/images/avatar/cat.png";
  static String _avatar4 = "assets/images/avatar/owl.png";
  static String _avatar5 = "assets/images/avatar/fox.png";
  static String _avatar6 = "assets/images/avatar/monkey.png";

  static String get logo => "assets/images/logo.png";
  static String get bgHome => "assets/images/bg.jpeg";
  static String get bgHomeBlur => "assets/images/bg_blur.png";
  static String get bgRepeat => "assets/images/bg-repeat.png";
  static String get avatar1 => _avatar1;
  static String get avatar2 => _avatar2;
  static String get avatar3 => _avatar3;
  static String get avatar4 => _avatar4;
  static String get avatar5 => _avatar5;
  static String get avatar6 => _avatar6;

  String getAvatar(String name) {
    switch (name) {
      case 'avatar1':
        return _avatar1;
      case 'avatar2':
        return _avatar2;
      case 'avatar3':
        return _avatar3;
      case 'avatar4':
        return _avatar4;
      case 'avatar5':
        return _avatar5;
      case 'avatar6':
        return _avatar6;
      default:
        return _avatar1;
    }
  }
}
