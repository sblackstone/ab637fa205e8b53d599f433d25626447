
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

const calcFast = (x) => {
  if (x < 10) {
    return x;
  }
  let tenPower = 1;
  let nineLength = Math.floor(x / 9);

  let result = x - (nineLength * 9);
  result = result * 10**(nineLength);
  for (let i = 0; i < nineLength; i++) {
    result +=  (tenPower * 9);
    tenPower *= 10;
  }
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
