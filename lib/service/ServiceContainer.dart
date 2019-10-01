class ServiceContainer {
  static final Map<Type, Object Function()> _container = {};
  static bind<T>(T Function() bind) {
    _container[T] = bind;
  }

  static singleton<T>(T singleton) {
    _container[T] = () => singleton;
  }

  static T make<T>() => _container[T]();
}
