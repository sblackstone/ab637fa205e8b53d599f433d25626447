
const modulus = 1000000007;

/*
def modpow(b,e,m)
  result = 1
  while e > 0
    if (e & 1) == 1
      result = (result * b) % m;
    end
    e = e >> 1;
    b = (b * b) % m;
  end
  return result
end
*/

const modPow = (b, e, m) => {
  let result = 1;

  b = b % m;

  if (b == 0) {
    return 0;
  }

  while (e > 0) {
    if (e & 1 == 1) {
      result = (result * b) % m;
    }
    e = e >> 1;
    b = (b*b) % m;
  }
  return result;
}


for (let i = 0; i < 100; i++) {
  for (let j = 0; j < 100; j++) {
    for (let k = 1; k < 100; k++) {
      let a = modPow(i,j,k);
      let b = (i**j) % k;
      if (a !== b) {
        console.log(i,j,k,a,b);
      }
    }
  }
}

console.log(modPow(2, 5, 3));
process.exit(-1);


const digitSum = (x) => {
  let result = 0;
  while (x > 0) {
    result += x % 10;
    x = (x - (x % 10)) / 10;
  }
  return result;
}

const fibSeq = (count) => {
  let result = [0, 1];
  while (result.length < count) {
    result.push(result[result.length - 1] + result[result.length - 2]);
  }
  return result;
}

const ninesCache = {};

const nineContribution = (nineLength) => {
  if (nineLength === 0) {
    return 0
  };
  if (nineLength === 1) {
    return 9;
  }
  if (ninesCache[nineLength] > 0) {
    return ninesCache[nineLength];
  }
  ninesCache[nineLength] = 9 * 10**(nineLength - 1) + nineContribution(nineLength - 1);
  return ninesCache[nineLength];
}


for (let i = 0; i < 1000000; i++) {
    nineContribution(i);
}

const calcFast = (x) => {
  if (x < 10) {
    return x;
  }
  let nineLength = Math.floor(x / 9);
  let result = (x - (nineLength * 9))*10**(nineLength) + nineContribution(nineLength);
  return result;

};




const bruteResult = {};

for (let i = 0; i < 100000000; i++) {
  const ds = digitSum(i);
  if (!bruteResult[ds]) {
    bruteResult[ds] = i;
  }
}

const fastResult = {};
const maxFound = Math.max(...Object.keys(bruteResult));


for (let i = 0; i <  maxFound + 1; i++) {
  fastResult[i] = calcFast(i);
  const same = String(fastResult[i] === bruteResult[i]);
  console.log(`${i}:\t${fastResult[i]}\t${bruteResult[i]}\t${same}`);
}

let testSum = 0;

for (let i = 1; i <= 20; i++) {
  testSum += calcFast(i);
}
console.log(testSum);

//process.exit(-1);
let result = 0;
let fib = fibSeq(90);

for (let i = 2; i < fib.length; i++) {
  console.log(i);
  result = result + calcFast(fib[i]);
  result = result % 1000000007;
}

console.log(result);
