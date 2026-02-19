import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset & Network Images Demo'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ===== ASSET IMAGE =====
            // Place a local image at `assets/images/sample.jpg`.
            // Add that path to `pubspec.yaml` under `flutter: assets:`.
            const Text(
              'Image from Assets',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),

            // Container provides shadow and rounded border via BoxDecoration.
            Container(
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.15),
                    blurRadius: 12,
                    offset: const Offset(0, 6),
                  ),
                ],
              ),
              // ClipRRect ensures the child image respects the borderRadius.
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/sample.jpeg', // local asset path
                  width: 320,
                  height: 200,
                  fit: BoxFit.cover, // how the image should be inscribed
                  alignment: Alignment.center,
                ),
              ),
            ),
            const SizedBox(height: 28),

            // ===== NETWORK IMAGE =====
            const Text(
              'Image from Network (with loading & error handlers)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 12),

            Container(
              width: 320,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.12),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  // Using Picsum for a simple example image; replace with your URL.
                  'https://picsum.photos/800/400',
                  width: 320,
                  height: 200,
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                  // Loading builder to show a progress indicator while image loads.
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey[200],
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  },
                  // Error builder to show a friendly error UI if the image fails.
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[100],
                      child: const Center(
                        child: Icon(
                          Icons.broken_image,
                          size: 48,
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Short tips about properties used
            const Text(
              'Tips: use `width`, `height`, `fit`, `alignment`, plus `ClipRRect` for rounded corners and `BoxDecoration` for shadow.',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
