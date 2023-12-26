class Api {
  static const _host = 'http://192.168.43.60/api_komik';
  static const _hostUser = '$_host/sambung';
  static const _hostInfinite = '$_host/infinite_mage';

// User
  static const checkEmail = '$_hostUser/check_email.php';
  static const login = '$_hostUser/getData.php';
  static const register = '$_hostUser/insertData.php';
  static const chap1 = '$_hostInfinite/getData.php';
}
