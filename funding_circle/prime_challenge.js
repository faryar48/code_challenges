// Sieve of Eratosthenes' algorithm
var primes = function (primesLength, max) {
  max = max || primesLength * 10 // rough heuristic
  var numbers = Array.apply(null, new Array(max)).map(function () { return true })
  var currentPrime = 2
  var primes = [currentPrime]
  while (primes.length < primesLength) {
    for (var i = currentPrime + currentPrime; i <= numbers.length - 1; i += currentPrime) {
      numbers[i] = false
    };
    currentPrime = numbers.indexOf(true, currentPrime + 1)
    if (currentPrime === -1) {
      throw new Error(['You have requested primes length of', primesLength, 'but could only compute a length of', primes.length, 'with max of', max, '. Please increase max and try again.'].join(' '))
    }
    primes.push(currentPrime)
  }
  return primes
}


var primesTable = function (size) {
  var primeArray = primes(size)
  return primeArray.reduce(function (memo, prime) {
    var rowValues = primeArray.map(function (primeCol) {
      return primeCol * prime
    })
    memo.push([prime].concat(rowValues))
    return memo
  }, [[''].concat(primeArray)])
}

var printMatrix = function (matrix) {
  return matrix.map(function (row) {
    return row.join('\t')
  }).join('\n')
}

console.log(printMatrix(primesTable(parseInt(process.argv[2] || 10, 10))))

// as you can see, the above solution is not so ideal since we have to account for how big the array is going to be each time

