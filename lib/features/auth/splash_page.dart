import 'package:flutter/material.dart';
// import 'dart:async';
// import '../../core/routes/route_names.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with TickerProviderStateMixin {
  late AnimationController _loadingController;
  late AnimationController _dotController;

  @override
  void initState() {
    super.initState();

    _loadingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    _dotController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    // Navigate to Login after 3 seconds
    // Timer(const Duration(seconds: 3), () {
    //   if (mounted) {
    //     Navigator.pushReplacementNamed(context, RouteNames.login);
    //   }
    // });
  }

  @override
  void dispose() {
    _loadingController.dispose();
    _dotController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF0D47A1), // Deep Blue
              Color(0xFF1976D2), // Medium Blue
              Color(0xFF42A5F5), // Sky Blue
              Color(0xFFBBDEFB), // Soft Sky Blue
            ],
            stops: [0.0, 0.4, 0.8, 1.0],
          ),
        ),
        child: Stack(
          children: [
            // Soft Clouds
            _buildCloud(top: 100, left: -40, size: 180, opacity: 0.3),
            _buildCloud(top: 150, right: -60, size: 220, opacity: 0.4),
            _buildCloud(top: 300, left: 40, size: 120, opacity: 0.2),

            // Main Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 3),

                  // Illustration Area
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      // Decorative Glow
                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.white.withValues(alpha: 0.2),
                              blurRadius: 50,
                              spreadRadius: 20,
                            ),
                          ],
                        ),
                      ),
                      // Core Icon (Educational representation)
                      Container(
                        padding: const EdgeInsets.all(35),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 30,
                              offset: const Offset(0, 15),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.school_rounded,
                          size: 100,
                          color: Color(0xFF1976D2),
                        ),
                      ),
                      // Floating Icons (Mimicking the detailed illustration)
                      _buildFloatingIcon(
                        Icons.lightbulb_outline,
                        -90,
                        -90,
                        Colors.amber,
                      ),
                      _buildFloatingIcon(
                        Icons.public_rounded,
                        90,
                        -70,
                        Colors.green,
                      ),
                      _buildFloatingIcon(
                        Icons.chat_bubble_outline_rounded,
                        -80,
                        80,
                        Colors.orange,
                      ),
                      _buildFloatingIcon(
                        Icons.mail_outline_rounded,
                        80,
                        80,
                        Colors.purple,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),

                  // Typography
                  const Text(
                    "Student App",
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0D47A1),
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Learn, Grow, Succeed",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF1976D2),
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.5,
                    ),
                  ),

                  const Spacer(flex: 4),

                  // Loading Section
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Loading",
                            style: TextStyle(
                              color: Color(0xFF0D47A1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          _buildAnimatedDots(),
                        ],
                      ),
                      const SizedBox(height: 20),
                      // Thin Progress Line
                      Container(
                        width: 240,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: AnimatedBuilder(
                          animation: _loadingController,
                          builder: (context, child) {
                            return FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: _loadingController.value,
                              child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xFF0D47A1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCloud({
    double? top,
    double? bottom,
    double? left,
    double? right,
    required double size,
    required double opacity,
  }) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Container(
        width: size,
        height: size / 1.5,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: opacity),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withValues(alpha: 0.1),
              blurRadius: 40,
              spreadRadius: 20,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingIcon(IconData icon, double x, double y, Color color) {
    return Transform.translate(
      offset: Offset(x, y),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Icon(icon, color: color, size: 24),
      ),
    );
  }

  Widget _buildAnimatedDots() {
    return AnimatedBuilder(
      animation: _dotController,
      builder: (context, child) {
        int dotCount = (_dotController.value * 3).floor() + 1;
        String dots = '.' * dotCount;
        return SizedBox(
          width: 30,
          child: Text(
            dots,
            style: const TextStyle(
              color: Color(0xFF0D47A1),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
