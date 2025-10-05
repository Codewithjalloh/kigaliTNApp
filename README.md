# Kigali Today News App

A Flutter news application inspired by BBC News design that fetches and displays news content from [Kigali Today](https://www.kigalitoday.com/), Rwanda's leading news website.

## Features

- 📰 **Latest News**: View the most recent news articles from Kigali Today
- 🔥 **Breaking News**: Special banner for breaking news stories with auto-scroll
- 📱 **Bottom Navigation**: BBC News-style navigation with 5 main sections:
  - **Home**: Tabbed interface with "For you", "Top News", "Economy", "Sports"
  - **Explore**: Category-based news browsing
  - **Video**: Video news content with play buttons
  - **Saved**: Bookmarked articles, history, highlights, and following
  - **Notify**: Notifications and settings
- 🏷️ **Categories**: Browse news by different categories including:
  - Amakuru (News)
  - Ubukungu (Economy)
  - Ubuzima (Health)
  - Umutekano (Security)
  - Ubutabera (Justice)
  - Imikino (Sports)
  - Imyidagaduro (Entertainment)
  - Uburezi (Education)
  - Ikoranabuhanga (Technology)
  - Kwibuka (Remembrance)
- 🔍 **Search**: Advanced search functionality across all content
- 🌐 **External Links**: Open full articles in browser
- 📱 **BBC News Design**: Professional UI inspired by BBC News app
- 🔄 **Pull to Refresh**: Refresh news content by pulling down
- 💾 **Cached Images**: Efficient image loading with caching
- ⚙️ **Settings**: Comprehensive settings with premium subscription options
- 💎 **Premium Features**: Ad-free experience and exclusive content

## Screenshots

The app features a BBC News-inspired design with:
- **Home Screen**: Tabbed interface with "For you", "Top News", "Economy", "Sports"
- **Breaking News Banner**: Auto-scrolling banner for urgent news
- **"At the moment" Section**: Featured story with prominent display
- **Bottom Navigation**: 5-tab navigation (Home, Explore, Video, Saved, Notify)
- **Video Content**: Video news cards with play buttons and duration
- **Category Grid**: Colorful category cards for easy browsing
- **Search Interface**: Advanced search with real-time results
- **Settings Screen**: Comprehensive settings with premium options
- **Premium Subscription**: BBC News-style subscription interface
- **Article Detail View**: Full-screen article reading experience

## Technical Features

- **State Management**: Provider pattern for efficient state management
- **HTTP Requests**: Fetches news from Kigali Today website
- **HTML Parsing**: Parses HTML content to extract news articles
- **Image Caching**: Cached network images for better performance
- **Pull to Refresh**: Smart refresh functionality
- **URL Launcher**: Opens external links in browser
- **Material Design 3**: Modern UI following Material Design guidelines

## Getting Started

### Prerequisites

- Flutter SDK (3.7.2 or higher)
- Dart SDK
- Android Studio / VS Code
- Android device or emulator / iOS simulator

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd kigalitoday
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/                   # Data models
│   ├── news_article.dart     # News article model
│   └── news_category.dart    # News category model
├── providers/                # State management
│   └── news_provider.dart    # News state provider
├── screens/                  # App screens
│   ├── home_screen.dart      # Main home screen
│   ├── article_detail_screen.dart # Article detail view
│   └── category_screen.dart  # Category-specific news
├── services/                 # API services
│   └── news_service.dart     # News fetching service
└── widgets/                  # Reusable widgets
    ├── news_card.dart        # News article card
    ├── category_grid.dart    # Category selection grid
    ├── breaking_news_banner.dart # Breaking news banner
    └── search_bar.dart       # Search input widget
```

## Dependencies

- `http`: HTTP requests to fetch news
- `provider`: State management
- `html`: HTML parsing for news content
- `url_launcher`: Open external links
- `cached_network_image`: Efficient image loading
- `pull_to_refresh`: Pull-to-refresh functionality
- `intl`: Date formatting

## API Integration

The app fetches news from the Kigali Today website by:
1. Making HTTP requests to the website
2. Parsing HTML content to extract article information
3. Converting parsed data into structured news articles
4. Displaying articles in a user-friendly interface

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is for educational purposes. Please respect Kigali Today's terms of service when using their content.

## Acknowledgments

- [Kigali Today](https://www.kigalitoday.com/) for providing news content
- Flutter team for the amazing framework
- The open-source community for the packages used

## Future Enhancements

- [ ] Offline reading capability
- [ ] Push notifications for breaking news
- [ ] Dark mode support
- [ ] Article bookmarking
- [ ] Social sharing
- [ ] Comment system
- [ ] Video news support
- [ ] Multi-language support (English/Kinyarwanda)