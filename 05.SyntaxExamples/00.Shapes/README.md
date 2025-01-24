# Qt6 QML Syntax
-----------------

#### Table Of Contents

- **Elements Hierarchy**
- **Shapes (Rectangles and Circles)**
- **Elements Dimensions**
- **Elements Positioning**
- **Elements Sharpness**
- **Elements Spacing**
- **Event Handling (Responding)** = **MouseArea**
- **QML Properties**
- **QML Refactoring**

------------------------------------------------

## **QML Shapes Application**

```c++
import QtQuick

Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("Shapes Application")
    property string welcomTxt1: "Hello"
    property string welcomTxt2: "World"
    property string welcomTxt3: "!"
    property string myName1:"Anas"
    property string myName2:"Khamees"

    Row{
        spacing: 15
        anchors.centerIn: parent
        Rectangle{
            id:redRectId
            width: 100
            height: 100
            color: "red"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 10
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "blue"
            border.width: 10
           // anchors.centerIn: parent
            Text {
                id: redRectTxtID
                anchors.centerIn:parent
                text: welcomTxt1
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Red Rectangle")
                    parent.color= "black"
                }
            }
        }

        Rectangle{
            id:greenRectId
            width: 100
            height: 100
            color: "green"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 10
            antialiasing : false //for smoother edge curves in Rect corners
            border.color: "gray"
            border.width: 10
            Text {
                id: greenRectTxtID
                anchors.centerIn:parent
                text: welcomTxt2
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Green Rectangle")
                    parent.color= "black"

                }


            }
        }

        Rectangle{
            id:blueRectId
            width: 100
            height: 100
            color: "blue"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 10
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "yellow"
            border.width: 10
            Text {
                id: blueRectTxtID
                anchors.centerIn:parent
                text: welcomTxt3
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Blue Rectangle")
                    parent.color= "black"

                }


            }
        }

        Rectangle{
            id:roundedRectId
            width: 100
            height: 100
            color: "purple"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 25
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "gray"
            border.width: 10

            Text {
                id: roundedTxtID
                anchors.centerIn:parent
                text: myName1
            }
            MouseArea{
                anchors.fill: parent //telling the MouseArea element to fill the Rectangle that contains it.
                onClicked:
                {
                    console.log("Clicked on the Purple Reounded Rectangle")
                    parent.color= "black"

                }


            }
        }

        Rectangle{

            id:circleID
            width: 100
            height: 100
            color: "pink"
          // Positioning methods
            /*x:50
              y:50*/
            radius: 100
            antialiasing : true //for smoother edge curves in Rect corners
            border.color: "black"
            border.width: 10
            Text {
                id: circleTxtID
                anchors.centerIn:parent
                text: myName2
            }
            MouseArea{
                anchors.fill: parent
                onClicked:{
                    console.log("Clicked on the Pink Circle")
                    parent.color= "black"
                }
            }
        }
    }

}

```



### **1. Elements Hierarchy**

- The root element is a `Window`, which is the main container for the application.
- Inside the `Window`, a `Row` element is used to horizontally arrange child elements (rectangles and circles).
- Each shape (`Rectangle`) contains:
  - A `Text` element for displaying text inside the shape.
  - A `MouseArea` element to handle click interactions.

------

### **2. Shapes (Rectangles and Circles)**

- Rectangle:
  - Standard shape in QML with properties like `width`, `height`, `color`, `radius`, and `border`.
  - Example: A red rectangle (`redRectId`) with rounded corners (`radius: 10`) and a blue border.
- Circle:
  - A `Rectangle` with `radius` equal to half or more of its width/height acts as a circle.
  - Example: A pink circle (`circleID`) with `radius: 100`.

------

### **3. Elements Dimensions**

- Defined using the `width`and `height` properties for each shape.
  - Example: All shapes have `width: 100` and `height: 100`.
- The dimensions ensure uniformity across the application.

------

### **4. Elements Positioning**

- Positioning is primarily controlled using anchors:
  - `anchors.centerIn: parent`: Centers the child element within its parent.
- Alternatively, absolute positioning (`x` and `y`) can be used (commented out in this code).

------

### **5. Elements Sharpness**

- Controlled using the `antialiasing` property:
  - `true`: Enables smooth edges for shapes.
  - `false`: May result in jagged edges.
- Example:
  - `redRectId` has `antialiasing: true`.
  - `greenRectId` has `antialiasing: false`.

------

### **6. Elements Spacing**

- The `Row`element uses the `spacing`

   property to define the gap between child elements.

  - Example: `Row { spacing: 15 }` ensures 15 pixels of space between shapes.

------

### **7. Event Handling (Responding)**

- MouseArea is used to handle click events for each shape.

  - ```
    onClicked
    ```

     signal is implemented to:

    - Log a message in the console.
    - Change the color of the clicked shape to black.

  - Example:

    ```c++
    MouseArea {
        anchors.fill: parent
        onClicked: {
            console.log("Clicked on the Red Rectangle")
            parent.color = "black"
        }
    }
    ```

------

### **8. QML Properties**

- Custom properties are defined in the `Window` element to manage text dynamically:

  - Example:

    ```c++
    property string welcomTxt1: "Hello"
    property string welcomTxt2: "World"
    property string welcomTxt3: "!"
    ```

  - These properties are bound to the `Text` elements inside shapes for dynamic updates.

------

### **9. QML Refactoring**

- The code is modular and reusable:
  - Each shape has its own `Rectangle` block with its properties, making it easy to add or modify shapes.
  - Consistent use of anchors and `MouseArea` ensures clean and maintainable layout.
  - Dynamic text properties (`welcomTxt1`, `welcomTxt2`, etc.) simplify text management across shapes.

------

### **Detailed Examples from the Code**

1. **Rectangle with Rounded Corners**:

   ```c++
   Rectangle {
       id: redRectId
       width: 100
       height: 100
       color: "red"
       radius: 10
       antialiasing: true
       border.color: "blue"
       border.width: 10
   }
   ```

2. **Circle**:

   ```c++
   Rectangle {
       id: circleID
       width: 100
       height: 100
       color: "pink"
       radius: 100
       antialiasing: true
       border.color: "black"
       border.width: 10
   }
   ```

3. **Dynamic Text Binding**:

   ```c++
   Text {
       id: redRectTxtID
       anchors.centerIn: parent
       text: welcomTxt1
   }
   ```

4. **MouseArea for Interaction**:

   ```c++
   MouseArea {
       anchors.fill: parent
       onClicked: {
           console.log("Clicked on the Red Rectangle")
           parent.color = "black"
       }
   }
   ```

