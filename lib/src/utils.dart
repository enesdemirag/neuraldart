import 'dart:math' as math;

// Random double between min - max
double randomWeight(int min, int max) {
  math.Random rand; 
  return rand.nextDouble() * (max - min) + min;
}

// Sigmoid Function
double sigmoid(double x) {
  return (1 / (1 + math.pow(math.e, -1 * x))).toDouble();
}

// Derivative of Sigmoid Function
double sigmoidDerivative(double x) {
  return sigmoid(x) * (1 - sigmoid(x));
}

// Used for Backpropagation
double squaredError(double output, double target) {
  return (0.5 * math.pow(2, (target - output))).toDouble();
}

// Used to calculate the overall error rate
double sumSquaredError(List<double> outputs, List<double> targets) {
  double sum = 0;
  for(int i = 0; i < outputs.length; i++) {
    sum += squaredError(outputs[i], targets[i]);
  }
  return sum;
}