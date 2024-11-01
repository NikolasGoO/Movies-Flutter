<h1>Movies App</h1>

<p>A movie app built with Flutter, which allows users to explore and search for movies. The app uses an API to fetch information about movies, including details, ratings, and genres. This project is a Flutter application that consumes <a href="https://www.themoviedb.org/">The Movie Database API (TMDb)</a> to display detailed information about popular movies. The app includes features like movie listings, detailed views, and ratings.</p>

<h2>Features</h2>
<ul>
  <li><strong>Popular Movies Listing</strong>: Displays a list of popular movies from TMDb.</li>
  <li><strong>Movie Details</strong>: Shows detailed information about a selected movie, including description, rating, and release date.</li>
  <li><strong>Movie Search</strong>: Allows users to search for movies by name and view search results.</li>
  <li><strong>Synopsis Translation</strong>: Translates the movie's synopsis into a target language using the DeepL API.</li>
  <li><strong>Pagination</strong>: Allows browsing through multiple pages of movie results.</li>
  <li>Display of a list of popular films.</li>
  <li>Movie details including synopsis and reviews.</li>
  <li>List of favorite movies.</li>
</ul>

<h2>Project Structure</h2>
<p>The project is organized to maintain separation of concerns and ease of maintenance. Key folders and files include:</p>
<ul>
  <li><strong>controllers</strong>: Contains controllers that handle the app's business logic.</li>
  <li><strong>models</strong>: Defines data models for the app, including <code>MovieModel</code>, <code>MovieDetailModel</code>, and <code>MovieResponseModel</code>.</li>
  <li><strong>repositories</strong>: Manages external API consumption (like TMDb and DeepL), handling HTTP operations and error processing.</li>
  <li><strong>widgets</strong>: Custom components like <code>CenteredMessage</code>, <code>CenteredProgress</code>, <code>ChipDate</code>, and <code>Rate</code> used in the UI.</li>
</ul>

<h2>Prerequisites</h2>
<ul>
  <li><strong>Flutter SDK</strong>: Ensure you have the Flutter SDK installed. Follow <a href="https://docs.flutter.dev/get-started/install">this guide</a> for installation instructions.</li>
  <li><strong>TMDb API Key</strong>: Accessing the TMDb API requires an API key. Sign up on <a href="https://www.themoviedb.org/">TMDb</a> and get your API key.</li>
  <li><strong>DeepL API Key</strong>: Required for the synopsis translation feature. Sign up on <a href="https://www.deepl.com/">DeepL</a> to get your API key.</li>
</ul>

<h2>Technologies Used</h2>
<ul>
  <li>Flutter</li>
  <li>Dart</li>
  <li>HTTP</li>
  <li>External API (The Movie Database - TMDb, DeepL for translations)</li>
</ul>

<h3>Movie Search</h3>
<p>Enter a movie name in the search field to see a list of relevant results. Select a movie to view details.</p>

<h3>Synopsis Translation</h3>
<p>Use the translate button on the movie details page to translate the synopsis to your preferred language.</p>

<h3>Additional Notes</h3>
<p>The code contains comments in Portuguese to clarify specific functions and components.</p>
