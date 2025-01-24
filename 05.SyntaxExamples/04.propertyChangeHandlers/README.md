# Qt6 QML
### Property Change Handlers

---------

In Qt 6 QML, **property change handlers** are special JavaScript functions that are triggered automatically whenever a particular property changes its value. They provide a way to respond to changes in properties dynamically and are commonly used to update the UI or trigger custom logic in response to data updates.

------

### **How Property Change Handlers Work**

1. A property change handler is named in the form of:

   ```js
   on<PropertyName>Changed
   ```

   - Replace `<PropertyName>` with the name of the property.
   - The first letter of `<PropertyName>` is capitalized.

2. The handler is automatically invoked whenever the associated property changes.

------

### **Syntax**

```js
property type propertyName: initialValue

onPropertyNameChanged: {
    // Code to execute when propertyName changes
}
```

------

### **Example**

```c++
import QtQuick 
import QtQuick.Controls 

ApplicationWindow {
    width: 400
    height: 200
    visible: true
    title: "Property Change Handler Example"

    // Define a custom property
    property string message: "Hello, World!"

    // React to changes in the 'message' property
    onMessageChanged: {
        console.log("The message property has changed to:", message)
    }

    Column {
        anchors.centerIn: parent
        spacing: 10

        Text {
            text: message
            font.pixelSize: 20
        }

        Button {
            text: "Change Message"
            onClicked: {
                message = "Message updated at " + new Date().toLocaleTimeString()
            }
        }
    }
}
```

### **How It Works**

1. The `message` property is defined with an initial value `"Hello, World!"`.
2. A property change handler `onMessageChanged` is defined. It logs a message to the console whenever `message` changes.
3. Clicking the button updates the `message` property, triggering the handler and updating the `Text` component.

------

### **Common Use Cases**

1. **Updating UI Elements**: Automatically update one part of the UI when another part changes.
2. **Validation**: Validate the new value of a property and enforce constraints or trigger side effects.
3. **Logging and Debugging**: Track changes in properties for debugging purposes.
4. **Animation**: Start animations in response to property changes.

------

#### Examples 

------

### **1. `onWidthChanged`**

Triggered whenever the `width` property of an item changes.

#### Example:

```c++
Rectangle {
    id: rect
    width: 100
    height: 100
    color: "blue"

    onWidthChanged: {
        console.log("Width changed to:", width);
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.width += 20;  // Increase width by 20 on click
        }
    }
}
```

------

### **2. `onHeightChanged`**

Triggered whenever the `height` property of an item changes.

#### Example:

```c++
Rectangle {
    id: rect
    width: 100
    height: 100
    color: "green"

    onHeightChanged: {
        console.log("Height changed to:", height);
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.height += 20;  // Increase height by 20 on click
        }
    }
}
```

------

### **3. `onColorChanged`**

Triggered whenever the `color` property of an item changes.

#### Example:

```c++
Rectangle {
    id: rect
    width: 100
    height: 100
    color: "red"

    onColorChanged: {
        console.log("Color changed to:", color);
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.color = rect.color === "red" ? "yellow" : "red";
        }
    }
}
```

------

### **4. `onRadiusChanged`**

Triggered whenever the `radius` property of a `Rectangle` changes (for rounded corners).

#### Example:

```c++
Rectangle {
    id: rect
    width: 200
    height: 100
    color: "purple"
    radius: 0

    onRadiusChanged: {
        console.log("Radius changed to:", radius);
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.radius = rect.radius === 0 ? 50 : 0;  // Toggle between rounded and square corners
        }
    }
}
```

------

### **Combining Property Handlers**

You can use multiple property change handlers in a single item to handle changes to various properties.

#### Example:

```c++
Rectangle {
    id: rect
    width: 100
    height: 100
    color: "blue"
    radius: 0

    onWidthChanged: console.log("Width is now", width);
    onHeightChanged: console.log("Height is now", height);
    onColorChanged: console.log("Color is now", color);
    onRadiusChanged: console.log("Radius is now", radius);

    MouseArea {
        anchors.fill: parent
        onClicked: {
            rect.width += 20;
            rect.height += 10;
            rect.color = rect.color === "blue" ? "green" : "blue";
            rect.radius = rect.radius === 0 ? 25 : 0;
        }
    }
}
```

------

### **Dynamic and Responsive Behavior**

Using property change handlers, you can implement dynamic behavior like resizing UI elements, starting animations, or even performing calculations in response to property changes.

#### Example of Responsive Behavior:

```c++
Rectangle {
    width: parent.width / 2
    height: parent.height / 2
    color: "orange"

    onWidthChanged: console.log("Rectangle resized to width:", width);
    onHeightChanged: console.log("Rectangle resized to height:", height);

    Component.onCompleted: {
        // Simulate resizing parent
        parent.width = 400;
        parent.height = 300;
    }
}
```

------

### **Important Points**

1. **Efficient Updates**: These handlers are only invoked when the property value actually changes.
2. **Declarative Nature**: Use these handlers to keep your UI logic clean and tied to property changes.
3. **Avoid Long Operations**: Keep handlers lightweight to avoid blocking the UI thread.

By using property change handlers for `width`, `height`, `color`, `radius`, and other properties, you can create highly dynamic and interactive QML applications.
