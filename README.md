# 📝 Task Manager App

A sleek and user-friendly Flutter application to efficiently manage tasks. The app offers features to add, edit, delete, and view tasks, all with an intuitive interface and persistent data storage.

---

## 🚀 Features

- 🆕 **Add Tasks**: Add tasks with a title, description, and due date.
- ✏️ **Edit Tasks**: Update existing tasks to keep them up-to-date.
- ❌ **Delete Tasks**: Remove tasks with a simple swipe gesture.
- 💾 **Persistent Storage**: Tasks are saved locally using SQLite, ensuring data is retained even after the app is closed.
- 🎨 **Modern UI**: A polished and responsive interface following Material Design principles.

---

## 📂 Core Files

| File                     | Description                                                                 |
|--------------------------|-----------------------------------------------------------------------------|
| `task_model.dart`        | Defines the `Task` model with fields for `id`, `title`, `description`, and `dueDate`. |
| `task_database_helper.dart` | Handles database operations (CRUD) using SQLite for persistent storage.      |
| `task_list_page.dart`    | Displays the list of tasks with swipe-to-delete functionality.               |
| `add_task_page.dart`     | Provides a form to add new tasks.                                            |
| `edit_task_page.dart`    | Provides a form to edit existing tasks.                                      |

---

## 🛠️ How to Use

### ➕ Add a Task
1. Tap the **Floating Action Button (FAB)** on the Task List screen.
2. Fill in the task details (title, description, due date).
3. Tap **Save Task** to add it to the list.

### ✏️ Edit a Task
1. Tap on a task from the list.
2. Modify the details in the form.
3. Tap **Update Task** to save the changes.

### ❌ Delete a Task
1. Swipe a task to the left to delete it.
2. Confirm the deletion using the **Snackbar prompt**.

---

## 🛑 Prerequisites

- **Flutter SDK** (>=3.x.x)
- **Dart SDK**
- IDE: [Android Studio](https://developer.android.com/studio) or [Visual Studio Code](https://code.visualstudio.com/)

---

## 📦 Technologies Used

| Technology        | Description                                |
|--------------------|--------------------------------------------|
| **Flutter**        | Frontend framework for building cross-platform apps. |
| **SQLite**         | Local database for persistent task storage. |
| **Material Design**| Ensures a modern and user-friendly UI.    |

---




