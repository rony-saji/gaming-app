import 'dart:async';
import 'dart:ui';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/src/cache/assets_cache.dart';
import 'package:flame/src/cache/images.dart';
import 'package:flame/src/components/core/component_tree_root.dart';
import 'package:flame/src/game/flame_game.dart';
import 'package:flame/src/game/game_render_box.dart';
import 'package:flame/src/game/game_widget/gesture_detector_builder.dart';
import 'package:flame/src/game/overlay_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/gestures/events.dart';
import 'package:flutter/src/rendering/object.dart';
import 'package:gaming_app/components/jump_button.dart';
import 'package:gaming_app/components/level.dart';
import 'package:gaming_app/components/players.dart';

class PixelAdventure extends FlameGame
    with
        HasKeyboardHandlerComponents,
        DragCallbacks,
        HasCollisionDetection,
        TapCallbacks {
  @override
  Color backgroundColor() => const Color(0xFF211F30);
  late CameraComponent cam;
  Player player = Player(character: 'Mask Dude');
  late JoystickComponent joystick;
  bool showControls = false;
  bool playSounds = true;
  double soundVolume = 1.0;
  List<String> levelNames = ['Level-01', 'Level-01'];
  int currentLevelIndex = 0;

  @override
  FutureOr<void> onLoad() async {
    
    await images.loadAllImages();

    _loadLevel();

    if (showControls) {
      addJoystick();
      add(JumpButton());
    }

    return super.onLoad();
  }

  @override
  void update(double dt) {
    if (showControls) {
      updateJoystick();
    }
    super.update(dt);
  }

  void addJoystick() {
    joystick = JoystickComponent(
      priority: 10,
      knob: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Knob.png'),
        ),
      ),
      background: SpriteComponent(
        sprite: Sprite(
          images.fromCache('HUD/Joystick.png'),
        ),
      ),
      margin: const EdgeInsets.only(left: 32, bottom: 32),
    );

    add(joystick);
  }

  void updateJoystick() {
    switch (joystick.direction) {
      case JoystickDirection.left:
      case JoystickDirection.upLeft:
      case JoystickDirection.downLeft:
        player.horizontalMovement = -1;
        break;
      case JoystickDirection.right:
      case JoystickDirection.upRight:
      case JoystickDirection.downRight:
        player.horizontalMovement = 1;
        break;
      default:
        player.horizontalMovement = 0;
        break;
    }
  }

  void loadNextLevel() {
    removeWhere((component) => component is Level);

    if (currentLevelIndex < levelNames.length - 1) {
      currentLevelIndex++;
      _loadLevel();
    } else {
      
      currentLevelIndex = 0;
      _loadLevel();
    }
  }

  void _loadLevel() {
    Future.delayed(const Duration(seconds: 1), () {
      Level world = Level(
        player: player,
        levelName: levelNames[currentLevelIndex],
      );

      cam = CameraComponent.withFixedResolution(
        world: world,
        width: 640,
        height: 360,
      );
      cam.viewfinder.anchor = Anchor.topLeft;

      addAll([cam, world]);
    });
  }

  @override
  late AssetsCache assets;

  @override
  late CameraComponent camera;

  @override
  late Color debugColor;

  @override
  int? debugCoordinatesPrecision;

  @override
  late bool debugMode;

  @override
  late Images images;

  @override
  late MouseCursor mouseCursor;

  @override
  void Function(PointerHoverEvent event)? mouseDetector;

  @override
  Component? parent;

  @override
  late bool pauseWhenBackgrounded;

  @override
  late bool paused;

  @override
  late int priority;

  @override
  late World world;

  @override
  FutureOr<void> add(Component component) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> addAll(Iterable<Component> components) {
    // TODO: implement addAll
    throw UnimplementedError();
  }

  @override
  void addGameStateListener(VoidCallback callback) {
    // TODO: implement addGameStateListener
  }

  @override
  FutureOr<void> addToParent(Component parent) {
    // TODO: implement addToParent
    throw UnimplementedError();
  }

  @override
  Iterable<Component> ancestors({bool includeSelf = false}) {
    // TODO: implement ancestors
    throw UnimplementedError();
  }

  @override
  void assertHasLayout() {
    // TODO: implement assertHasLayout
  }

  @override
  void attach(PipelineOwner owner, GameRenderBox gameRenderBox) {
    // TODO: implement attach
  }

  @override
  // TODO: implement buildContext
  BuildContext? get buildContext => throw UnimplementedError();

  @override
  // TODO: implement canvasSize
  Vector2 get canvasSize => throw UnimplementedError();

  @override
  // TODO: implement children
  ComponentSet get children => throw UnimplementedError();

  @override
  Iterable<Component> componentsAtLocation<T>(T locationContext, List<T>? nestedContexts, T? Function(CoordinateTransform p1, T p2) transformContext, bool Function(Component p1, T p2) checkContains) {
    // TODO: implement componentsAtLocation
    throw UnimplementedError();
  }

  @override
  Iterable<Component> componentsAtPoint(Vector2 point, [List<Vector2>? nestedPoints]) {
    // TODO: implement componentsAtPoint
    throw UnimplementedError();
  }

  @override
  ComponentsNotifier<T> componentsNotifier<T extends Component>() {
    // TODO: implement componentsNotifier
    throw UnimplementedError();
  }

  @override
  bool contains(Component c) {
    // TODO: implement contains
    throw UnimplementedError();
  }

  @override
  bool containsLocalPoint(Vector2 point) {
    // TODO: implement containsLocalPoint
    throw UnimplementedError();
  }

  @override
  bool containsPoint(Vector2 point) {
    // TODO: implement containsPoint
    throw UnimplementedError();
  }

  @override
  Vector2 convertGlobalToLocalCoordinate(Vector2 point) {
    // TODO: implement convertGlobalToLocalCoordinate
    throw UnimplementedError();
  }

  @override
  Vector2 convertLocalToGlobalCoordinate(Vector2 point) {
    // TODO: implement convertLocalToGlobalCoordinate
    throw UnimplementedError();
  }

  @override
  ComponentSet createComponentSet() {
    // TODO: implement createComponentSet
    throw UnimplementedError();
  }

  @override
  double currentTime() {
    // TODO: implement currentTime
    throw UnimplementedError();
  }

  @override
  // TODO: implement debugPaint
  Paint get debugPaint => throw UnimplementedError();

  @override
  // TODO: implement debugTextPaint
  TextPaint get debugTextPaint => throw UnimplementedError();

  @override
  void dequeueAdd(Component child, Component parent) {
    // TODO: implement dequeueAdd
  }

  @override
  void dequeueRemove(Component child) {
    // TODO: implement dequeueRemove
  }

  @override
  Iterable<Component> descendants({bool includeSelf = false, bool reversed = false}) {
    // TODO: implement descendants
    throw UnimplementedError();
  }

  @override
  void detach() {
    // TODO: implement detach
  }

  @override
  void enqueueAdd(Component child, Component parent) {
    // TODO: implement enqueueAdd
  }

  @override
  void enqueueMove(Component child, Component newParent) {
    // TODO: implement enqueueMove
  }

  @override
  void enqueueRebalance(Component parent) {
    // TODO: implement enqueueRebalance
  }

  @override
  void enqueueRemove(Component child, Component parent) {
    // TODO: implement enqueueRemove
  }

  @override
  void finalizeRemoval() {
    // TODO: implement finalizeRemoval
  }

  @override
  T? findByKey<T extends Component>(ComponentKey key) {
    // TODO: implement findByKey
    throw UnimplementedError();
  }

  @override
  T? findByKeyName<T extends Component>(String name) {
    // TODO: implement findByKeyName
    throw UnimplementedError();
  }

  @override
  FlameGame<World>? findGame() {
    // TODO: implement findGame
    throw UnimplementedError();
  }

  @override
  T? findParent<T extends Component>({bool includeSelf = false}) {
    // TODO: implement findParent
    throw UnimplementedError();
  }

  @override
  FlameGame<World>? findRootGame() {
    // TODO: implement findRootGame
    throw UnimplementedError();
  }

  @override
  T? firstChild<T extends Component>() {
    // TODO: implement firstChild
    throw UnimplementedError();
  }

  @override
  // TODO: implement gameStateListeners
  List<VoidCallback> get gameStateListeners => throw UnimplementedError();

  @override
  // TODO: implement gestureDetectors
  GestureDetectorBuilder get gestureDetectors => throw UnimplementedError();

  @override
  LifecycleEventStatus handleLifecycleEventAdd(Component parent) {
    // TODO: implement handleLifecycleEventAdd
    throw UnimplementedError();
  }

  @override
  LifecycleEventStatus handleLifecycleEventMove(Component newParent) {
    // TODO: implement handleLifecycleEventMove
    throw UnimplementedError();
  }

  @override
  LifecycleEventStatus handleLifecycleEventRemove(Component parent) {
    // TODO: implement handleLifecycleEventRemove
    throw UnimplementedError();
  }

  @override
  void handleResize(Vector2 size) {
    // TODO: implement handleResize
  }

  @override
  // TODO: implement hasChildren
  bool get hasChildren => throw UnimplementedError();

  @override
  // TODO: implement hasLayout
  bool get hasLayout => throw UnimplementedError();

  @override
  // TODO: implement hasLifecycleEvents
  bool get hasLifecycleEvents => throw UnimplementedError();

  @override
  // TODO: implement isAttached
  bool get isAttached => throw UnimplementedError();

  @override
  // TODO: implement isLoaded
  bool get isLoaded => throw UnimplementedError();

  @override
  // TODO: implement isLoading
  bool get isLoading => throw UnimplementedError();

  @override
  // TODO: implement isMounted
  bool get isMounted => throw UnimplementedError();

  @override
  // TODO: implement isMounting
  bool get isMounting => throw UnimplementedError();

  @override
  // TODO: implement isRemoved
  bool get isRemoved => throw UnimplementedError();

  @override
  // TODO: implement isRemoving
  bool get isRemoving => throw UnimplementedError();

  @override
  // TODO: implement key
  ComponentKey? get key => throw UnimplementedError();

  @override
  T? lastChild<T extends Component>() {
    // TODO: implement lastChild
    throw UnimplementedError();
  }

  @override
  // TODO: implement lifecycleEventsProcessed
  Future<void> get lifecycleEventsProcessed => throw UnimplementedError();

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    // TODO: implement lifecycleStateChange
  }

  @override
  FutureOr<void> load() {
    // TODO: implement load
    throw UnimplementedError();
  }

  @override
  Future<Sprite> loadSprite(String path, {Vector2? srcSize, Vector2? srcPosition}) {
    // TODO: implement loadSprite
    throw UnimplementedError();
  }

  @override
  Future<SpriteAnimation> loadSpriteAnimation(String path, SpriteAnimationData data) {
    // TODO: implement loadSpriteAnimation
    throw UnimplementedError();
  }

  @override
  // TODO: implement loaded
  Future<void> get loaded => throw UnimplementedError();

  @override
  void mount() {
    // TODO: implement mount
  }

  @override
  // TODO: implement mounted
  Future<void> get mounted => throw UnimplementedError();

  @override
  // TODO: implement notifiers
  List<ComponentsNotifier<Component>> get notifiers => throw UnimplementedError();

  @override
  void onAttach() {
    // TODO: implement onAttach
  }

  @override
  void onChildrenChanged(Component child, ChildrenChangeType type) {
    // TODO: implement onChildrenChanged
  }

  @override
  void onDetach() {
    // TODO: implement onDetach
  }

  @override
  void onDispose() {
    // TODO: implement onDispose
  }

  @override
  void onGameResize(Vector2 size) {
    // TODO: implement onGameResize
  }

  @override
  void onParentResize(Vector2 maxSize) {
    // TODO: implement onParentResize
  }

  @override
  void onRemove() {
    // TODO: implement onRemove
  }

  @override
  // TODO: implement overlays
  OverlayManager get overlays => throw UnimplementedError();

  @override
  void pauseEngine() {
    // TODO: implement pauseEngine
  }

  @override
  void processLifecycleEvents() {
    // TODO: implement processLifecycleEvents
  }

  @override
  void processRebalanceEvents() {
    // TODO: implement processRebalanceEvents
  }

  @override
  void propagateToApplicableNotifiers(Component component, void Function(ComponentsNotifier<Component> p1) callback) {
    // TODO: implement propagateToApplicableNotifiers
  }

  @override
  bool propagateToChildren<T extends Component>(bool Function(T p1) handler, {bool includeSelf = false}) {
    // TODO: implement propagateToChildren
    throw UnimplementedError();
  }

  @override
  Future<void> ready() {
    // TODO: implement ready
    throw UnimplementedError();
  }

  @override
  void refreshWidget({bool isInternalRefresh = true}) {
    // TODO: implement refreshWidget
  }

  @override
  void registerKey(ComponentKey key, Component component) {
    // TODO: implement registerKey
  }

  @override
  void remove(Component component) {
    // TODO: implement remove
  }

  @override
  void removeAll(Iterable<Component> components) {
    // TODO: implement removeAll
  }

  @override
  void removeFromParent() {
    // TODO: implement removeFromParent
  }

  @override
  void removeGameStateListener(VoidCallback callback) {
    // TODO: implement removeGameStateListener
  }

  @override
  void removeWhere(bool Function(Component component) test) {
    // TODO: implement removeWhere
  }

  @override
  // TODO: implement removed
  Future<void> get removed => throw UnimplementedError();

  @override
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  // TODO: implement renderBox
  GameRenderBox get renderBox => throw UnimplementedError();

  @override
  void renderDebugMode(Canvas canvas) {
    // TODO: implement renderDebugMode
  }

  @override
  void renderTree(Canvas canvas) {
    // TODO: implement renderTree
  }

  @override
  void resumeEngine() {
    // TODO: implement resumeEngine
  }

  @override
  void setLoaded() {
    // TODO: implement setLoaded
  }

  @override
  void setMounted() {
    // TODO: implement setMounted
  }

  @override
  void setRemoved() {
    // TODO: implement setRemoved
  }

  @override
  // TODO: implement size
  Vector2 get size => throw UnimplementedError();

  @override
  void stepEngine({double stepTime = 1 / 60}) {
    // TODO: implement stepEngine
  }

  @override
  FutureOr<void> toBeLoaded() {
    // TODO: implement toBeLoaded
    throw UnimplementedError();
  }

  @override
  void unregisterKey(ComponentKey key) {
    // TODO: implement unregisterKey
  }

  @override
  void updateTree(double dt) {
    // TODO: implement updateTree
  }
}