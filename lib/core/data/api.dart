class Api {
  /// Base API Endpoint
  static const _baseServer = "https://api.siak.ummi.ac.id/v2";
  static const _baseLogin = "https://api.siak.ummi.ac.id/v2/verifikasi-kredensial";
  static const String token = "token";
  static const _baseMockServer = "https://63cb614e5c6f2e1d84b570d5.mockapi.io";
  /// * -------------------
  ///  * SIAK Endpoint
  ///  * ------------------
  ///  * In this field will exists
  ///  * some route about Siak
  /// */
  ///
  String login = "$_baseLogin/mahasiswa";
  String krsMahasiswa = "$_baseServer/mahasiswa/:id/kontrak-kuliah";

  /// * -------------------
  /// * Mock Endpoint
  /// * ------------------
  /// * In this field will exists
  ///  * some route about Mock api
  String news = "$_baseMockServer/news";
  String infoDpa = "$_baseMockServer/info_dpa";

}

enum FetchResultState { Loading, Searching, NoData, HasData, Failure }

enum PostResultState { Idle, Loading, Success, Failure }

enum ResultState { Loading, NoData, HasData, Error }
