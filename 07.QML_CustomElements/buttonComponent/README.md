## Qt6 QML

### Create Buttons As Custom Component

-----------------

This QML code demonstrates two methods to create and use custom button components directly within a single QML file without relying on external files. The concepts include the `Component` element, `Loader` element, and inlined custom component definitions. Here's a detailed explanation of the code and the associated concepts:

------

### **Structure Overview**

1. **Method 1:** Using a `Component` element and dynamically loading it with a `Loader`.
2. **Method 2:** Defining an inline custom component (`MButton`) and instantiating it directly.

------

### **Concepts in the Code**

#### **1. `Component` Element**

- A reusable template for UI components.
- In Method 1, `Component` (`btnComponent`) defines a custom button design, including properties (`buttonText`), a signal (`btnClicked`), and its internal layout.

#### **2. `Loader` Element**

- Dynamically loads the `Component` at runtime.
- Allows customization of the loaded instance by accessing its properties and signals via `item`.

#### **3. Inline Component Definition**

- Using the `component` keyword, a custom component (`MButton`) is defined as an inline entity.
- It encapsulates the button logic, properties, and UI design, making it easy to reuse and customize in the layout.

------

### **Code Explain**

#### **Window**

- The root container, `Window`, represents the application window.
- It includes two layouts: a `Row` for Method 1 and a `Column` for Method 2.

#### **Method 1: Using `Component` with `Loader`**

```c++
Component {
    id: btnComponent
    Item { ... }
}
```

- Reusable Button Definition:
  - Encapsulates button layout in an `Item`.
  - Provides a `buttonText` property and a `btnClicked` signal.
  - Internally uses a `Rectangle` for styling and a `Text` element for the label.

```c++
Loader {
    id: firstBtn
    sourceComponent: btnComponent
    onLoaded: {
        var customBtn = firstBtn.item;
        customBtn.buttonText = "Button_1";
        customBtn.btnClicked.connect(function() {
            console.log("Button_1 Clicked");
        });
    }
}
```

- Dynamic Instantiation:
  - `Loader` loads the `btnComponent` at runtime.
  - Accesses the loaded instance (`item`) to set properties (`buttonText`) and connect to signals (`btnClicked`).

------

#### **Method 2: Inline Component Definition**

```c++
component MButton: Rectangle {
    id: btnId
    property alias buttonText: btnTxtId.text
    signal btnClicked
    ...
}
```

- Reusable Inline Component:
  - Uses the `component` keyword to define `MButton` directly within the file.
  - Represents a custom button with properties, signals, and a `Rectangle`-based design.

```c++
Column {
    spacing: 20
    y: 50
    MButton {
        buttonText: "Button_3"
        onBtnClicked: {
            console.log("Button_3 Clicked");
        }
    }
    MButton {
        buttonText: "Button_4"
        onBtnClicked: {
            console.log("Button_4 Clicked");
        }
    }
}
```

- Instantiation and Customization:
  - Inline `MButton` instances are directly added to the layout.
  - Their `buttonText` and `onBtnClicked` handlers are customized for each instance.

------

### **Concepts in Use**

#### **Property Alias**

- ```
  property alias buttonText: btnTxtId.text
  ```

  - Exposes the `Text` element's `text` property externally.
  - Allows the `buttonText` property to be used for setting or retrieving the button label.

#### **Signals**

- ```
  signal btnClicked
  ```

  - Custom signal emitted when the `MouseArea` detects a click.
  - Connected to handlers dynamically in Method 1 or inline in Method 2.

#### **Dynamic Layouts**

- `Row` and `Column` are used to organize buttons horizontally and vertically.
- These layouts ensure scalability and proper spacing.

#### **MouseArea**

- Used to capture clicks on the button's `Rectangle` area.
- Emits the `btnClicked` signal on click.

------

### **Comparison of Methods**

| Aspect            | Method 1                         | Method 2                     |
| ----------------- | -------------------------------- | ---------------------------- |
| **Reusability**   | Highly reusable (`Component`)    | Limited to inline definition |
| **Flexibility**   | Dynamically loaded with `Loader` | Direct instantiation         |
| **Customization** | Customizable at runtime          | Customizable inline          |
| **Performance**   | Suitable for dynamic use cases   | Efficient for static UI      |

------

### **Conclusion**

1. **Method 1** is ideal for cases where components need to be loaded dynamically or customized extensively at runtime.
2. **Method 2** is simpler and better suited for static or moderately customizable layouts.
3. Both approaches demonstrate how to create reusable, maintainable custom components in QML.
