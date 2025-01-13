class DrillImages {
  static const List<String> images = [
    "assets/ex1.png",
    "assets/ex2.png",
    "assets/ex3.png",
    "assets/ex4.png",
  ];

  static String getRandomImage() {
    return images[DateTime.now().millisecond % images.length];
  }
}

class Constants {
  // Use your machine's IP address instead of localhost when testing on physical device
  // For emulator, use 10.0.2.2 instead of localhost
  static const String apiBaseUrl =
      'http://10.0.2.2:5001'; // for Android emulator
  // static const String apiBaseUrl = 'http://localhost:5001';  // for web testing
}

// Mock data for fallback
class MockDrills {
  static final List<Map<String, dynamic>> data = [
    {
      'name': 'Basic Dribbling',
      'description': 'Master the fundamentals of ball control',
      'totalCount': 10,
      'category': 'Beginner',
    },
    {
      'name': 'Speed Dribbling',
      'description': 'Improve your pace with the ball',
      'totalCount': 15,
      'category': 'Intermediate',
    },
    {
      'name': 'Advanced Skills',
      'description': 'Complex dribbling patterns and moves',
      'totalCount': 20,
      'category': 'Advanced',
    },
  ];
}
