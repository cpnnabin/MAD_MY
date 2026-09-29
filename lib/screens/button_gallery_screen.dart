import 'package:flutter/material.dart';
import 'details_screen.dart';

class ButtonGalleryScreen extends StatefulWidget {
  const ButtonGalleryScreen({super.key});

  @override
  State<ButtonGalleryScreen> createState() => _ButtonGalleryScreenState();
}

class _ButtonGalleryScreenState extends State<ButtonGalleryScreen> {
  // States for Segmented Buttons as inspired by presentation slides
  String _selectedPeriod = 'Day';
  String _selectedSize = 'L';
  int _cloudIconSelected = 1;
  bool _isLiked = false;

  void _showActionSnackbar(String message) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.green.shade800,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Material Buttons"),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.person_outline),
            tooltip: 'Profile',
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.pushNamed(context, '/settings');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Logout (pushReplacement)',
            onPressed: () {
              // Demonstrating pushReplacementNamed for logout
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green.shade200),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.palette_outlined,
                        size: 36, color: Colors.green),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Flutter Button Gallery",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text(
                            "Demonstrating Material 3 Button Variants & Navigation",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.green.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // SECTION 1: Segmented Controls
              _buildSectionCard(
                title: "1. Segmented Buttons (Toggle Controls)",
                child: Column(
                  children: [
                    // Period Selector [Day, Week, Month, Year]
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SegmentedButton<String>(
                        segments: const [
                          ButtonSegment<String>(
                            value: 'Day',
                            label: Text('Day'),
                            icon: Icon(Icons.calendar_view_day),
                          ),
                          ButtonSegment<String>(
                            value: 'Week',
                            label: Text('Week'),
                            icon: Icon(Icons.calendar_view_week),
                          ),
                          ButtonSegment<String>(
                            value: 'Month',
                            label: Text('Month'),
                            icon: Icon(Icons.calendar_month),
                          ),
                          ButtonSegment<String>(
                            value: 'Year',
                            label: Text('Year'),
                            icon: Icon(Icons.calendar_today),
                          ),
                        ],
                        selected: {_selectedPeriod},
                        onSelectionChanged: (Set<String> newSelection) {
                          setState(() {
                            _selectedPeriod = newSelection.first;
                          });
                          _showActionSnackbar("Selected Period: $_selectedPeriod");
                        },
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Size Selector [XS, S, M, L, XL]
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SegmentedButton<String>(
                        segments: const [
                          ButtonSegment<String>(value: 'XS', label: Text('XS')),
                          ButtonSegment<String>(value: 'S', label: Text('S')),
                          ButtonSegment<String>(value: 'M', label: Text('M')),
                          ButtonSegment<String>(value: 'L', label: Text('L')),
                          ButtonSegment<String>(value: 'XL', label: Text('XL')),
                        ],
                        selected: {_selectedSize},
                        onSelectionChanged: (Set<String> newSelection) {
                          setState(() {
                            _selectedSize = newSelection.first;
                          });
                          _showActionSnackbar("Selected Size: $_selectedSize");
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SECTION 2: Standard Material Button Variants
              _buildSectionCard(
                title: "2. Standard Material Button Variants",
                child: Column(
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      alignment: WrapAlignment.center,
                      children: [
                        // 1. ElevatedButton
                        ElevatedButton(
                          onPressed: () => _showActionSnackbar("ElevatedButton Pressed"),
                          child: const Text("Elevated Button"),
                        ),

                        // 2. FilledButton
                        FilledButton(
                          onPressed: () => _showActionSnackbar("FilledButton Pressed"),
                          style: FilledButton.styleFrom(backgroundColor: Colors.green),
                          child: const Text("Filled Button"),
                        ),

                        // 3. FilledButton.tonal
                        FilledButton.tonal(
                          onPressed: () => _showActionSnackbar("FilledTonal Button Pressed"),
                          child: const Text("Filled Tonal"),
                        ),

                        // 4. OutlinedButton
                        OutlinedButton(
                          onPressed: () => _showActionSnackbar("OutlinedButton Pressed"),
                          child: const Text("Outlined Button"),
                        ),

                        // 5. TextButton
                        TextButton(
                          onPressed: () => _showActionSnackbar("TextButton Pressed"),
                          child: const Text("Text Button"),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SECTION 3: Buttons with Icons
              _buildSectionCard(
                title: "3. Buttons with Icons",
                child: Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  alignment: WrapAlignment.center,
                  children: [
                    // Add Button -> Navigate to Add Screen
                    ElevatedButton.icon(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add');
                      },
                      icon: const Icon(Icons.add),
                      label: const Text("Add"),
                    ),

                    // Attach Button
                    FilledButton.icon(
                      onPressed: () => _showActionSnackbar("Attach File Clicked"),
                      icon: const Icon(Icons.attach_file),
                      label: const Text("Attach"),
                      style: FilledButton.styleFrom(backgroundColor: Colors.green),
                    ),

                    // Send Button
                    FilledButton.tonalIcon(
                      onPressed: () => _showActionSnackbar("Message Sent"),
                      icon: const Icon(Icons.send),
                      label: const Text("Send"),
                    ),

                    // Like Button with Toggle State
                    OutlinedButton.icon(
                      onPressed: () {
                        setState(() {
                          _isLiked = !_isLiked;
                        });
                        _showActionSnackbar(_isLiked ? "Liked!" : "Unliked!");
                      },
                      icon: Icon(
                        _isLiked ? Icons.thumb_up : Icons.thumb_up_outlined,
                        color: _isLiked ? Colors.green : null,
                      ),
                      label: Text(_isLiked ? "Liked" : "Like"),
                    ),

                    // Favourite Text Button
                    TextButton.icon(
                      onPressed: () => _showActionSnackbar("Added to Favourites"),
                      icon: const Icon(Icons.favorite, color: Colors.pink),
                      label: const Text("Favourite"),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SECTION 4: Icon Buttons Row (Clouds, Navigation)
              _buildSectionCard(
                title: "4. Icon Buttons & Toggle Icon Controls",
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() => _cloudIconSelected = 0);
                            _showActionSnackbar("Cloud 1 Selected");
                          },
                          icon: Icon(
                            _cloudIconSelected == 0
                                ? Icons.cloud_done
                                : Icons.cloud_outlined,
                            size: 32,
                            color: Colors.green,
                          ),
                        ),
                        IconButton.filled(
                          onPressed: () {
                            setState(() => _cloudIconSelected = 1);
                            _showActionSnackbar("Cloud 2 Selected");
                          },
                          icon: const Icon(Icons.cloud, size: 28),
                          style: IconButton.styleFrom(backgroundColor: Colors.green),
                        ),
                        IconButton.outlined(
                          onPressed: () {
                            setState(() => _cloudIconSelected = 2);
                            _showActionSnackbar("Cloud 3 Selected");
                          },
                          icon: const Icon(Icons.cloud_queue, size: 28),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => _showActionSnackbar("Close Action"),
                          icon: const Icon(Icons.close),
                        ),
                        IconButton(
                          onPressed: () => _showActionSnackbar("Back Arrow Action"),
                          icon: const Icon(Icons.arrow_back_ios),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SECTION 5: Custom-Styled Buttons
              _buildSectionCard(
                title: "5. Custom-Styled Buttons",
                child: Column(
                  children: [
                    // Custom Pill "Approve" button with check icon (as in slide image)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          onPressed: () => _showActionSnackbar("Request Approved!"),
                          icon: const Icon(Icons.thumb_up, size: 18),
                          label: const Text("Approve"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green.shade800,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 12),
                            shape: const StadiumBorder(),
                            elevation: 4,
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Custom FAB style pill button
                        InkWell(
                          onTap: () => _showActionSnackbar("Custom FAB Clicked"),
                          borderRadius: BorderRadius.circular(16),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.green.shade400,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.green.withValues(alpha: 0.3),
                                  blurRadius: 6,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: const Icon(Icons.add, color: Colors.white, size: 24),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Custom Gradient Button ("Create Account" / Banner Button)
                    Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.green.shade700,
                            Colors.green.shade500,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green.shade200,
                            blurRadius: 8,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: () {
                          // Navigate to register screen
                          Navigator.pushNamed(context, '/register');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // SECTION 6: Screen Navigation Demonstrations
              _buildSectionCard(
                title: "6. Navigation Techniques Demonstration",
                child: Column(
                  children: [
                    const Text(
                      "Test navigation methods to different screens:",
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                    const SizedBox(height: 12),

                    // 1. pushNamed to Profile
                    SizedBox(
                      width: double.infinity,
                      child: FilledButton.icon(
                        onPressed: () {
                          // Demonstrating Navigator.pushNamed
                          Navigator.pushNamed(context, '/profile');
                        },
                        icon: const Icon(Icons.person),
                        label: const Text("1. Go to Profile ( pushNamed )"),
                        style: FilledButton.styleFrom(
                          backgroundColor: Colors.green.shade700,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 2. push with MaterialPageRoute to Details
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // Demonstrating Navigator.push with MaterialPageRoute
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DetailsScreen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.info_outline),
                        label: const Text("2. Go to Details ( push MaterialPageRoute )"),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 3. pushNamed to Settings
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Demonstrating Navigator.pushNamed
                          Navigator.pushNamed(context, '/settings');
                        },
                        icon: const Icon(Icons.settings),
                        label: const Text("3. Go to Settings ( pushNamed )"),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 4. pushNamed to Add
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          // Demonstrating Navigator.pushNamed
                          Navigator.pushNamed(context, '/add');
                        },
                        icon: const Icon(Icons.add_circle_outline),
                        label: const Text("4. Go to Add Item ( pushNamed )"),
                      ),
                    ),
                    const SizedBox(height: 8),

                    // 5. pushReplacementNamed to Logout
                    SizedBox(
                      width: double.infinity,
                      child: TextButton.icon(
                        onPressed: () {
                          // Demonstrating Navigator.pushReplacementNamed
                          Navigator.pushReplacementNamed(context, '/');
                        },
                        icon: const Icon(Icons.logout, color: Colors.red),
                        label: const Text(
                          "5. Logout ( pushReplacementNamed )",
                          style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 80), // Space for FloatingActionButton
            ],
          ),
        ),
      ),

      // 7. Floating Action Button Requirement
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, '/add');
        },
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        icon: const Icon(Icons.add),
        label: const Text("Add New"),
      ),
    );
  }

  Widget _buildSectionCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.green.shade900,
              ),
            ),
            const SizedBox(height: 12),
            child,
          ],
        ),
      ),
    );
  }
}
