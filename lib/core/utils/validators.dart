class Validators {
  static String? notEmpty(String? v, {String msg = 'Required'}) =>
      (v == null || v.trim().isEmpty) ? msg : null;
}
