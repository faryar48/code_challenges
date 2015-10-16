
// class getStorageManager () {

//   set (key, value, expiry) {
//     var seconds = new Date().getTime() / 1000
//     var key = {'property': value, expiration: expiry, currentTime: seconds}
//     localStorage.setItem('key', JSON.stringify(key))
//   }

//   get (key) {
//     var retrievedObject = localStorage.getItem(key)
//     var parsedKey = JSON.parse(retrievedObject))
//     console.log(parsedKey)
//     var newTime = new Date().getTime() / 1000
//     if ((newTime - parsedKey[currentTime]) > parsedKey[expiration]) {
//       return 'undefined'
//     } else {
//       var newObject = {parsedKey[key]: parsedKey[key][property]}
//       return newObject
//     }
//   }

//   remove (key) {
//     localStorage.removeItem(key)
//   }

//   setProperty (key, property, value, expiry) {
//     if (typeOf(key) === "object") {
//       var seconds = new Date().getTime() / 1000
//       var key = {property: value, expiration: expiry, currentTime: seconds}
//       localStorage.setItem('key', JSON.stringify(key))
//     } else if (typeOf(key) === undefined) {
//       var seconds = new Date().getTime() / 1000
//       var key = {'property': value, expiration: expiry, currentTime: seconds}
//       localStorage.setItem('key', JSON.stringify(key))
//     } else if (typeOf(key) !== "object") {
//       throw "key is not an object"
//     } else if (typeOf(key) === "array") {
//       return
//     }
//   }
// }



function getStorageManager ()  {

}

getStorageManager.prototype.set = function (key, value, expiry) {
  var expiryTimeStamp = Date.now() + (expiry * 1000)
  var valueTuple = {'expiration': expiryTimeStamp, 'value': value}
  localStorage.setItem(key, JSON.stringify(valueTuple))
}


// work on this
getStorageManager.prototype.get = function (key) {
  var retrievedObject = localStorage.getItem(key)
  var parsedKey = JSON.parse(retrievedObject)
  console.log(parsedKey)
  var newTime = new Date().getTime() / 1000
  if ((newTime - parsedKey[currentTime]) > parsedKey[expiration]) {
    return 'undefined'
  } else {
    var property = parsedKey[key]
    var value = parsedKey[key][property]
    var newObject = {property: value}
    return newObject
  }
}

getStorageManager.prototype.remove = function (key) {
  localStorage.removeItem(key)
}

getStorageManager.prototype.setProperty = function (key, property, value, expiry) {
  if (typeOf(key) === 'object') {
    var seconds = new Date().getTime() / 1000
    var key = {property: value, expiration: expiry, currentTime: seconds}
    localStorage.setItem('key', JSON.stringify(key))
  } else if (typeOf(key) === undefined) {
    var seconds = new Date().getTime() / 1000
    var key = {'property': value, expiration: expiry, currentTime: seconds}
    localStorage.setItem('key', JSON.stringify(key))
  } else if (typeOf(key) !== 'object') {
    throw 'key is not an object'
  } else if (typeOf(key) === 'array') {
    return
  }
}


/* Sets the value 7 under the key 'clicksCounter' for 60 seconds. */
storageManager = new getStorageManager()
storageManager.set('clicksCounter', 7, 60)

/* Stores the object referenced by 'message' under the key 'curMsg' for 24 hours. */
var message = {'msg': 'hello world!'}
storageManager.set('currMsg', message, 60 * 60 * 24)

/* Will output to the console the value that was stored under the 'clicksCounter' key (if it isn't expired). */
var numOfClicks = storageManager.get('clicksCounter')
console.log(numOfClicks)

/* Will output true to the console. */
storageManager.remove('clicksCounter')
var numOfClicks = storageManager.get('clicksCounter')
console.log(numOfClicks===undefined)


/* Example 1 : Object was already stored under the given key */

/* Saves an object under the key 'key1' with the attribute 'attr1' and the value 'value1'. Will be stored for 24 hours. */
storageManager.set('key1', {'attr1' : 'value1'}, 60*60*24);

/* Adds the property 'attr2' with the value 54 to the object stored under the key 'key1'. Will update expiry to 24 hours. */
storageManager.setProperty('key1', 'attr2', 54, 60*60*24);

storageManager.get('key1'); // Will return: { 'attr1' : 'value1', 'attr2' : 54 }

/* Example 2 : Nothing was stored under the given key */

/* Saves an object under the key 'key2' with the property 'attr3' and the value 13. Will be stored for 24 hours. */
storageManager.setProperty('key2', 'attr3', 13, 60*60*24);

storageManager.get('key2'); // Will return: { 'attr3' : 13 }

/* Example 3 : Non object was already stored under the given key (i.e. string, int ...) */

/* Saves the string 'my string' under the key 'key3'. Will be stored for 24 hours. */
storageManager.set('key3', 'my string', 60*60*24);

/* Adds the property 'attr4' with the value 37 to the object stored under the key 'key3'. Will cause an exception */
storageManager.setProperty('key3', 'attr4', 37, 60*60*24); // An exception is thrown









