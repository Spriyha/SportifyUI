## SpotifyUI App
SpotifyUI is a custom implementation of a Spotify-inspired music application built with SwiftUI. This project includes various features such as a dynamic library system, lyrics playback, playlist views, and a modern user interface that mimics the core functionalities of a music streaming application.
### Features
* Home View:
Displays a personalized message (e.g., "A blend of music for Lucas and Sam. Updates daily.").
Shows Spotify branding with a play button.
Includes a dynamic header with song information.
Clicking on any playlist or album navigates to the Playlist View.
* Playlist View:
Displays a list of songs with details like song title, artist name, and album art.
Each song includes action buttons such as a like icon and a menu (three dots).
Tapping the menu button presents a Custom Action Sheet modally with options like "Add to Queue," "Add to Playlist," "View Lyrics," and more.
* Lyrics View:
Dynamic lyrics synchronized with a progress bar.
Bold font and animations for the currently playing lyric.
Play/pause button with song duration and time formatting.
* Library View:
Displays the "Liked Songs" section with a count of liked songs.
Fetches data from LibraryData for real-time updates.
* Mini Player:
Compact music player that appears at the bottom of the screen above the tab bar when a song is played.
Displays the current song's image, title, and playback controls (play, pause, next, etc.).
Includes a heart icon to toggle the song's liked status.
Progress bar updates in real-time.
* Search View:
Simple search bar with an intuitive interface for finding songs, albums, or playlists.
* Custom Action Sheet:
Provides multiple actions for a song, such as adding to a playlist, sharing, toggling like status, and viewing lyrics.
Includes navigation to the Lyrics View for the selected song.
* Tab Bar Navigation:
Tabs for "Home," "Search," and "Your Library."
Dynamic content rendering based on the selected tab.
### Components
1. SpotifyHeaderView
Displays the Spotify branding, song information, and a play button.
Includes IconView for interaction with song actions (like, add, download, etc.).
2. SpotifyLyricsView
Handles the display and synchronization of song lyrics.
Includes a playback timer and progress bar.
Animates the transition between lyrics.
3. PlaylistView
Displays the songs of a selected playlist or album.
Provides song action buttons and integrates the Custom Action Sheet.
4. LibraryView
Displays the "Liked Songs" section with a count of liked songs.
Fetches data from LibraryData.
5. MiniPlayerView
Displays a compact version of the music player.
Shows playback progress and allows liking a song.
Toggles playback using a play/pause button.
6. SearchView
Contains a search bar for finding songs or playlists.
Simplistic UI for user input.
7. TabBarView
Provides a custom tab bar for navigation.
Highlights the active tab.
8. CustomActionSheetView
Custom action sheet with options like "Add to Playlist" and "Go to Song Radio."
Integrated lyrics navigation.
9. ContentView
Handles the main app navigation between Home, Search, and Library tabs.
Integrates TabBarView and respective views.
10. PlaybackViewModel
Manages playback state, progress, and timers.
Handles play/pause functionality.
11. LibraryData
Manages liked songs and their states.
Tracks liked song count.
### Architecture
The app follows the MVVM (Model-View-ViewModel) architecture pattern:
* Model: The Model ensures that data is encapsulated and provides a single source of truth for the application for example LibraryData
* View: SwiftUI Views such as SpotifyLyricsView,LibraryView,HomeView etc.
* ViewModel: Handles state management and business logic, for example PlaybackViewModel.
### Dependencies
This project is built entirely with SwiftUI and does not rely on any external dependencies. All UI components and animations are implemented using SwiftUI packages and dependencies.
### Getting Started
* Clone the Repository:
git clone (https://github.com/Spriyha/SportifyUI.git)
* Open in Xcode:
Open the SpotifyUI.xcodeproj file in Xcode.
* Run the App:
Ensure you have an iOS simulator or device configured.
Build and run the app using the Play button in Xcode.
### Customization
Update song data or lyrics in SpotifyLyricsView by modifying the lyrics array.
Customize the UI by tweaking SwiftUI modifiers such as .background, .foregroundColor, etc.
Add additional features by extending LibraryData or creating new View components.
### Future Improvements
* Real-Time Lyrics Sync: Integrate with a backend service to fetch real-time lyrics.
* Playlist Management: Add functionality to create, edit, and delete playlists.
* Enhanced Search: Include filtering and sorting for better search results.
* Media Playback Integration: Connect with AVFoundation or a backend API for streaming audio.
### Credits
This project was created as a SwiftUI demonstration inspired by Spotify's design and functionality.
### License
This project is open source.
### Requirements
* Xcode 14+
* Swift 5+
* iOS 15+
### Acknowledgements
We would like to thank the Apple community for their excellent framework and documentation,which greatly facilitated the development of this project.
### ScreenShots
![Simulator Screenshot - iPhone 16 Pro - 2024-12-27 at 16 44 45](https://github.com/user-attachments/assets/5ea25d35-a756-49c4-87fc-f55635fa29ea)
![Simulator Screenshot - iPhone 16 Pro - 2024-12-27 at 16 45 29](https://github.com/user-attachments/assets/c8d4ddc8-9e4f-450a-b9fb-f1141e08e2a6)
![Simulator Screenshot - iPhone 16 Pro - 2024-12-27 at 16 45 46](https://github.com/user-attachments/assets/503ac15a-f6a1-4ba5-be08-35f14baafcf0)

![Simulator Screenshot - iPhone 16 Pro - 2024-12-27 at 16 45 55](https://github.com/user-attachments/assets/94017a7d-1d89-4564-893e-60c54cde1315)
![Simulator Screenshot - iPhone 16 Pro - 2024-12-27 at 16 46 12](https://github.com/user-attachments/assets/5ad35d6f-7f8c-4b00-bbe5-9bd5e0b4dedc)
![Simulator Screenshot - iPhone 16 Pro - 2024-12-27 at 16 45 17](https://github.com/user-attachments/assets/f30399da-04ce-4f22-9a71-9a61d4c91ae2)

![Simulator Screen Recording - iPhone 16 Pro - 2024-12-27 at 16 49 21](https://github.com/user-attachments/assets/1466f4f1-6dda-49f7-89ed-b545504e67e7)
