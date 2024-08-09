void miniMaxSum(List<int> arr) {
  arr.sort();
  int minSum = arr.sublist(0, 4).reduce((a, b) => a + b);
  int maxSum = arr.sublist(1, 5).reduce((a, b) => a + b);
  print('$minSum $maxSum');
}

void main() {
  List<int> arr = [1, 2, 3, 4, 5];
  miniMaxSum(arr);
}
