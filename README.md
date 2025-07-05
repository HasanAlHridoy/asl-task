# ASL Task App

The **ASL Task** Flutter app is designed to manage posts, with features like adding, editing, and viewing posts on the homepage. The app uses **Riverpod** for state management and **Dio** for API requests. Local memory is used to simulate data persistence. 

## Setup Instructions

To get started with the ASL Task app, follow the steps below:

Features and Functionality
Homepage:

Fetch all posts and display them with the total post count.

A search bar is included to filter through posts.

A button in the top right corner navigates to the Add Post page.

Floating Action Button:

The floating button allows you to add new posts.

Add/Edit Page:

On the Add/Edit page, you can see all posts and also edit them using the local memory storage simulation.

Local Memory:

Post data is stored temporarily in local memory to simulate data persistence.

Dio API:

Dio is used for API requests, and shared functions are utilized for modularity.

State Management Approach
The app utilizes Riverpod for state management, which provides a simple and flexible way to manage state. Key points about the approach:

State Management:
Riverpod is used to manage app state for posts, search functionality, and user interactions. Each feature is managed using dedicated providers (like fetching posts, adding new posts, etc.).

Async Operations:
Riverpod's FutureProvider and StateNotifierProvider are used to handle asynchronous operations, such as fetching data from the API or managing UI state.

Separation of Concerns:
The project is structured in such a way that each feature (like post management, adding new posts, etc.) has its own provider, which makes the code clean and scalable.

Migration Approach
Downgrade to Flutter 3.0.0
Issue Faced: Initially, the project was on a higher Flutter version. When I downgraded to Flutter 3.0.0, I faced issues with the packages.

Solution: Downgraded the environment and package versions to match Flutter 3.0.0. The app worked fine after the adjustment.

Migration to Latest Flutter Version
Issue Faced: After upgrading to the latest Flutter version, the project did not run due to outdated dependencies.

Solution: Upgraded the Flutter environment and all packages to their latest versions. The app successfully ran after the migration.

Migration Notes
Downgraded Flutter version to 3.0.0 using FVM and resolved compatibility issues with dependencies.

Upgraded the project to the latest Flutter version, and updated packages to ensure compatibility with the new Flutter environment.

Created a MIGRATION_NOTES.md file detailing the issues and steps involved in both downgrading and migrating the Flutter version.

MIGRATION_NOTES.md
The MIGRATION_NOTES.md file contains all the specific details about:

The issues faced during both the downgrade and migration processes.

The steps to fix the issues related to dependencies.

The final solution which allowed the app to run smoothly on the latest Flutter version.

Conclusion
By following the above setup instructions, you will be able to run the ASL Task app on your local machine. The app's structure is flexible and can be easily scaled to include additional features. The state management approach using Riverpod makes the app highly maintainable and scalable.

Feel free to explore the app, make any enhancements, and contribute if necessary.