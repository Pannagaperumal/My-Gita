# Blueprint

## Overview

The Bhagavad Gita Companion is a Flutter application designed to provide a comprehensive and user-friendly experience for reading and exploring the sacred text of the Bhagavad Gita. The app allows users to navigate through all 18 chapters, read individual verses, and save their favorite verses for future reference.

## Features

*   **Chapter Navigation:** The app presents a list of all 18 chapters of the Bhagavad Gita, allowing users to easily select and dive into any chapter.
*   **Verse Exploration:** Within each chapter, users can scroll through a list of all the verses. Tapping on a verse will take them to a detailed view.
*   **Detailed Verse View:** This screen displays the original Sanskrit text of the verse, along with its English translation, providing a deeper understanding of the text.
*   **Favorites:** Users can mark their favorite verses by tapping a heart icon on the verse detail screen. All favorited verses are saved in a separate list for easy access.
*   **Favorites Screen:** A dedicated screen displays all the user's favorite verses, allowing them to quickly revisit and reflect on the passages that resonate with them the most.

## Design

*   **Clean and Intuitive UI:** The app features a modern and minimalist design, with a focus on readability and ease of use. The layout is clean and uncluttered, allowing the user to focus on the text.
*   **Custom Fonts:** The app uses the `google_fonts` package to apply elegant and readable fonts, enhancing the overall user experience.
*   **Bottom Navigation:** A bottom navigation bar provides quick and easy access to the main sections of the app: the home screen (chapter list) and the favorites screen.

## Technical Details

*   **State Management:** The app uses the `provider` package for state management, which allows for efficient and organized handling of the app's data, particularly the list of favorite verses.
*   **API Integration:** The app now fetches data from the `bhagavad-gita3.p.rapidapi.com` API, which is a more reliable and robust data source. An `ApiService` is responsible for all network requests, ensuring a clear separation of concerns.
*   **Asynchronous Operations:** The app uses `FutureBuilder` to handle asynchronous operations, providing a smooth user experience while data is being fetched from the API.
*   **Data Models:** The app uses a `Verse` model to represent the data for each verse, ensuring that the data is structured and easy to work with.
*   **Internet Permission:** The app now requests the `android.permission.INTERNET` permission in the `AndroidManifest.xml` file, which is required to access the internet.
*   **Error Handling:** The `ApiService` and `ChapterScreen` now have improved error handling, which will provide more informative error messages to help diagnose issues with the API key or network connection.

## Current Plan

*   **Fix API Errors:** The previous API was unreliable and would often return HTML instead of JSON, causing the app to crash. The app now uses a more stable RapidAPI endpoint.
*   **Update Data Models:** The `Verse` model has been updated to match the response structure of the new API.
*   **Add Internet Permission:** The app now requests the necessary internet permission, which should resolve the "connect to the internet" error.
*   **Improve Error Handling:** The app will now provide more specific error messages to help diagnose the persistent network issues.
*   **Update API Key:** The correct API key has been added to the `api_service.dart` file.
*   **Add Favorite Button:** A favorite button has been added to the `VerseScreen` to allow users to add or remove verses from their favorites list.