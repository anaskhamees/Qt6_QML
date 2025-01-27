# Qt6 QML
### Custome Components

## 

### **Overview**

This app demonstrates how to create a reusable custom component (`MButton`) using QML's basic components like `Item`, `Rectangle`, and `Text`. The `MButton` encapsulates styling, text display, and interaction, while exposing properties and signals for easy customization and use.



### **File 1: `main.qml`**

This file is the entry point of the application. It defines a `Window` with a vertical layout (`Column`) containing two instances of the custom `MButton` component.

#### **Code**:

```c++
import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Custom Components App")

    Column {
        spacing: 2 // Sets vertical spacing between components

        // First Button
        MButton {
            id: button1Id
            buttonText: "Button_1" // Sets the text for the button
            onBtnClicked: { // Handles the button click signal
                console.log("Button_1 Clicked")
            }
        }

        // Second Button
        MButton {
            id: button2Id
            buttonText: "Button_2" // Sets the text for the button
            onBtnClicked: {
                console.log("Button_2 Clicked")
            }
        }
    }
}
```

1. **Window:**
   - The main container for the application.
   - Includes properties like `width`, `height`, and `title`.
2. **Column:**
   - Arranges child components vertically.
   - `spacing` ensures a gap between buttons.
3. **MButton Component:**
   - Two instances of the custom button (`button1Id`, `button2Id`).
   - The `buttonText` property customizes each button's label.
   - The `onBtnClicked` handler connects to the `btnClicked` signal of the `MButton` component, enabling interactivity.

------

### **File 2: `MButton.qml`**

This file defines the reusable `MButton` component.

```c++
import QtQuick

Item {
    id: rootId // Root ID for the custom component

    // Exposed property to customize the button text
    property alias buttonText: btnTxtId.text

    // Width and height match the Rectangle dimensions
    width: btnId.width
    height: btnId.height

    // Signal emitted when the button is clicked
    signal btnClicked

    Rectangle {
        id: btnId
        width: btnTxtId.implicitWidth + 10 // Adjust size based on text
        height: btnTxtId.implicitHeight + 10
        color: "red" // Button background color
        border {
            color: "blue" // Border color
            width: 5 // Border thickness
        }

        Text {
            id: btnTxtId
            text: qsTr("Button") // Default text for the button
            anchors.centerIn: parent // Centers the text in the button
        }

        MouseArea {
            anchors.fill: parent // Covers the entire button area
            onClicked: {
                rootId.btnClicked() // Emit the `btnClicked` signal
            }
        }
    }
}
```

1. **Root `Item`:**
   - The container for the button's elements.
   - Exposes properties (`buttonText`) and signals (`btnClicked`).
2. **Property Alias (`buttonText`):**
   - Maps the `btnTxtId.text` property of the `Text` element.
   - Allows customization of the button label from outside the component.
3. **Signal (`btnClicked`):**
   - Defines an event triggered when the button is clicked.
   - Connected to the `MouseArea`'s `onClicked` handler.
4. **Dynamic Sizing:**
   - The button's `width` and `height` are automatically calculated based on the text size (`btnTxtId.implicitWidth` and `btnTxtId.implicitHeight`).
5. **MouseArea:**
   - Detects user interactions.
   - Triggers the `btnClicked` signal when clicked.

------

### **Data Exposure**

#### **Exposed Properties:**

- `buttonText`:
  - Exposes the button label (`btnTxtId.text`) to the outside world.
  - Allows customization of the text shown on the button.

#### **Exposed Signals:**

- `btnClicked`:
  - Emitted when the button is clicked.
  - Enables the parent (e.g., `main.qml`) to handle button clicks.

------

### **How it Works:**

1. **Button Text Customization:**

   - The `buttonText`property is set in `main.qml`for each button:

     ```c++
     buttonText: "Button_1"
     buttonText: "Button_2"
     ```

   - This updates the text displayed on each button.

2. **Handling Click Events:**

   - The `onBtnClicked`signal handler is defined in `main.qml`:

     ```c++
     onBtnClicked: {
         console.log("Button_1 Clicked")
     }
     ```

   - When a button is clicked, the `btnClicked` signal is emitted, and the corresponding handler executes.

3. **Automatic Sizing:**

   - The button adjusts its size dynamically based on the text dimensions:

     ```c++
     width: btnTxtId.implicitWidth + 10
     height: btnTxtId.implicitHeight + 10
     ```

------

### **Improvements:**

- **Customizable Colors:** Add properties for `backgroundColor` and `borderColor` to make the button more versatile.
- **Default Width and Height:** Provide fallback values in case text is not specified.
- **Hover/Press Effects:** Add visual feedback (e.g., color changes) for hover and press states.

------

### **Output:**

- Two Custom Buttons:
  - Red rectangles with blue borders.
  - Text labels "Button_1" and "Button_2."
  - Log messages in the console when clicked.

This code effectively demonstrates the creation of reusable components and how to expose data (properties/signals) for customization and interaction.
