# 🏛️ Cosmos Architecture: VIPER

This project strictly follows the **VIPER** architecture to ensure separation of concerns, testability, and maintainability.

## Components

- **V**iew: Passive layer. Only displays data and routes user interactions to the Presenter. Built 100% programmatically (ViewCode) without Storyboards.
- **I**nteractor: Contains the core business and network logic. Uses modern Swift Concurrency (`async/await`). strictly isolated from `UIKit`.
- **P**resenter: The "brain" of the UI. Receives data from the Interactor, formats it, and commands the View.
- **E**ntity: Plain data structures (Structs/Codable) representing the domain models.
- **R**outer: Handles all navigation and is responsible for Module Assembly (Dependency Injection).

## Memory Management (Retain Cycles)

To prevent memory leaks, modules must strictly adhere to these reference rules:

- View -> Presenter (**Strong**)
- Presenter -> View (**Weak**)
- Presenter -> Interactor (**Strong**)
- Interactor -> Presenter (**Weak**)
- Presenter -> Router (**Strong**)
- Router -> ViewController (**Weak**)

## Communication

All communication between layers is done through **Protocols** (Contracts). This allows for easy mocking and robust Unit Testing.
