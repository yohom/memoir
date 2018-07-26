import 'dart:async';

import 'package:memoir/framework/utils/log.dart';
import 'package:rxdart/rxdart.dart';

typedef void Listener<T>(T data);
typedef bool Equal<T>(T data1, T data2);

class Event<T> {
  T latest;
  Observable<T> stream;

  ///
  /// 判断新值与旧值是否相同
  ///
  Equal test;

  ///
  /// 是否只有不同的值(由[test]定义不同, 如果[test]为空, 那么直接用[==]判断)才发射新数据
  ///
  bool isDistinct;

  ///
  /// 初始值, 传递给内部的[_subject]
  ///
  T seedValue;

  ///
  /// 是否接受null
  ///
  bool acceptNull;

  Subject<T> _subject;

  Event({
    this.test,
    this.isDistinct = false,
    this.seedValue,
    this.acceptNull = false,

    ///
    /// 是否同步发射数据, 传递给内部的[_subject]
    ///
    bool sync = true,

    ///
    /// 是否使用BehaviorSubject, 如果使用, 那么Event内部的[_subject]会保存最近一次的值
    /// 默认为false
    ///
    bool isBehavior = false,
  }) {
    _subject = isBehavior
        ? BehaviorSubject<T>(seedValue: seedValue, sync: sync)
        : PublishSubject<T>(sync: sync);
    stream = _subject.stream;

    latest = seedValue;

    _subject.listen((data) => latest = data);
  }

  void add(T data) {
    L.d('Event接收到${data.runtimeType}数据: $data');

    // 如果需要distinct的话, 就判断是否相同; 如果不需要distinct, 直接发射数据
    if (isDistinct) {
      // 如果是不一样的数据, 才发射新的通知,防止TabBar的addListener那种
      // 不停地发送通知(但是值又是一样)的情况
      if (test != null) {
        if (!test(latest, data)) {
          _subject.add(data);
        }
      } else {
        if (data != latest) {
          _subject.add(data);
        }
      }
    } else {
      _subject.add(data);
    }
  }

  Observable<T> addStream(Stream<T> source, {bool cancelOnError: true}) {
    return Observable<T>(
      _subject..addStream(source, cancelOnError: cancelOnError),
    );
  }

  AsObservableFuture<T> addFuture(Future<T> source,
      {bool cancelOnError: true}) {
    return Observable
        .fromFuture((_subject
              ..addStream(source.asStream(), cancelOnError: cancelOnError))
            .first)
        .first;
  }

  void listen(
    Listener<T> listener, {
    Function onError,
    void onDone(),
    bool cancelOnError,
  }) {
    stream.listen(
      (data) {
        if (data == null && acceptNull) {
          listener(data);
        } else if (data != null) {
          listener(data);
        }
      },
      onError: onError,
      onDone: onDone,
      cancelOnError: cancelOnError,
    );
  }

  Observable<S> map<S>(S convert(T event)) {
    return _subject.map(convert);
  }

  Observable<T> where(bool test(T event)) {
    return _subject.where(test);
  }

  void clear() {
    latest = seedValue;
    _subject.add(seedValue);
  }

  void close() {
    _subject.close();
  }
}
