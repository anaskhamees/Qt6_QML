# **1. Front End**

The **Front End** is the part of the software the **user sees and interacts with**.

It is responsible for:

- Displaying the **UI**
- Handling **user input**
- Sending **requests** for data to the back end

**Example:**
 In Qt QML, `Button`, `ListView`, and `Text` elements are part of the front end.

------

# **2. Back End**

The **Back End** is the **server side** of the application.

It is responsible for:

- Storing **data**
- Processing **requests**
- Sending **responses** back to the front end

Back end systems usually include:

| Component | Purpose                        |
| --------- | ------------------------------ |
| Server    | Runs the application logic     |
| Database  | Stores information             |
| API       | Allows apps to access the data |

**Example data stored in the backend:**

```
{
  "users":[
    {"name":"Emily"},
    {"name":"Michael"}
  ]
}
```

------

# **3. The Bridge Between Front End and Back End**

The **bridge** is usually **API communication over HTTP**. Your app sends a **request** to the server.
 The server sends back **data** (usually JSON). Most modern APIs follow the **REST API** style.

------

# **4. Communication Flow**

```
User
  |
  v
Front End (Qt QML App)
  |
  | HTTP Request
  v
API (Server)
  |
  v
Database
  |
  v
API Response (JSON)
  |
  v
Front End UI displays data
```

------

# **5. What is an API **

**API** = **Application Programming Interface**

It is a **service on the internet that allows programs to request data**.

Your application can ask the API for:

- Users
- Weather
- Products
- News
- Maps

**Example request:**

```json
https://dummyjson.com/users
```

The API server sends back **data about users**.

------

# **6. What is JSON**

**JSON** = **JavaScript Object Notation**

It is a **text format used to send data between programs**.

**Example JSON:**

```json
{
  "firstName": "Emily",
  "lastName": "Johnson",
  "age": 29
}
```

**Explanation:**

| Key       | Value   |
| --------- | ------- |
| firstName | Emily   |
| lastName  | Johnson |
| age       | 29      |

------

# **7. JSON Objects vs JSON Arrays**

### JSON Object `{}`

Represents **one item**:

```json
{
  "name": "Emily"
}
```

### JSON Array `[]`

Represents a **list of items**:

```json
[
  {"name": "Emily"},
  {"name": "Michael"},
  {"name": "Sophia"}
]
```

------

# **8. Request Types (HTTP Methods)**

#### What is HTTP

**HTTP** = **Hypertext Transfer Protocol**

It is the **language that computers (or apps) use to communicate over the internet**.

Think of it like **mail**: your browser (or app) writes a message (request) to a website (server), and the server sends back a reply (response).

1. **HTTP is a protocol** – it defines the rules for sending and receiving messages.
2. **Used for client-server communication** – your app is the **client**, the server is the **backend**.
3. **Transmits data** – usually HTML, JSON, images, or files.

------

# **HTTP Request**

When your app asks the server for data, it sends an **HTTP request**.

**Example GET request** (asking for users):

```
GET https://dummyjson.com/users
```

- `GET` → the method (ask to read data)
- `https://dummyjson.com/users` → the URL/resource

Other common HTTP methods:

| Method | Purpose              |
| ------ | -------------------- |
| GET    | Retrieve data        |
| POST   | Send/create new data |
| PUT    | Update existing data |
| DELETE | Remove data          |

------

# **HTTP Response**

The server replies with an **HTTP response**, which usually contains:

- **Status code** – shows if the request worked (`200 OK`, `404 Not Found`)
- **Headers** – extra info about the response
- **Body** – the actual data (often JSON)

**Example Response:**

```json
Status: 200 OK
Content-Type: application/json

{
  "users":[
    {"firstName":"Emily","lastName":"Johnson"},
    {"firstName":"Michael","lastName":"Williams"}
  ]
}
```

**Example:**

- `GET https://dummyjson.com/users` → fetch all users
- `POST https://dummyjson.com/users` → add a new user

------

# **9. REST API Basics**

**REST** = **Representational State Transfer**

It is a **design style for web APIs** that allows the front end to communicate with the back end.

### Example Resources

```
/users
/products
/posts
/orders
```

Requesting:

```
GET https://dummyjson.com/users
```

Means: "Give me the list of users."

------

### REST API Communication Flow

```
User clicks button
        ↓
Qt QML App sends HTTP request
        ↓
REST API server receives request
        ↓
Server processes request
        ↓
Server returns JSON response
        ↓
Qt app displays data
```

------

# **10. Example REST API Response**

Request:

```json
GET https://dummyjson.com/users
```

Response (JSON):

```json
{
  "users":[
    {"id":1, "firstName":"Emily", "lastName":"Johnson"},
    {"id":2, "firstName":"Michael", "lastName":"Williams"}
  ]
}
```

------

# **11. How This Works in QML**

### Step 1 — Send Request

```json
var xhr = new XMLHttpRequest();
xhr.open("GET", url);
xhr.send();
```

### Step 2 — Wait for Response

```json
xhr.onreadystatechange = function () { ... }
```

