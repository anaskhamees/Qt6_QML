# Qt6 QML Data Types
Qt 6 QML offers a wide variety of built-in data types for creating dynamic and interactive user interfaces. Here’s a comprehensive list of QML data types:

------

### **Basic Data Types**

1. **bool**: Represents a boolean value (`true` or `false`).
   - Example: `property bool isVisible: true`
2. **int**: Represents an integer value.
   - Example: `property int counter: 42`
3. **double**: Represents a double-precision floating-point number.
   - Example: `property double ratio: 3.14159`
4. **real**: Represents a floating-point number (alias for `double`).
   - Example: `property real width: 128.5`
5. **string**: Represents a sequence of characters (text).
   - Example: `property string title: "Hello, QML"`
6. **url**: Represents a URL.
   - Example: `property url imageSource: "images/picture.png"`
7. **var**: Represents a dynamically typed variable (can hold any type).
   - Example: `property var data: { key: "value", number: 10 }`

------

### **Color and Gradient Types**

1. **color**: Represents a color in various formats (name, hex, or RGB).

   - Example: `property color backgroundColor: "red"`

2. **gradient**: Represents a linear or radial gradient.

   - Example:

     ```c++
     property gradient backgroundGradient: Gradient {
         GradientStop { position: 0; color: "red" }
         GradientStop { position: 1; color: "blue" }
     }
     ```

------

### **Geometric Types**

1. **point**: Represents a 2D point (x, y).
   - Example: `property point position: Qt.point(10, 20)`
2. **size**: Represents a 2D size (width, height).
   - Example: `property size rectangleSize: Qt.size(100, 200)`
3. **rect**: Represents a rectangle (x, y, width, height).
   - Example: `property rect bounds: Qt.rect(10, 10, 100, 50)`
4. **vector2d**: Represents a 2D vector.
   - Example: `property vector2d direction: Qt.vector2d(1, 0)`
5. **vector3d**: Represents a 3D vector.
   - Example: `property vector3d position: Qt.vector3d(1, 2, 3)`
6. **vector4d**: Represents a 4D vector.
   - Example: `property vector4d quaternion: Qt.vector4d(1, 2, 3, 4)`

------

### **Date and Time Types**

1. **date**: Represents a date (year, month, day).
   - Example: `property date today: Qt.formatDate(new Date(), "yyyy-MM-dd")`
2. **time**: Represents a time (hour, minute, second).
   - Example: `property time now: Qt.formatTime(new Date(), "hh:mm:ss")`
3. **datetime**: Represents both date and time.
   - Example: `property datetime timestamp: Qt.formatDateTime(new Date())`

------

### **JavaScript-Specific Types**

1. **array**: Represents a JavaScript array.
   - Example: `property var numbers: [1, 2, 3]`
2. **object**: Represents a JavaScript object.
   - Example: `property var config: { name: "Qt", version: 6 }`

------

### **QML-Specific Types**

1. **font**: Represents a font description.

   - Example: `property font titleFont: { family: "Arial"; pixelSize: 20 }`

2. **enum**: Represents enumerations.

   - Example:

     ```c++
     property alias alignment: Qt.AlignHCenter | Qt.AlignVCenter
     ```

3. **item**: Represents a reference to an `Item` type.

   - Example: `property Item parentItem: myRectangle`

4. **component**: Represents a reusable QML component.

   - Example:

     ```c++
     Component {
         id: myButton
         Rectangle { width: 100; height: 50; color: "blue" }
     }
     ```

------

### **Other Types**

1. **locale**: Represents locale-specific data like numbers or dates.
   - Example: `property var currentLocale: Qt.locale("en_US")`
2. **sizeF**: Represents a floating-point size (width, height).
   - Example: `property sizeF screenSize: Qt.sizeF(640.5, 480.2)`
3. **matrix4x4**: Represents a 4x4 transformation matrix.
   - Example: `property var matrix: Qt.matrix4x4()`
4. **quaternion**: Represents a quaternion for 3D rotations.
   - Example: `property var rotation: Qt.quaternion(1, 0, 0, 0)`

------

### **Dynamic Meta-Types**

1. **QtObject**: Represents a generic QML object.
   - Example: `QtObject { property int count: 0 }`
2. **list<type>**: Represents a list of objects of a specific type.
   - Example: `property list<Item> items`

------

### **Custom Types**

You can create custom data types in QML or register them in C++ for use in QML.

------

### **Type Conversion**

Qt provides utility functions for converting between types:

- `Qt.rect()`, `Qt.size()`, `Qt.vector3d()`, etc.
