# Flutter Material Buttons & Navigation Gallery

A multi-screen Flutter application demonstrating Material Design 3 button variants and stack-based navigation techniques (`Navigator.push`, `Navigator.pop`, `pushReplacement`, and named routes).

---

## 📱 Features & Highlights

### 1. Material Button Gallery (`ButtonGalleryScreen`)
Includes all required Material 3 button variants organized logically into cards:
- **Elevated Button** (`ElevatedButton`)
- **Filled Button** (`FilledButton`)
- **Filled Tonal Button** (`FilledButton.tonal`)
- **Outlined Button** (`OutlinedButton`)
- **Text Button** (`TextButton`)
- **Icon Button** (`IconButton`, `IconButton.filled`, `IconButton.outlined`)
- **Floating Action Button** (`FloatingActionButton.extended`)
- **Buttons with Icons** (`ElevatedButton.icon`, `FilledButton.icon`, `FilledButton.tonalIcon`, `OutlinedButton.icon`, `TextButton.icon`)
- **Segmented Control Buttons** (`SegmentedButton` for Day/Week/Month/Year & XS/S/M/L/XL sizes)
- **Custom-Styled Buttons**:
  - Green pill-shaped "Approve" button with shadow and stadium border
  - Full-width custom gradient "Create Account" action button

---

## 🧭 Multi-Screen Navigation Architecture

The application contains 6 distinct screens demonstrating various Flutter navigation patterns:

```
                  ┌──────────────┐
                  │ LoginScreen  │
                  └──────┬───────┘
                         │ pushReplacementNamed('/buttons')
                         ▼
             ┌────────────────────────┐
             │  ButtonGalleryScreen   │
             └─┬──────┬──────┬──────┬─┘
               │      │      │      │
  pushNamed    │      │      │      │ push (MaterialPageRoute)
 ──────────────┼──────┼──────┼──────┼───────────────┐
               ▼      ▼      ▼      ▼               ▼
        ┌──────────┐┌──────────┐┌──────────┐┌───────────────┐
        │ Profile  ││ Settings ││   Add    ││ DetailsScreen │
        └────┬─────┘└────┬─────┘└────┬─────┘└───────┬───────┘
             │           │           │              │
             └───────────┴─────┬─────┴──────────────┘
                               │ Navigator.pop(context)
                               ▼
                    ┌────────────────────────┐
                    │  ButtonGalleryScreen   │
                    └────────────────────────┘
```

### Navigation Techniques Demonstrated:

1. **`Navigator.pushNamed()`**
   - Used to navigate to `ProfileScreen`, `SettingsScreen`, `AddScreen`, and `RegisterScreen`.
   - Example:
     ```dart
     Navigator.pushNamed(context, '/profile');
     ```

2. **`Navigator.push()` with `MaterialPageRoute`**
   - Used to directly push `DetailsScreen` onto the route stack.
   - Example:
     ```dart
     Navigator.push(
       context,
       MaterialPageRoute(builder: (context) => const DetailsScreen()),
     );
     ```

3. **`Navigator.pop()`**
   - Used across all secondary screens (`Profile`, `Details`, `Settings`, `Add`, `Register`) to pop back to the previous screen.
   - Example:
     ```dart
     Navigator.pop(context);
     ```

4. **`pushReplacementNamed()` / `pushReplacement()`**
   - Used during **Login → Button Gallery** and **Logout → Login** so the user cannot use the back button to navigate back to authentication screens.
   - Example:
     ```dart
     Navigator.pushReplacementNamed(context, '/buttons');
     ```

5. **Named Routes in `MaterialApp`**
   ```dart
   routes: {
     '/': (context) => const LoginScreen(),
     '/buttons': (context) => const ButtonGalleryScreen(),
     '/profile': (context) => const ProfileScreen(),
     '/details': (context) => const DetailsScreen(),
     '/settings': (context) => const SettingsScreen(),
     '/add': (context) => const AddScreen(),
     '/register': (context) => const RegisterScreen(),
   }
   ```

---

## 🛠️ Project Structure

```
lib/
├── main.dart                      # App entry point, MaterialApp setup & Named Routes
└── screens/
    ├── login_screen.dart          # Screen 1: Login & authentication demo
    ├── register_screen.dart       # Screen 2: User registration form
    ├── button_gallery_screen.dart # Screen 3: Material Button Gallery (Main)
    ├── profile_screen.dart        # Screen 4: User Profile with back action
    ├── details_screen.dart        # Screen 5: Navigation details & back action
    ├── settings_screen.dart       # Screen 6: App preferences & back action
    └── add_screen.dart            # Screen 7: Add item form & back action
```

---

## 🚀 How to Run the App

1. **Clone the repository:**
   ```bash
   git clone <repository_url>
   cd demopcpsseca
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

4. **Run tests:**
   ```bash
   flutter test
   ```

---

## 📸 Screenshots

*(Add app screenshots here after running on device or emulator)*

---

## 📄 License
This project is submitted for educational assignment evaluation.
