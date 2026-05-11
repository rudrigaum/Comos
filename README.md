# Cosmos 🌌

An iOS application built to explore the NASA Astronomy Picture of the Day (APOD) API. This project serves as a showcase of advanced iOS architecture and modern Swift development practices.

## 🏗️ Architecture: VIPER

This project strictly adheres to the **VIPER** (View, Interactor, Presenter, Entity, Router) architectural pattern to ensure a clean separation of concerns.

- **ViewCode:** 100% programmatic UI (No Storyboards or XIBs).
- **Concurrency:** Modern Swift Concurrency (`async/await`) for network operations.
- **Dependency Injection:** Handled manually via Routers.
- **Unit Testing:** Comprehensive test coverage using Spies and Mocks for Interactors and Presenters.

## 🚀 Getting Started

1. Clone this repository.
2. Open `Cosmos.xcodeproj` in Xcode.
3. Build and Run (`Cmd + R`).

## 🧪 Testing

Unit tests are isolated in the `CosmosTests` target. To execute the test suite:
- Press **Cmd + U** to run all tests.

## 📄 License

This project is licensed under the MIT License.
