import 'dart:async';
import 'package:flutter/material.dart';

class StatusOverlay {
  static OverlayEntry showOverlay(BuildContext context,
      {bool isSuccess = true}) {
    OverlayEntry overlayEntry;

    // Create a controller for fading animation
    final controller = AnimationController(
      vsync: Overlay.of(context),
      duration: Duration(seconds: 1),
    );

    // Create a curved animation for fading
    final curvedAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOut);

    // Create the overlay entry
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: (MediaQuery.of(context).size.height - kToolbarHeight) * 0.1,
        right: MediaQuery.of(context).size.width * 0.2,
        left: MediaQuery.of(context).size.width * 0.2,
        child: AnimatedBuilder(
          animation: curvedAnimation,
          builder: (context, child) => Opacity(
            opacity: curvedAnimation.value,
            child: Container(
              width: 60.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: isSuccess ? Color.fromARGB(255, 131, 241, 140) : Colors.red,
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Center(
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    isSuccess ? 'Success' : 'Failed',
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );

    // Add the overlay to the overlay entry
    Overlay.of(context)?.insert(overlayEntry);

    // Start the animation
    controller.forward();

    // Schedule a callback to remove the overlay after a delay
    Timer(Duration(seconds: 2), () {
      overlayEntry.remove();
      controller.dispose();
    });

    return overlayEntry;
  }
}
