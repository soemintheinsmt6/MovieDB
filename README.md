# 🎬 MovieDB

A modern iOS application built with Swift, RxSwift and UIKit that displays popular movies from The Movie Database (TMDB) API. The app features infinite scrolling, responsive UI, and follows MVVM architecture with reactive programming.

## ✨ Features

- 📱 **Popular Movies List**: Browse popular movies from TMDB
- ♾️ **Infinite Scrolling**: Automatic pagination as you scroll
- 🖼️ **Movie Posters**: High-quality movie poster images with placeholder support
- 🎨 **Modern UI**: Clean, gradient-based interface with custom navigation bar
- 🔄 **Reactive Programming**: Built with RxSwift for efficient data binding
- 🧪 **Unit & UI Tests**: Comprehensive test coverage

## 🏗️ Architecture

The app follows the **MVVM (Model-View-ViewModel)** architecture pattern:

- **Model**: `Movie` and `MovieResponse` structs
- **View**: `MovieListViewController` with XIB-based UI
- **ViewModel**: `MovieListViewModel` managing business logic and API calls
- **Service**: `MovieService` handling network requests with protocol-oriented design

## 🛠️ Tech Stack

### Dependencies
- **Alamofire 5.10.2**: HTTP networking library
- **RxSwift 6.8.0**: Reactive programming framework
- **SDWebImage 5.20.0**: Async image loading and caching

### iOS Requirements
- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## 📦 Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/MovieDB.git
cd MovieDB
```

2. Open the project in Xcode:
```bash
open MovieDB.xcodeproj
```

3. The Swift Package Manager dependencies will be automatically resolved:
   - Alamofire
   - RxSwift
   - SDWebImage

4. Build and run the project (⌘R)

## 🚀 Usage

1. Launch the app on your iOS device or simulator
2. The app will automatically load popular movies from TMDB
3. Scroll down to load more movies (infinite pagination)
4. Movie posters are displayed in a 3-column grid layout

## 📁 Project Structure

```
MovieDB/
├── MovieDB/
│   ├── Model/
│   │   └── Movie.swift              # Movie data models
│   ├── View/
│   │   ├── Cells/
│   │   │   ├── MovieCell/          # Custom movie cell
│   │   │   └── LoadingCell.swift   # Loading indicator cell
│   │   └── Features/
│   │       └── MovieList/          # Movie list view controller
│   ├── ViewModel/
│   │   └── MovieListViewModel.swift # Business logic
│   ├── Networking/
│   │   └── MovieService.swift      # API service layer
│   └── Utils/
│       ├── Extensions/             # Swift extensions
│       └── Utils.swift             # Utility functions & API config
├── MovieDBTests/                   # Unit tests
└── MovieDBUITests/                 # UI tests
```

## 🧪 Testing

The project includes comprehensive test coverage:

### Unit Tests
- `MovieTests.swift`: Movie model tests
- `MovieServiceTests.swift`: Network service tests
- `MovieListViewModelTests.swift`: ViewModel tests
- `MovieCellTests.swift`: Cell configuration tests
- `LoadingCellTests.swift`: Loading cell tests
- `ExtensionsTests.swift`: Extension utility tests

### UI Tests
- `MovieListViewControllerUITests.swift`: UI interaction tests

Run tests using ⌘U in Xcode.

## 🔧 Configuration

The app uses The Movie Database (TMDB) API. The API configuration is located in `Utils/Utils.swift`:

```swift
struct ApiManager {
    static let baseUrl = "https://api.themoviedb.org/3/"
}
```

**Note**: For production use, store your API key securely (e.g., in a configuration file or environment variables) instead of hardcoding it.

## 📱 Screenshots

*Add screenshots of your app here*

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 👨‍💻 Author

**Soemin Thein**

- LinkedIn: [soemin-thein](https://linkedin.com/in/soemin-thein)
- Twitter: [@soeminthein_](https://x.com/soeminthein_)

## 🙏 Acknowledgments

- [The Movie Database (TMDB)](https://www.themoviedb.org/) for providing the movie API
- [Alamofire](https://github.com/Alamofire/Alamofire) for networking
- [RxSwift](https://github.com/ReactiveX/RxSwift) for reactive programming
- [SDWebImage](https://github.com/SDWebImage/SDWebImage) for image loading

---

Made with ❤️ using Swift
