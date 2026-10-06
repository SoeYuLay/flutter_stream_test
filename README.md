# Flutter Streams

A hands-on learning and experimental repository for exploring **Streams and Reactive Programming in Flutter & Dart**.

This repository contains practical code examples, and sample UI widgets built while working through stream concepts and reactive data patterns in Flutter.

---

## 📚 Reference Guide

The implementations and stream patterns in this project are based on the article:
* 📖 **[How to Use Streams in Flutter](https://www.freecodecamp.org/news/how-to-use-streams-in-flutter/)** by Atuoha Anthony on *freeCodeCamp*.

---

## 🚀 Key Concepts Covered

This repository contains code examples and mini-demos for:

### 1. Core Stream Mechanics
* **`StreamController`**: Creating, managing, and sending data/errors down a stream.
* **Single-Subscription Streams**: Basic event listeners using `.listen()`.
* **Broadcast Streams**: Using `.broadcast()` to allow multiple UI widgets or listeners to receive the same data stream.
* **Stream Lifecycle**: Proper resource cleanup using `.close()` inside stateful widgets.

### 2. Stream Transformations & Async Generators
* Modifying stream data on the fly using operators like `.map()`, `.where()`, `.take()`, and `.skip()`.
* Emitting asynchronous stream sequences using `async*` and `yield`.

### 3. Flutter Reactive UI (`StreamBuilder`)
* Rebuilding UI dynamically using `StreamBuilder`.
* Handling connection states:
    * `ConnectionState.waiting` (showing progress indicators).
    * `ConnectionState.active` (rendering continuous live updates).
    * `ConnectionState.done` (handling completed streams).
* Displaying error states gracefully with `snapshot.hasError`.

---