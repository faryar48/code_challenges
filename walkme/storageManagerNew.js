
var StorageManager = function () {

}



// set the ket and value into local storage with an expiration time in seconds
StorageManager.prototype.set = function (key, value, expiry) {
  var expiryTime = (new Date() / 1000) + expiry
  var valueObject = {'value': value, 'expiryTime': expiryTime}
  window.localStorage.setItem(key, JSON.stringify(valueObject))
}

// get the value with the given key unless it is currently past the expiration time
// if it is past the expiration time, return undefined
StorageManager.prototype.get = function (key) {
  var potentialValue = JSON.parse(window.localStorage.getItem(key))
  if (potentialValue === null) {
    return undefined
  }

  if (potentialValue.expiryTime < new Date() / 1000) {
    return undefined
  }

  return potentialValue.value
}

StorageManager.prototype.remove = function (key) {
  window.localStorage.removeItem(key)
}

StorageManager.prototype.setProperty = function (key, property, value, expiry) {
  var potentialValue = JSON.parse(window.localStorage.getItem(key))
  if (potentialValue === null) {
    var valueObject = {}
    valueObject[property] = value
    this.set(key, valueObject, expiry)
    return
  }

  if (typeof potentialValue.value === 'object') {
    potentialValue.value[property] = value
    this.set(key, potentialValue.value, expiry)
  } else {
    throw 'expected an object'
  }
}



var getStorageManager = function () {
  return new StorageManager()
}

var storageManager = getStorageManager()
// console.log(storageManager.set('clicksCounter', 7, 100))
// console.log(storageManager.get('clicksCounter'))
// console.log(storageManager.set('hello', 'world', 1))
// console.log(storageManager.get('hello'))
// console.log(storageManager.setProperty('clicksCounter', 'second value', 'more stuff', 100))


// /* Example 1 : Object was already stored under the given key */

// /* Saves an object under the key 'key1' with the attribute 'attr1' and the value 'value1'. Will be stored for 24 hours. */
// storageManager.set('key1', {'attr1' : 'value1'}, 60*60*24)

//  Adds the property 'attr2' with the value 54 to the object stored under the key 'key1'. Will update expiry to 24 hours.
// storageManager.setProperty('key1', 'attr2', 54, 60*60*24)

// console.log(storageManager.get('key1')) // Will return: { 'attr1' : 'value1', 'attr2' : 54 }

/* Example 2 : Nothing was stored under the given key */

// /* Saves an object under the key 'key2' with the property 'attr3' and the value 13. Will be stored for 24 hours. */
// storageManager.setProperty('key2', 'attr3', 13, 60*60*24)

// console.log(storageManager.get('key2')) // Will return: { 'attr3' : 13 }

//  Example 3 : Non object was already stored under the given key (i.e. string, int ...)

/* Saves the string 'my string' under the key 'key3'. Will be stored for 24 hours. */
storageManager.set('key3', 'my string', 60*60*24)

/* Adds the property 'attr4' with the value 37 to the object stored under the key 'key3'. Will cause an exception */
console.log(storageManager.setProperty('key3', 'attr4', 37, 60*60*24)) // An exception is thrown






