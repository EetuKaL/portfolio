import 'dart:math';

import 'package:jaspr/jaspr.dart';
import 'package:universal_web/js_interop.dart';
import 'package:universal_web/web.dart' as web;

class _Particle {
  double x;
  double y;
  final double size;
  final double speedX;
  final double speedY;
  final String color;
  final double opacity;

  _Particle({
    required this.x,
    required this.y,
    required this.size,
    required this.speedX,
    required this.speedY,
    required this.color,
    required this.opacity,
  });

  factory _Particle.random(int canvasWidth, int canvasHeight, Random rng) {
    return _Particle(
      x: rng.nextDouble() * canvasWidth,
      y: rng.nextDouble() * canvasHeight,
      size: rng.nextDouble() * 2 + 1,
      speedX: rng.nextDouble() * 0.5 - 0.25,
      speedY: rng.nextDouble() * 0.5 - 0.25,
      color: rng.nextBool() ? '#00f2ff' : '#bc13fe',
      opacity: rng.nextDouble() * 0.5,
    );
  }

  void update(int canvasWidth, int canvasHeight) {
    x += speedX;
    y += speedY;
    if (x > canvasWidth) x = 0;
    if (x < 0) x = canvasWidth.toDouble();
    if (y > canvasHeight) y = 0;
    if (y < 0) y = canvasHeight.toDouble();
  }

  void draw(web.CanvasRenderingContext2D ctx) {
    ctx.fillStyle = color.toJS;
    ctx.globalAlpha = opacity;
    ctx.beginPath();
    ctx.arc(x, y, size, 0, pi * 2);
    ctx.fill();
  }
}

/// A wrapper component that sets up client-side effects:
/// - Canvas particle animation
/// - Scroll-based reveal animations
/// - Smooth scrolling for anchor links
class ClientEffects extends StatefulComponent {
  final Component child;

  const ClientEffects({required this.child, super.key});

  @override
  State<ClientEffects> createState() => _ClientEffectsState();
}

class _ClientEffectsState extends State<ClientEffects> {
  final List<_Particle> _particles = [];
  web.HTMLCanvasElement? _canvas;
  web.CanvasRenderingContext2D? _ctx;
  bool _running = false;

  @override
  void initState() {
    super.initState();
    if (kIsWeb) {
      // Defer setup until after the DOM is fully rendered
      Future.microtask(_setupEffects);
    }
  }

  void _setupEffects() {
    _setupCanvas();
    _setupReveal();
    _setupSmoothScroll();
  }

  void _setupCanvas() {
    final canvasEl = web.document.getElementById('bg-canvas');
    if (canvasEl == null) return;

    _canvas = canvasEl as web.HTMLCanvasElement;
    _ctx = _canvas!.getContext('2d') as web.CanvasRenderingContext2D;

    _resize();
    web.window.addEventListener(
      'resize',
      (web.Event e) {
        _resize();
      }.toJS,
    );

    final rng = Random();
    for (var i = 0; i < 100; i++) {
      _particles.add(_Particle.random(_canvas!.width, _canvas!.height, rng));
    }

    _running = true;
    _animate(0.toJS);
  }

  void _resize() {
    final canvas = _canvas;
    if (canvas == null) return;
    canvas.width = web.window.innerWidth;
    canvas.height = web.window.innerHeight;
  }

  void _animate(JSNumber timestamp) {
    if (!_running) return;
    final canvas = _canvas!;
    final ctx = _ctx!;

    ctx.clearRect(0, 0, canvas.width.toDouble(), canvas.height.toDouble());
    for (final p in _particles) {
      p.update(canvas.width, canvas.height);
      p.draw(ctx);
    }

    web.window.requestAnimationFrame(_animate.toJS);
  }

  void _setupReveal() {
    void reveal() {
      final reveals = web.document.querySelectorAll('.reveal');
      for (var i = 0; i < reveals.length; i++) {
        final el = reveals.item(i)! as web.Element;
        final windowHeight = web.window.innerHeight;
        final elementTop = el.getBoundingClientRect().top;
        const elementVisible = 150;
        if (elementTop < windowHeight - elementVisible) {
          el.classList.add('active');
        }
      }
    }

    web.window.addEventListener(
      'scroll',
      (web.Event e) {
        reveal();
      }.toJS,
    );
    web.window.addEventListener(
      'load',
      (web.Event e) {
        reveal();
      }.toJS,
    );
    // Also run reveal immediately in case elements are already visible
    reveal();
  }

  void _setupSmoothScroll() {
    void smoothScrollTo(double targetTop, {int duration = 600}) {
      final startTop = web.window.scrollY;
      var distance = targetTop - startTop;
      distance -= 14; // Reduce scroll distance, otherwise navbar covers target
      if (distance.abs() < 1) {
        web.window.scrollTo(0.toJS, targetTop);
        return;
      }

      double? startTime;

      void step(JSNumber ts) {
        final timestamp = ts.toDartDouble;
        startTime ??= timestamp;
        final progress = ((timestamp - startTime!) / duration).clamp(0.0, 1.0);
        final eased = 0.5 - cos(progress * pi) / 2;
        web.window.scrollTo(0.toJS, (startTop + distance * eased));
        if (progress < 1) {
          web.window.requestAnimationFrame(step.toJS);
        }
      }

      web.window.requestAnimationFrame(step.toJS);
    }

    final triggers = web.document.querySelectorAll('a[href^="#"], [data-scroll-target]');
    for (var i = 0; i < triggers.length; i++) {
      final trigger = triggers.item(i)! as web.Element;
      trigger.addEventListener(
        'click',
        (web.Event e) {
          final targetSelector = trigger.getAttribute('data-scroll-target') ?? trigger.getAttribute('href');
          if (targetSelector == null || !targetSelector.startsWith('#')) return;

          e.preventDefault();
          final target = web.document.querySelector(targetSelector);
          if (target == null) return;

          final nav = web.document.querySelector('nav');
          final headerOffset = nav != null ? (nav as web.HTMLElement).offsetHeight + 12 : 0;
          final targetTop = target.getBoundingClientRect().top + web.window.scrollY - headerOffset;

          smoothScrollTo(targetTop);
        }.toJS,
      );
    }
  }

  @override
  void dispose() {
    _running = false;
    super.dispose();
  }

  @override
  Component build(BuildContext context) {
    return component.child;
  }
}
