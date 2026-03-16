

## Data Storage in QML QT

#### Example 1 : Automatic Saving

```c++
// Include the class responsible for managing a GUI application.
// It initializes the Qt GUI subsystem and manages the event loop.
#include <QGuiApplication>

// This class loads QML files and creates the QML object tree.
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    // Create the main Qt application object.
    // argc and argv pass command-line arguments to Qt.
    // Every Qt GUI application must have exactly ONE application instance.
    QGuiApplication app(argc, argv);

    /*
        These settings define the application identity.

        They are VERY IMPORTANT when using persistent storage such as
        QSettings or the QML Settings type.

        Qt uses these values to determine where to store configuration
        files on the operating system.

        Without them, QML Settings cannot initialize and will produce
        an error like:
        "Failed to initialize QSettings instance".
    */
    app.setOrganizationName("iti");
    app.setOrganizationDomain("ivi");
    app.setApplicationName("appName");


    /*
        Create the QML engine.

        The engine is responsible for:
        - Loading QML files
        - Creating the UI objects
        - Connecting QML with C++
    */
    QQmlApplicationEngine engine;

    /*
        This connection listens for a failure when creating the
        root QML object.

        If the main QML file fails to load, the application exits
        with error code -1.

        This prevents the application from continuing in an invalid state.
    */
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);

    /*
        Load the main QML file.

        This loads Main.qml from the QML module named "app1".
        The engine then builds the entire UI object tree defined in QML.
    */
    engine.loadFromModule("app1", "Main");

    /*
        Start the Qt event loop.

        The event loop:
        - processes user input (mouse, keyboard)
        - updates the UI
        - processes signals and slots
        - keeps the application running

        The application stops when the event loop exits.
    */
    return app.exec();
}
```

```javascript
/*
    Import QtQuick module.

    Provides core visual QML components such as:
    - Window
    - Rectangle
    - MouseArea
    - animations
*/
import QtQuick

/*
    Provides ready-to-use dialogs such as:
    - ColorDialog
    - FileDialog
    - FontDialog
*/
import QtQuick.Dialogs

/*
    Provides core utilities including:
    - Settings (persistent storage)
*/
import QtCore


/*
    Root window of the application.
    This is the top-level UI container.
*/
Window {

    // Unique identifier used to reference the window
    id: rootId

    // Initial window width
    width: 640

    // Initial window height
    height: 480

    // Makes the window visible on startup
    visible: true

    /*
        Window title.

        qsTr() marks the text as translatable,
        allowing Qt's internationalization system
        to translate it later.
    */
    title: qsTr("Settings Automatic")


    /*
        Rectangle that fills the entire window.

        It acts as the background and interactive area.
    */
    Rectangle{

        // ID used to reference this rectangle elsewhere
        id: rectId

        // Makes the rectangle fill its parent (the window)
        anchors.fill: parent

        // Default color when the application runs the first time
        color: "red"


        /*
            MouseArea captures mouse input events.

            Because it fills the rectangle, clicking anywhere
            inside the window triggers the event.
        */
        MouseArea{

            // Mouse area covers the entire rectangle
            anchors.fill: parent

            /*
                Triggered when the user clicks the rectangle.

                The color dialog is opened to allow the user
                to select a new color.
            */
            onClicked: function(){
                colorDialogId.open() // open the color picker dialog
            }

            /*
                Native system color selection dialog.

                This allows the user to choose any color.
            */
            ColorDialog{

                // Identifier used to reference the dialog
                id: colorDialogId

                // Title shown on the dialog window
                title: "Choose color"

                /*
                    Triggered when the user confirms
                    their color selection.
                */
                onAccepted: function(){

                    /*
                        selectedColor is provided by ColorDialog.

                        The rectangle color is updated with
                        the chosen color.
                    */
                    rectId.color = selectedColor
                }

                /*
                    Triggered when the user cancels the dialog.
                */
                onRejected: function(){

                    // Print a debug message to the console
                    console.log("Dialog rejected")
                }
            }
        }
    }


    /*
        SETTINGS OBJECT #1

        This stores the window geometry.
        Settings automatically persists the values.
    */
    Settings{

        /*
            Category groups settings inside the storage file.

            Example:
            [window]
        */
        category: "window"

        /*
            property alias connects the settings property
            to an existing property in the UI.

            Whenever the window property changes,
            the new value is automatically stored.
        */

        // Save window horizontal position
        property alias x: rootId.x

        // Save window vertical position
        property alias y: rootId.y

        // Save window width
        property alias width: rootId.width

        // Save window height
        property alias height: rootId.height
    }


    /*
        SETTINGS OBJECT #2

        Stores the rectangle color chosen by the user.
    */
    Settings{

        // Group name in the settings storage
        category: "colors"

        /*
            Alias that connects stored value
            to the rectangle color property.

            When rectId.color changes,
            the new value is automatically saved.
        */
        property alias rectColor: rectId.color
    }
}
```

