// This is a generated file - do not edit.
//
// Generated from packages.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_relative_imports

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class Engine extends $pb.GeneratedMessage {
  factory Engine({
    $core.int? gear,
    $core.String? velocity,
    $core.bool? on,
  }) {
    final result = create();
    if (gear != null) result.gear = gear;
    if (velocity != null) result.velocity = velocity;
    if (on != null) result.on = on;
    return result;
  }

  Engine._();

  factory Engine.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Engine.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Engine',
      createEmptyInstance: create)
    ..aI(1, _omitFieldNames ? '' : 'gear', fieldType: $pb.PbFieldType.Q3)
    ..aQS(2, _omitFieldNames ? '' : 'velocity')
    ..aOB(3, _omitFieldNames ? '' : 'on');

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Engine clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Engine copyWith(void Function(Engine) updates) =>
      super.copyWith((message) => updates(message as Engine)) as Engine;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Engine create() => Engine._();
  @$core.override
  Engine createEmptyInstance() => create();
  @$core.pragma('dart2js:noInline')
  static Engine getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Engine>(create);
  static Engine? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get gear => $_getIZ(0);
  @$pb.TagNumber(1)
  set gear($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGear() => $_has(0);
  @$pb.TagNumber(1)
  void clearGear() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get velocity => $_getSZ(1);
  @$pb.TagNumber(2)
  set velocity($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVelocity() => $_has(1);
  @$pb.TagNumber(2)
  void clearVelocity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get on => $_getBF(2);
  @$pb.TagNumber(3)
  set on($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasOn() => $_has(2);
  @$pb.TagNumber(3)
  void clearOn() => $_clearField(3);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
