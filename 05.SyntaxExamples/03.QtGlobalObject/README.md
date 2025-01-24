# Qt6 QML Qt Global Object 
The `Qt` global object in QML is a singleton that provides access to useful functions, enums, and properties commonly used in Qt applications. It's part of the `QtQuick` module and includes various utility functions that simplify tasks like date/time formatting, object creation, color manipulation, and more. Here's a breakdown of its key members:

### Properties

- **application**: Provides access to global application state properties such as whether the application is active or not.
- **inputMethod**: Exposes the QInputMethod object, which is useful for input-related functionalities.
- **platform**: Provides information about the platform the application is running on, like OS type (e.g., Windows, Linux, Android).
- **styleHints**: Provides platform-specific style hints and settings.
- **uiLanguage**: Holds the language used for UI string translations.
- More and More

### Methods

- **color functions**: Methods like `Qt.rgba()`, `Qt.hsla()`, `Qt.darker()`, `Qt.lighter()`, etc., for working with colors.
- **Date/Time formatters**: Methods for formatting date and time values, such as `Qt.formatDateTime()`, `Qt.formatDate()`, and `Qt.formatTime()`.
- **Dynamic Object Creation**: Functions like `Qt.createComponent()` and `Qt.createQmlObject()` allow dynamic creation of QML components or objects from QML files or strings.
- **Binding**: `Qt.binding()` enables creating a dynamic binding for a QML property.
- **Hex encoding/decoding**: `Qt.btoa()` and `Qt.atob()` are used to encode and decode data in Base64 format.
- **Locale**: Access locale-related settings via `Qt.locale()`.
- **Miscellaneous**: Other useful functions like `Qt.md5()` for MD5 hash generation, `Qt.quit()` to quit the application, and `Qt.openUrlExternally()` to open URLs in an external browser.

### Enums and Types

- **Enums**: Enums available in the Qt namespace, e.g., `Qt.LeftButton`, `Qt.RightButton`.
- **Types**: Helper functions for creating Qt value types like `color`, `font`, `vector2d`, `size`, `rect`, and more.

### Example Usage

```c++
import QtQuick
Rectangle {
    width: 300; height: 55
    color: Qt.application.active ? "white" : "lightgray"
    Text {
        text: "Application " + (Qt.application.active ? "active" : "inactive")
        opacity: Qt.application.active ? 1.0 : 0.5
        anchors.centerIn: parent
    }
}
```

This example demonstrates using the `Qt.application.active` property to change the UI's appearance based on whether the application is active.

The `Qt` global object is a powerful utility that simplifies many common tasks in QML development. It is especially useful for tasks related to UI design, application state management, and dynamic object creation.

```c++
import QtQuick 

Window {
    width: 640
    height: 480
    visible: true
    title: "Qt Global Example"

    // Accessing Qt's application state
    Rectangle {
        width: 640
        height: 100
        color: Qt.application.active ? "green" : "red"

        Text {
            anchors.centerIn: parent
            text: Qt.application.active ? "Application is Active" : "Application is Inactive"
            color: "white"
        }
    }

    // Using Qt's color functions
    Rectangle {
        width: 200
        height: 200
        color: Qt.darker(Qt.rgba(1, 0, 0, 1), 1.5)
        radius: 10
        anchors.top: parent.top
        anchors.topMargin: 120
        anchors.left: parent.left
        anchors.leftMargin: 20
    }

    // Formatting Date/Time using Qt
    Rectangle {
        width: 640
        height: 100
        color: "lightgray"
        anchors.top: parent.top
        anchors.topMargin: 350

        Text {
            anchors.centerIn: parent
            text: Qt.formatDateTime(new Date(), "yyyy-MM-dd HH:mm:ss")
            font.bold: true
        }
    }

    // Dynamic QML Object Creation using Qt.createQmlObject
    Component.onCompleted: {
        var dynamicComponent = Qt.createQmlObject('import QtQuick 2.0; Rectangle { width: 100; height: 100; color: "blue" }', parent);
        dynamicComponent.x = 300;
        dynamicComponent.y = 300;
    }

    // MD5 hashing example using Qt.md5
    Text {
        anchors.top: parent.top
        anchors.topMargin: 470
        text: "MD5 of 'Hello, World!': " + Qt.md5("Hello, World!")
        font.pixelSize: 20
    }
}
```

### What this example does:

1. **Application State**:
   - It checks if the application is active or inactive using `Qt.application.active` and changes the color of a rectangle accordingly.
2. **Color Functions**:
   - The example uses `Qt.rgba()` to create a red color and applies `Qt.darker()` to create a darker shade of red for a rectangle.
3. **Date/Time Formatting**:
   - It shows the current date and time formatted using `Qt.formatDateTime()`.
4. **Dynamic Object Creation**:
   - Using `Qt.createQmlObject()`, a new rectangle is dynamically created when the application starts.
5. **MD5 Hashing**:
   - It demonstrates generating an MD5 hash of the string `"Hello, World!"` using `Qt.md5()`.

This example showcases how the `Qt` global object can be utilized for various tasks like checking application state, manipulating colors, formatting dates, creating objects dynamically, and generating hashes in a QML application.
