# X-SUNIT (Extraterrestrial Survival Unit) API

I've developed a REST API, which stores information about survivors.

## The API contains:

With this API you can:
* **Add survivors to the database**

The survivor must have a name, age, gender, and last location (latitude, longitude).

* **Update Survivor Location**

A survivor must be of his / her last local ability, storing the new latitude / longitude pair at the base (no need to trace locations, replacing the previous one).

* **Report Abduction**

In a chaotic situation like this, it is inevitable that a survivor is kidnapped. When this happens, report that the survivor has been abducted.

* **View abduction reports**
Percentage of abducted survivors.
Percentage of survivors not abducted.
List all names of survivors in alphabetical order with an identification to know if they were abducted or not.

## API Documentation
**Check out the api documentation to find out how it works on the route**
```
http://localhost:3000/apipie
```

## Usage
After install ruby, rails and up the server, clone this project and execute:
```
rails dev:init
```
To execute the initial seed.


# xsunit-api
