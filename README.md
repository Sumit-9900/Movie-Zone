# Movie Zone  

A Flutter-based movie app showcasing **Clean Architecture** principles, built for exploring trending, now playing, and upcoming movies. This app offers an intuitive interface with seamless navigation and robust features for movie enthusiasts.  

---

## 📖 Features  

1. **Authentication**  
   - User **SignIn** and **SignUp** functionality.  
   - Secure **Logout** option.  

2. **Movie Exploration**  
   - **Trending Movies**: Stay updated with the latest trends.  
   - **Now Playing Movies**: Discover movies currently in theaters.  
   - **Upcoming Movies**: Explore what’s coming soon to cinemas.  
   - Detailed **Movie Information**: View movie details such as videos, title, release date, vote average, description, recommendations, and similar movies.  

3. **Search Feature**  
   - Search for any movie by title for quick access to details.  

4. **Modern Development Practices**  
   - **Clean Architecture**: Ensures modularity and scalability with well-defined layers.  
   - **State Management**: Managed efficiently with **Bloc**.  
   - **Dependency Injection**: Powered by **get_it** for clean and testable code.  
   - **Local Storage**: Leveraging **Shared Preferences** for caching user data.  

---

## 🛠️ Technologies Used  

- **Frontend**: [Flutter](https://flutter.dev/) & [Dart](https://dart.dev/)  
- **State Management**: [Bloc](https://bloclibrary.dev/)  
- **Dependency Injection**: [get_it](https://pub.dev/packages/get_it)  
- **Network Handling**: [dio](https://pub.dev/packages/dio)  
- **Functional Programming**: [dartz](https://pub.dev/packages/dartz)  
- **Video Playback**: [youtube_player_flutter](https://pub.dev/packages/youtube_player_flutter)  
- **Local Storage**: [Shared Preferences](https://pub.dev/packages/shared_preferences)  

---

## 🚀 Getting Started  

### Prerequisites  
1. Install [Flutter](https://docs.flutter.dev/get-started/install).  
2. Ensure you have access to a third-party movie API for backend integration.  

### Installation  

1. Clone the repository:  
   ```bash
   git clone https://github.com/Sumit-9900/Movie-Zone.git  
   cd movie-zone  
2. Install dependencies:
    ```bash
    flutter pub get  
3. Run the application:
    ```bash
    flutter run  

---       

## 📂 Project Structure  

The project is organized following **Clean Architecture** principles for scalability, maintainability, and testability:  

```bash
lib/
├── common/                # Common widgets, helpers, and bloc shared across the app.
├── core/                  # Core functionalities like themes, constants, and configurations.
├── domain/                # Domain layer containing entities and use cases.
│   ├── auth/              # Authentication-specific domain logic.
│   ├── home/              # Home feature domain logic.
│   ├── search/            # Search feature domain logic.
│   └── watch/             # Watch feature domain logic.
├── data/                  # Data sources, models, and repositories.
│   ├── auth/              # Authentication-specific data layer.
│   ├── home/              # Home feature data layer.
│   ├── search/            # Search feature data layer.
│   └── watch/             # Watch feature data layer.
├── presentation/          # UI layer, including pages, widgets, and bloc.
│   ├── auth/              # Authentication-related UI.
│   ├── home/              # Home-related UI.
│   ├── search/            # Search-related UI.
│   ├── splash/            # Splash screen UI.
│   └── watch/             # Watch-related UI.
└── init_dependencies.dart # Dependency injection setup and initializations.
```

---

## 🌟 Acknowledgments

- Inspired by modern **Clean Architecture** principles and community resources.
- Special thanks to [Ajoy Paul](https://github.com/Ajoy-paul11) for providing the Movie backend.


---

## 📞 Contact  

Feel free to reach out to me on LinkedIn: [Sumit Paul](https://linkedin.com/in/sumit-paul-640971218)  