-------------------------------------

#### Example 2 : Custom storage 

```javascript
/*
    This example demonstrates MANUAL settings management using the Settings component.

    Unlike the automatic example, here we control WHEN the settings are saved.

    Goals of this approach:
    1. Prevent automatic saving whenever a property changes.
    2. Save settings only at a specific moment we choose.
    3. In this example, we save settings when the Window is about to be destroyed.

    Flow of the program:

    1. Do NOT use property aliases inside Settings objects.
       (aliases would cause automatic saving)

    2. Read initial values from Settings objects and use them
       to initialize the UI.

    3. When the application is closing (Window destruction),
       copy the current UI values into the Settings object
       to persist them.
*/

import QtQuick
import QtQuick.Dialogs
import QtCore   // Provides the Settings component for persistent storage


Window {

    /*
        Root window of the application.

        Instead of defining fixed values for position and size,
        we read the values from the Settings object.

        This restores the window state from the last run.
    */
    id: rootId

    // Restore window position from settings
    x: windowSettingsId.x

    // Restore window vertical position
    y: windowSettingsId.y

    // Restore window width
    width: windowSettingsId.width

    // Restore window height
    height: windowSettingsId.height

    visible: true

    // Window title (marked for translation)
    title: qsTr("Custom Settings")


    /*
        Rectangle used as the main UI area.

        It fills the entire window and acts as the clickable surface.
    */
    Rectangle{

        id: rectId

        // Fill the entire window
        anchors.fill: parent

        /*
            Restore the rectangle color from stored settings.

            If the user changed the color in the previous run,
            it will be restored here.
        */
        color: colorSettingsId.rectColor


        /*
            MouseArea captures mouse interaction.

            Clicking anywhere inside the window opens the color picker.
        */
        MouseArea{

            anchors.fill: parent

            // Open the color dialog when the rectangle is clicked
            onClicked: function(){
                colorDialogId.open()
            }

            /*
                Native color picker dialog provided by Qt.
                Allows the user to choose a color visually.
            */
            ColorDialog {

                id: colorDialogId

                title: "Please choose a color"

                /*
                    Triggered when the user selects a color
                    and confirms the dialog.
                */
                onAccepted: {

                    // Print selected color in the console for debugging
                    console.log("The new color is: " + selectedColor);

                    // Apply the selected color to the rectangle
                    rectId.color = selectedColor;
                }

                /*
                    Triggered when the user cancels the dialog.
                */
                onRejected: {
                    console.log("Canceled");
                }
            }
        }
    }


    /*
        SETTINGS OBJECT FOR WINDOW GEOMETRY

        IMPORTANT:
        We do NOT use property aliases here.

        Instead, we define standalone properties.

        This prevents automatic saving and allows
        manual control over when values are stored.
    */
    Settings{

        // Identifier used to access this settings object
        id: windowSettingsId

        // Category groups related settings together
        category: "window"

        /*
            Default values used if no settings
            have been stored previously.
        */

        // Default window horizontal position
        property int x: 300

        // Default window vertical position
        property int y: 300

        // Default window width
        property int width: 640

        // Default window height
        property int height: 480
    }


    /*
        SETTINGS OBJECT FOR COLOR PREFERENCES
    */
    Settings{

        id: colorSettingsId

        // Category name used in the storage system
        category: "colors"

        /*
            Default rectangle color.

            If the user has never chosen a color before,
            this value will be used.
        */
        property color rectColor: "red"
    }


    /*
        Component.onDestruction

        This signal handler is triggered when the Window
        object is about to be destroyed (application closing).

        This is where we manually save the current UI state.
    */
    Component.onDestruction: {

        /*
            Save window geometry by copying values
            from the UI into the Settings object.
        */

        windowSettingsId.x = rootId.x
        windowSettingsId.y = rootId.y
        windowSettingsId.width = rootId.width
        windowSettingsId.height = rootId.height


        /*
            Save the rectangle color selected by the user.
        */
        colorSettingsId.rectColor = rectId.color
    }
}
```

