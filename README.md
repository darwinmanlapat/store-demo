# **Table of contents**

<br>

## **Dependency**

| **DEPENDENCY** | **VERSION** |
|----------------|-------------|
| Flutter        | 3.7.7       |
| Dart           | 2.19.4      |
| Xcode          | 14.2        |
| Android Studio | 11.0+13     |

<br>

## **Tech Stack**

**State Management:** <br>
- hooks_riverpod: ^2.3.2 <br>
- flutter_hooks: ^0.18.6 <br>

**HTTP Client:** <br>
- dio: ^5.0.2 <br>

**Local Storage:** <br>
- flutter_secure_storage: ^8.0.0 <br>
- shared_preferences: ^2.0.18 <br>

**Navigation:** <br>
- beamer: ^1.5.3 <br>

**Miscellaneous:** <br>
- shimmer: ^2.0.0 <br>
- flutter_staggered_grid_view: ^0.6.2 <br>

<br>

## **Setting Up Dev Local Environment**

- Install [Flutter](https://docs.flutter.dev/get-started/install), [Android Studio](https://developer.android.com/studio/install), and [Xcode](https://apps.apple.com/us/app/xcode/id497799835).
- Clone the project from GitHub.

- To run the app, run flutter run. If you are using Visual Studio Code, go to Run and Debug and choose the [launch configuration](https://code.visualstudio.com/docs/editor/debugging#_launch-configurations).

- To Login, use any users from this api https://fakestoreapi.com/users or you can use the credentials below

- username: mor_2314
- password: 83r5^_

<br>

## **Folder Structure**

<br>

```bash
.
├── assets
│   ├── icons
│   ├── illustrations
│   ├── logos
│   └── fonts
└── lib
    ├── common
    │   ├── component                # Reusable components or widgets
    │   ├── di                       # Reusable dependency injection
    │   ├── helper                   # Reusable helpers
    │   ├── service                  # Reusable services
    │   ├── route
    │   └── view_model               # Reusable States/Providers
    ├── feature
    │   ├── <feature/module>
    │   │   ├── data
    │   │   │   ├── remote           # API Calls
    │   │   │   ├── local            # Local or Cache Data
    │   │   │   └── repository       # Repository Implementations
    │   │   ├── di                   # Dependency Injections
    │   │   ├── domain
    │   │   │   ├── model
    │   │   │   └── repository       # Abstract Repository
    │   │   └── presentation
    │   │       ├── component        # Reusable widgets
    │   │       ├── screen           # Pages
    │   │       └── view_model       # Providers
    │   ├── <feature/module>
    │   └── ...
    
```
