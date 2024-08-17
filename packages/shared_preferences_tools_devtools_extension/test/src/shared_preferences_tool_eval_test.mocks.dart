// Mocks generated by Mockito 5.4.4 from annotations
// in shared_preferences_tool/test/src/shared_preferences_tool_eval_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i6;
import 'dart:ui' as _i8;

import 'package:devtools_app_shared/src/service/eval_on_dart_library.dart'
    as _i4;
import 'package:devtools_app_shared/src/service/service_manager.dart' as _i3;
import 'package:flutter/foundation.dart' as _i7;
import 'package:flutter/widgets.dart' as _i9;
import 'package:mockito/mockito.dart' as _i2;
import 'package:mockito/src/dummies.dart' as _i5;
import 'package:vm_service/vm_service.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeServiceManager_0<T extends _i1.VmService> extends _i2.SmartFake
    implements _i3.ServiceManager<T> {
  _FakeServiceManager_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeVmService_1 extends _i2.SmartFake implements _i1.VmService {
  _FakeVmService_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeClass_2 extends _i2.SmartFake implements _i1.Class {
  _FakeClass_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInstance_3 extends _i2.SmartFake implements _i1.Instance {
  _FakeInstance_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeInstanceRef_4 extends _i2.SmartFake implements _i1.InstanceRef {
  _FakeInstanceRef_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [EvalOnDartLibrary].
///
/// See the documentation for Mockito's code generation for more information.
class MockEvalOnDartLibrary extends _i2.Mock implements _i4.EvalOnDartLibrary {
  @override
  bool get oneRequestAtATime => (super.noSuchMethod(
        Invocation.getter(#oneRequestAtATime),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  bool get disableBreakpoints => (super.noSuchMethod(
        Invocation.getter(#disableBreakpoints),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  _i3.ServiceManager<_i1.VmService> get serviceManager => (super.noSuchMethod(
        Invocation.getter(#serviceManager),
        returnValue: _FakeServiceManager_0<_i1.VmService>(
          this,
          Invocation.getter(#serviceManager),
        ),
        returnValueForMissingStub: _FakeServiceManager_0<_i1.VmService>(
          this,
          Invocation.getter(#serviceManager),
        ),
      ) as _i3.ServiceManager<_i1.VmService>);

  @override
  String get libraryName => (super.noSuchMethod(
        Invocation.getter(#libraryName),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#libraryName),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#libraryName),
        ),
      ) as String);

  @override
  _i1.VmService get service => (super.noSuchMethod(
        Invocation.getter(#service),
        returnValue: _FakeVmService_1(
          this,
          Invocation.getter(#service),
        ),
        returnValueForMissingStub: _FakeVmService_1(
          this,
          Invocation.getter(#service),
        ),
      ) as _i1.VmService);

  @override
  set allPendingRequestsDone(_i6.Completer<void>? _allPendingRequestsDone) =>
      super.noSuchMethod(
        Invocation.setter(
          #allPendingRequestsDone,
          _allPendingRequestsDone,
        ),
        returnValueForMissingStub: null,
      );

  @override
  bool get disposed => (super.noSuchMethod(
        Invocation.getter(#disposed),
        returnValue: false,
        returnValueForMissingStub: false,
      ) as bool);

  @override
  List<_i7.Listenable> get listenables => (super.noSuchMethod(
        Invocation.getter(#listenables),
        returnValue: <_i7.Listenable>[],
        returnValueForMissingStub: <_i7.Listenable>[],
      ) as List<_i7.Listenable>);

  @override
  List<void Function()> get listeners => (super.noSuchMethod(
        Invocation.getter(#listeners),
        returnValue: <void Function()>[],
        returnValueForMissingStub: <void Function()>[],
      ) as List<void Function()>);

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i6.Future<_i1.InstanceRef?> eval(
    String? expression, {
    required _i4.Disposable? isAlive,
    Map<String, String>? scope,
    bool? shouldLogError = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #eval,
          [expression],
          {
            #isAlive: isAlive,
            #scope: scope,
            #shouldLogError: shouldLogError,
          },
        ),
        returnValue: _i6.Future<_i1.InstanceRef?>.value(),
        returnValueForMissingStub: _i6.Future<_i1.InstanceRef?>.value(),
      ) as _i6.Future<_i1.InstanceRef?>);

  @override
  _i6.Future<_i1.InstanceRef?> invoke(
    _i1.InstanceRef? instanceRef,
    String? name,
    List<String>? argRefs, {
    required _i4.Disposable? isAlive,
    bool? shouldLogError = true,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #invoke,
          [
            instanceRef,
            name,
            argRefs,
          ],
          {
            #isAlive: isAlive,
            #shouldLogError: shouldLogError,
          },
        ),
        returnValue: _i6.Future<_i1.InstanceRef?>.value(),
        returnValueForMissingStub: _i6.Future<_i1.InstanceRef?>.value(),
      ) as _i6.Future<_i1.InstanceRef?>);

  @override
  _i6.Future<_i1.Class?> getClass(
    _i1.ClassRef? instance,
    _i4.Disposable? isAlive,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getClass,
          [
            instance,
            isAlive,
          ],
        ),
        returnValue: _i6.Future<_i1.Class?>.value(),
        returnValueForMissingStub: _i6.Future<_i1.Class?>.value(),
      ) as _i6.Future<_i1.Class?>);

  @override
  _i6.Future<_i1.Class> safeGetClass(
    _i1.ClassRef? instance,
    _i4.Disposable? isAlive,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #safeGetClass,
          [
            instance,
            isAlive,
          ],
        ),
        returnValue: _i6.Future<_i1.Class>.value(_FakeClass_2(
          this,
          Invocation.method(
            #safeGetClass,
            [
              instance,
              isAlive,
            ],
          ),
        )),
        returnValueForMissingStub: _i6.Future<_i1.Class>.value(_FakeClass_2(
          this,
          Invocation.method(
            #safeGetClass,
            [
              instance,
              isAlive,
            ],
          ),
        )),
      ) as _i6.Future<_i1.Class>);

  @override
  _i6.Future<_i1.Func?> getFunc(
    _i1.FuncRef? instance,
    _i4.Disposable? isAlive,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getFunc,
          [
            instance,
            isAlive,
          ],
        ),
        returnValue: _i6.Future<_i1.Func?>.value(),
        returnValueForMissingStub: _i6.Future<_i1.Func?>.value(),
      ) as _i6.Future<_i1.Func?>);

  @override
  _i6.Future<_i1.Instance?> getInstance(
    _i6.FutureOr<_i1.InstanceRef>? instanceRefFuture,
    _i4.Disposable? isAlive,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #getInstance,
          [
            instanceRefFuture,
            isAlive,
          ],
        ),
        returnValue: _i6.Future<_i1.Instance?>.value(),
        returnValueForMissingStub: _i6.Future<_i1.Instance?>.value(),
      ) as _i6.Future<_i1.Instance?>);

  @override
  _i6.Future<_i1.Instance> safeGetInstance(
    _i6.FutureOr<_i1.InstanceRef>? instanceRefFuture,
    _i4.Disposable? isAlive,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #safeGetInstance,
          [
            instanceRefFuture,
            isAlive,
          ],
        ),
        returnValue: _i6.Future<_i1.Instance>.value(_FakeInstance_3(
          this,
          Invocation.method(
            #safeGetInstance,
            [
              instanceRefFuture,
              isAlive,
            ],
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i1.Instance>.value(_FakeInstance_3(
          this,
          Invocation.method(
            #safeGetInstance,
            [
              instanceRefFuture,
              isAlive,
            ],
          ),
        )),
      ) as _i6.Future<_i1.Instance>);

  @override
  _i6.Future<int> getHashCode(
    _i1.InstanceRef? instance, {
    required _i4.Disposable? isAlive,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getHashCode,
          [instance],
          {#isAlive: isAlive},
        ),
        returnValue: _i6.Future<int>.value(0),
        returnValueForMissingStub: _i6.Future<int>.value(0),
      ) as _i6.Future<int>);

  @override
  _i6.Future<_i1.Instance> evalInstance(
    String? expression, {
    required _i4.Disposable? isAlive,
    Map<String, String>? scope,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #evalInstance,
          [expression],
          {
            #isAlive: isAlive,
            #scope: scope,
          },
        ),
        returnValue: _i6.Future<_i1.Instance>.value(_FakeInstance_3(
          this,
          Invocation.method(
            #evalInstance,
            [expression],
            {
              #isAlive: isAlive,
              #scope: scope,
            },
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i1.Instance>.value(_FakeInstance_3(
          this,
          Invocation.method(
            #evalInstance,
            [expression],
            {
              #isAlive: isAlive,
              #scope: scope,
            },
          ),
        )),
      ) as _i6.Future<_i1.Instance>);

  @override
  _i6.Future<_i1.InstanceRef?> asyncEval(
    String? expression, {
    required _i4.Disposable? isAlive,
    Map<String, String>? scope,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #asyncEval,
          [expression],
          {
            #isAlive: isAlive,
            #scope: scope,
          },
        ),
        returnValue: _i6.Future<_i1.InstanceRef?>.value(),
        returnValueForMissingStub: _i6.Future<_i1.InstanceRef?>.value(),
      ) as _i6.Future<_i1.InstanceRef?>);

  @override
  _i6.Future<_i1.InstanceRef> safeEval(
    String? expression, {
    required _i4.Disposable? isAlive,
    Map<String, String>? scope,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #safeEval,
          [expression],
          {
            #isAlive: isAlive,
            #scope: scope,
          },
        ),
        returnValue: _i6.Future<_i1.InstanceRef>.value(_FakeInstanceRef_4(
          this,
          Invocation.method(
            #safeEval,
            [expression],
            {
              #isAlive: isAlive,
              #scope: scope,
            },
          ),
        )),
        returnValueForMissingStub:
            _i6.Future<_i1.InstanceRef>.value(_FakeInstanceRef_4(
          this,
          Invocation.method(
            #safeEval,
            [expression],
            {
              #isAlive: isAlive,
              #scope: scope,
            },
          ),
        )),
      ) as _i6.Future<_i1.InstanceRef>);

  @override
  _i6.Future<T?> addRequest<T>(
    _i4.Disposable? isAlive,
    _i6.Future<T?> Function()? request,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #addRequest,
          [
            isAlive,
            request,
          ],
        ),
        returnValue: _i6.Future<T?>.value(),
        returnValueForMissingStub: _i6.Future<T?>.value(),
      ) as _i6.Future<T?>);

  @override
  _i6.Future<T?> getObjHelper<T extends _i1.Obj>(
    _i1.ObjRef? instance,
    _i4.Disposable? isAlive, {
    int? offset,
    int? count,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #getObjHelper,
          [
            instance,
            isAlive,
          ],
          {
            #offset: offset,
            #count: count,
          },
        ),
        returnValue: _i6.Future<T?>.value(),
        returnValueForMissingStub: _i6.Future<T?>.value(),
      ) as _i6.Future<T?>);

  @override
  void addAutoDisposeListener(
    _i7.Listenable? listenable, [
    _i8.VoidCallback? listener,
    String? id,
  ]) =>
      super.noSuchMethod(
        Invocation.method(
          #addAutoDisposeListener,
          [
            listenable,
            listener,
            id,
          ],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void autoDisposeStreamSubscription(
          _i6.StreamSubscription<dynamic>? subscription) =>
      super.noSuchMethod(
        Invocation.method(
          #autoDisposeStreamSubscription,
          [subscription],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void autoDisposeFocusNode(_i9.FocusNode? node) => super.noSuchMethod(
        Invocation.method(
          #autoDisposeFocusNode,
          [node],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void cancelStreamSubscriptions() => super.noSuchMethod(
        Invocation.method(
          #cancelStreamSubscriptions,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void cancelListeners({List<String>? excludeIds = const []}) =>
      super.noSuchMethod(
        Invocation.method(
          #cancelListeners,
          [],
          {#excludeIds: excludeIds},
        ),
        returnValueForMissingStub: null,
      );

  @override
  void cancelListener(_i8.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #cancelListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void cancelFocusNodes() => super.noSuchMethod(
        Invocation.method(
          #cancelFocusNodes,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void callOnceWhenReady<T>({
    required _i8.VoidCallback? callback,
    required _i7.ValueListenable<T>? trigger,
    required bool Function(T)? readyWhen,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #callOnceWhenReady,
          [],
          {
            #callback: callback,
            #trigger: trigger,
            #readyWhen: readyWhen,
          },
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [InstanceRef].
///
/// See the documentation for Mockito's code generation for more information.
class MockInstanceRef extends _i2.Mock implements _i1.InstanceRef {
  @override
  set kind(String? _kind) => super.noSuchMethod(
        Invocation.setter(
          #kind,
          _kind,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set identityHashCode(int? _identityHashCode) => super.noSuchMethod(
        Invocation.setter(
          #identityHashCode,
          _identityHashCode,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set classRef(_i1.ClassRef? _classRef) => super.noSuchMethod(
        Invocation.setter(
          #classRef,
          _classRef,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set valueAsString(String? _valueAsString) => super.noSuchMethod(
        Invocation.setter(
          #valueAsString,
          _valueAsString,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set valueAsStringIsTruncated(bool? _valueAsStringIsTruncated) =>
      super.noSuchMethod(
        Invocation.setter(
          #valueAsStringIsTruncated,
          _valueAsStringIsTruncated,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set length(int? _length) => super.noSuchMethod(
        Invocation.setter(
          #length,
          _length,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set name(String? _name) => super.noSuchMethod(
        Invocation.setter(
          #name,
          _name,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set typeClass(_i1.ClassRef? _typeClass) => super.noSuchMethod(
        Invocation.setter(
          #typeClass,
          _typeClass,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set parameterizedClass(_i1.ClassRef? _parameterizedClass) =>
      super.noSuchMethod(
        Invocation.setter(
          #parameterizedClass,
          _parameterizedClass,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set returnType(_i1.InstanceRef? _returnType) => super.noSuchMethod(
        Invocation.setter(
          #returnType,
          _returnType,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set parameters(List<_i1.Parameter>? _parameters) => super.noSuchMethod(
        Invocation.setter(
          #parameters,
          _parameters,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set typeParameters(List<_i1.InstanceRef>? _typeParameters) =>
      super.noSuchMethod(
        Invocation.setter(
          #typeParameters,
          _typeParameters,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set pattern(_i1.InstanceRef? _pattern) => super.noSuchMethod(
        Invocation.setter(
          #pattern,
          _pattern,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set closureFunction(_i1.FuncRef? _closureFunction) => super.noSuchMethod(
        Invocation.setter(
          #closureFunction,
          _closureFunction,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set closureContext(_i1.ContextRef? _closureContext) => super.noSuchMethod(
        Invocation.setter(
          #closureContext,
          _closureContext,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set closureReceiver(_i1.InstanceRef? _closureReceiver) => super.noSuchMethod(
        Invocation.setter(
          #closureReceiver,
          _closureReceiver,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set portId(int? _portId) => super.noSuchMethod(
        Invocation.setter(
          #portId,
          _portId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set allocationLocation(_i1.InstanceRef? _allocationLocation) =>
      super.noSuchMethod(
        Invocation.setter(
          #allocationLocation,
          _allocationLocation,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set debugName(String? _debugName) => super.noSuchMethod(
        Invocation.setter(
          #debugName,
          _debugName,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set label(String? _label) => super.noSuchMethod(
        Invocation.setter(
          #label,
          _label,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get type => (super.noSuchMethod(
        Invocation.getter(#type),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#type),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#type),
        ),
      ) as String);

  @override
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set fixedId(bool? _fixedId) => super.noSuchMethod(
        Invocation.setter(
          #fixedId,
          _fixedId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set json(Map<String, dynamic>? _json) => super.noSuchMethod(
        Invocation.setter(
          #json,
          _json,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}

/// A class which mocks [Instance].
///
/// See the documentation for Mockito's code generation for more information.
class MockInstance extends _i2.Mock implements _i1.Instance {
  @override
  set kind(String? _kind) => super.noSuchMethod(
        Invocation.setter(
          #kind,
          _kind,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set identityHashCode(int? _identityHashCode) => super.noSuchMethod(
        Invocation.setter(
          #identityHashCode,
          _identityHashCode,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set classRef(_i1.ClassRef? _classRef) => super.noSuchMethod(
        Invocation.setter(
          #classRef,
          _classRef,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set valueAsString(String? _valueAsString) => super.noSuchMethod(
        Invocation.setter(
          #valueAsString,
          _valueAsString,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set valueAsStringIsTruncated(bool? _valueAsStringIsTruncated) =>
      super.noSuchMethod(
        Invocation.setter(
          #valueAsStringIsTruncated,
          _valueAsStringIsTruncated,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set length(int? _length) => super.noSuchMethod(
        Invocation.setter(
          #length,
          _length,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set offset(int? _offset) => super.noSuchMethod(
        Invocation.setter(
          #offset,
          _offset,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set count(int? _count) => super.noSuchMethod(
        Invocation.setter(
          #count,
          _count,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set name(String? _name) => super.noSuchMethod(
        Invocation.setter(
          #name,
          _name,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set typeClass(_i1.ClassRef? _typeClass) => super.noSuchMethod(
        Invocation.setter(
          #typeClass,
          _typeClass,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set parameterizedClass(_i1.ClassRef? _parameterizedClass) =>
      super.noSuchMethod(
        Invocation.setter(
          #parameterizedClass,
          _parameterizedClass,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set returnType(_i1.InstanceRef? _returnType) => super.noSuchMethod(
        Invocation.setter(
          #returnType,
          _returnType,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set parameters(List<_i1.Parameter>? _parameters) => super.noSuchMethod(
        Invocation.setter(
          #parameters,
          _parameters,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set typeParameters(List<_i1.InstanceRef>? _typeParameters) =>
      super.noSuchMethod(
        Invocation.setter(
          #typeParameters,
          _typeParameters,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set fields(List<_i1.BoundField>? _fields) => super.noSuchMethod(
        Invocation.setter(
          #fields,
          _fields,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set elements(List<dynamic>? _elements) => super.noSuchMethod(
        Invocation.setter(
          #elements,
          _elements,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set associations(List<_i1.MapAssociation>? _associations) =>
      super.noSuchMethod(
        Invocation.setter(
          #associations,
          _associations,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set bytes(String? _bytes) => super.noSuchMethod(
        Invocation.setter(
          #bytes,
          _bytes,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set mirrorReferent(_i1.ObjRef? _mirrorReferent) => super.noSuchMethod(
        Invocation.setter(
          #mirrorReferent,
          _mirrorReferent,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set pattern(_i1.InstanceRef? _pattern) => super.noSuchMethod(
        Invocation.setter(
          #pattern,
          _pattern,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set closureFunction(_i1.FuncRef? _closureFunction) => super.noSuchMethod(
        Invocation.setter(
          #closureFunction,
          _closureFunction,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set closureContext(_i1.ContextRef? _closureContext) => super.noSuchMethod(
        Invocation.setter(
          #closureContext,
          _closureContext,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set closureReceiver(_i1.InstanceRef? _closureReceiver) => super.noSuchMethod(
        Invocation.setter(
          #closureReceiver,
          _closureReceiver,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set isCaseSensitive(bool? _isCaseSensitive) => super.noSuchMethod(
        Invocation.setter(
          #isCaseSensitive,
          _isCaseSensitive,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set isMultiLine(bool? _isMultiLine) => super.noSuchMethod(
        Invocation.setter(
          #isMultiLine,
          _isMultiLine,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set propertyKey(_i1.ObjRef? _propertyKey) => super.noSuchMethod(
        Invocation.setter(
          #propertyKey,
          _propertyKey,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set propertyValue(_i1.ObjRef? _propertyValue) => super.noSuchMethod(
        Invocation.setter(
          #propertyValue,
          _propertyValue,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set target(_i1.ObjRef? _target) => super.noSuchMethod(
        Invocation.setter(
          #target,
          _target,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set typeArguments(_i1.TypeArgumentsRef? _typeArguments) => super.noSuchMethod(
        Invocation.setter(
          #typeArguments,
          _typeArguments,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set parameterIndex(int? _parameterIndex) => super.noSuchMethod(
        Invocation.setter(
          #parameterIndex,
          _parameterIndex,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set targetType(_i1.InstanceRef? _targetType) => super.noSuchMethod(
        Invocation.setter(
          #targetType,
          _targetType,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set bound(_i1.InstanceRef? _bound) => super.noSuchMethod(
        Invocation.setter(
          #bound,
          _bound,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set portId(int? _portId) => super.noSuchMethod(
        Invocation.setter(
          #portId,
          _portId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set allocationLocation(_i1.InstanceRef? _allocationLocation) =>
      super.noSuchMethod(
        Invocation.setter(
          #allocationLocation,
          _allocationLocation,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set debugName(String? _debugName) => super.noSuchMethod(
        Invocation.setter(
          #debugName,
          _debugName,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set label(String? _label) => super.noSuchMethod(
        Invocation.setter(
          #label,
          _label,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set callback(_i1.InstanceRef? _callback) => super.noSuchMethod(
        Invocation.setter(
          #callback,
          _callback,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set callbackAddress(_i1.InstanceRef? _callbackAddress) => super.noSuchMethod(
        Invocation.setter(
          #callbackAddress,
          _callbackAddress,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set allEntries(_i1.InstanceRef? _allEntries) => super.noSuchMethod(
        Invocation.setter(
          #allEntries,
          _allEntries,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set value(_i1.InstanceRef? _value) => super.noSuchMethod(
        Invocation.setter(
          #value,
          _value,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set token(_i1.InstanceRef? _token) => super.noSuchMethod(
        Invocation.setter(
          #token,
          _token,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set detach(_i1.InstanceRef? _detach) => super.noSuchMethod(
        Invocation.setter(
          #detach,
          _detach,
        ),
        returnValueForMissingStub: null,
      );

  @override
  String get type => (super.noSuchMethod(
        Invocation.getter(#type),
        returnValue: _i5.dummyValue<String>(
          this,
          Invocation.getter(#type),
        ),
        returnValueForMissingStub: _i5.dummyValue<String>(
          this,
          Invocation.getter(#type),
        ),
      ) as String);

  @override
  set id(String? _id) => super.noSuchMethod(
        Invocation.setter(
          #id,
          _id,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set fixedId(bool? _fixedId) => super.noSuchMethod(
        Invocation.setter(
          #fixedId,
          _fixedId,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set size(int? _size) => super.noSuchMethod(
        Invocation.setter(
          #size,
          _size,
        ),
        returnValueForMissingStub: null,
      );

  @override
  set json(Map<String, dynamic>? _json) => super.noSuchMethod(
        Invocation.setter(
          #json,
          _json,
        ),
        returnValueForMissingStub: null,
      );

  @override
  Map<String, dynamic> toJson() => (super.noSuchMethod(
        Invocation.method(
          #toJson,
          [],
        ),
        returnValue: <String, dynamic>{},
        returnValueForMissingStub: <String, dynamic>{},
      ) as Map<String, dynamic>);
}