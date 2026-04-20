import QtQuick
import QtQuick.Controls
Window {
    visible: true
    width: 400
    height: 300

    Column {
        spacing: 20
        anchors.centerIn: parent

        Text {
            text: "Counter: " + Counter.counter
            font.pixelSize: 24
        }

        Button {
            text: "Increment"
            onClicked: Counter.increment()
        }
    }
}

/*
========================================
 Qt QML_SINGLETON Execution Flow
========================================

STEP 1: moc generates meta-data
---------------------------------
Your class is registered in Qt's Meta-Object System:

- class name     = Counter
- properties     = counter
- methods        = increment()

This is done by the moc (Meta-Object Compiler) at build time.


STEP 2: QML module registration (CMake / QML system)
----------------------------------------------------
Because of QML_ELEMENT:

 Qt registers the class into the QML type system

So QML now knows this type exists:

    Counter


STEP 3: Singleton creation (critical step)
------------------------------------------
Because of QML_SINGLETON:

 Qt guarantees ONLY ONE instance of this class exists

Internally:

- Counter instance is created ONCE
- Stored inside the QML engine
- Managed globally by Qt runtime


STEP 4: QML engine exposes it globally
--------------------------------------
Qt automatically injects it into the QML namespace:

    Counter → singleton instance reference

So in QML:

    Counter.counter

means: globalSingletonInstance.counter


STEP 5: Key Insight
-------------------
- You are NOT creating an object in QML
- You are accessing a Qt-managed global singleton instance


STEP 6: Internal Qt flow (conceptual)
-------------------------------------
QML Engine startup
        ↓
Detect QML_SINGLETON type
        ↓
Create C++ instance (Counter)
        ↓
Store in internal registry
        ↓
Expose globally as "Counter"
        ↓
Available in all QML files


STEP 7: Why Counter.increment() works
-------------------------------------
Because:

    Q_INVOKABLE void increment();

Qt Meta-Object System exposes it as:

 callable method from QML, So when QML executes:

    Counter.increment()

Qt internally does:

- find singleton instance
- invoke method via meta-object system
- execute C++ function


STEP 8: Why no Counter {} is needed
-----------------------------------
Comparison:

- QML_ELEMENT only:
    → You must create instances manually in QML

- QML_SINGLETON:
    → Qt creates and provides the instance automatically


STEP 9: Mental model
--------------------
Without singleton:
    QML = "I create objects"

With singleton:
    QML = "I use a globally managed shared object"


STEP 10: Final concept
----------------------
QML_SINGLETON tells Qt to create and register exactly one global instance
   of the class inside the QML engine, making it accessible everywhere as
   "Counter".
*/
