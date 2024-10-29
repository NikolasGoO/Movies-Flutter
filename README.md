# Movies App

A movie app built with Flutter, which allows users to explore and search for movies. The app uses an API to fetch information about movies, including details, ratings and genres.
This project is a Flutter application that consumes [The Movie Database API (TMDb)](https://www.themoviedb.org/) to display detailed information about popular movies. The app includes features like movie listings, detailed views, and ratings.

## Features

- **Popular Movies Listing**: Displays a list of popular movies from TMDb.
- **Movie Details**: Shows detailed information about a selected movie, including description, rating, and release date.
- **Pagination**: Allows browsing through multiple pages of movie results.
- Display of a list of popular films
- Movie details including synopsis and reviews
- List of favorite movies


## Project Structure

The project is organized to maintain separation of concerns and ease of maintenance. Key folders and files include:

- **controllers**: Contains controllers that handle the app's business logic.
- **models**: Defines data models for the app, including `MovieModel`, `MovieDetailModel`, and `MovieResponseModel`.
- **repositories**: Manages external API consumption (like TMDb), handling HTTP operations and error processing.
- **widgets**: Custom components like `CenteredMessage`, `CenteredProgress`, `ChipDate`, and `Rate` used in the UI.

## Prerequisites

- **Flutter SDK**: Ensure you have the Flutter SDK installed. Follow [this guide](https://docs.flutter.dev/get-started/install) for installation instructions.
- **TMDb API Key**: Accessing the TMDb API requires an API key. Sign up on [TMDb](https://www.themoviedb.org/) and get your API key.

## Technologies Used

- Flutter
- Dart
- HTTP
- External API (The Movie Database - TMDb)