### Step 3 — Receive JSON

```json
{
 "users":[
   {"firstName":"Emily","lastName":"Johnson"},
   {"firstName":"Michael","lastName":"Williams"}
 ]
}
```

### Step 4 — Parse JSON

```json
var object = JSON.parse(response);
```

### Step 5 — Loop Through Data

```json
object.users.forEach(function(user){
    listModelId.append({
        "userdata": user.firstName + " " + user.lastName
    })
});
```

### Step 6 — Display in ListView

```json
Emily Johnson
Michael Williams
Sophia Brown
```

------

# **12. Summary**

| Concept        | Meaning                       |
| -------------- | ----------------------------- |
| Front End      | What the user sees            |
| Back End       | Server-side data & logic      |
| API            | Service that provides data    |
| JSON           | Text format used to send data |
| GET            | Request data                  |
| POST           | Send data                     |
| XMLHttpRequest | Object used to call APIs      |
| JSON.parse     | Convert JSON text to object   |
| ListModel      | Store data in QML             |
| ListView       | Display the data              |
| REST API       | Web API design style          |



```c++
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

// Main application window
Window {
    width: 640
    height: 480
    visible: true
    title: qsTr("REST API Example")

    /*
        ==========================================
        LIST MODEL
        ==========================================
        Stores the data fetched from the API.
        Each entry has a "userdata" property.
    */
    ListModel {
        id: listModelId
    }

    /*
        ==========================================
        UI LAYOUT
        ==========================================
    */
    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        // BUTTON: Fetch users from API
        Button {
            id: fetchButton
            Layout.fillWidth: true
            text: "Fetch Users From API"

            onClicked: {
                console.log("Button clicked: Fetching users")
                fetchUsers()  // Call function to fetch API data
            }
        }

        // LIST VIEW: Displays data from the ListModel
        ListView {
            id: userListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: listModelId
            delegate: delegateId
        }
    }

    /*
        ==========================================
        DELEGATE
        ==========================================
        Defines how each row in the ListView looks
    */
    Component {
        id: delegateId
        Rectangle {
            width: parent.width
            height: textId.implicitHeight + 20
            color: "beige"
            border.color: "yellowgreen"
            radius: 5

            Text {
                id: textId
                anchors.centerIn: parent
                text: userdata       // "userdata" comes from ListModel
                font.pointSize: 14
            }
        }
    }

    /*
        ==========================================
        FUNCTIONS
        ==========================================
    */

    // 1️ Function: Generic function to fetch data from any API
    function fetchData(url, callback) {
        var xhr = new XMLHttpRequest()

        // Triggered whenever readyState changes
        xhr.onreadystatechange = function() {

            // 0: UNSENT - not initialized
            // 1: OPENED - open() called
            // 2: HEADERS_RECEIVED - headers received
            // 3: LOADING - responseText is loading
            // 4: DONE - operation finished

            if (xhr.readyState === XMLHttpRequest.HEADERS_RECEIVED) {
                console.log("HEADERS_RECEIVED - status:", xhr.status)
            }

            if (xhr.readyState === XMLHttpRequest.DONE) {
                console.log("DONE - Request finished")
                console.log("Status:", xhr.status)
                console.log("StatusText:", xhr.statusText)
                console.log("Response:", xhr.responseText)
               /*
                | Status Code | Meaning                             |
                | ----------- | ----------------------------------- |
                | 200         | OK – request succeeded              |
                | 201         | Created – new resource created      |
                | 400         | Bad Request – invalid request       |
                | 401         | Unauthorized – missing credentials  |
                | 403         | Forbidden – you don’t have access   |
                | 404         | Not Found – resource doesn’t exist  |
                | 500         | Server Error – something went wrong |
                */
                
                if (xhr.status === 200) {
                    callback(xhr.responseText)  // Return JSON text to caller
                } else {
                    console.log("Error: Cannot fetch data from API")
                    callback(null)
                }
            }
        }

        // Initialize GET request
        xhr.open("GET", url)
        console.log("Sending GET request to:", url)
        xhr.send()
    }

    // 2️ Function: Fetch users and populate ListModel
    function fetchUsers() {
        console.log("Starting fetchUsers()")
        // Clear old data
        listModelId.clear()

        // Call API
        fetchData("https://dummyjson.com/users", function(response) {
            if (response) {
                console.log("API response received")

                // Convert JSON text to JavaScript object
                var data = JSON.parse(response)

                // Check that "users" array exists
                if (data.users && data.users.length > 0) {
                    console.log("Found " + data.users.length + " users")
                    // Loop through each user
                    data.users.forEach(function(user) {
                        addUserToModel(user.firstName, user.lastName)
                    })
                } else {
                    console.log("No users found in response")
                }
            } else {
                console.log("No response received from API")
            }
        })
    }

    // 3️ Function: Add a user to the ListModel
    function addUserToModel(firstName, lastName) {
        console.log("Adding user to model:", firstName, lastName)
        listModelId.append({
            "userdata": firstName + " " + lastName
        })
    }
}

```

