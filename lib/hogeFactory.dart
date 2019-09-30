abstract class Hoge{
  static Hoge _instance;
  static regist(Hoge hoge) => _instance = hoge;
    
  factory Hoge(){
    if(_instance == null){
      throw NullThrownError();
    }
    return _instance;
  }
  String getTitle();
}
