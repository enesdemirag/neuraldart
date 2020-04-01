import 'dart:math';

// Random double between min - max
double randomWeight(int min, int max) {
    return nextDouble() * (max - min) + min;
}

// Sigmoid Function
static double sigmoid(double x) {
    return (1 / (1 + pow(e, -1 * x))).toDouble();
}

// Derivative of Sigmoid Function
static double sigmoidDerivative(double x) {
    return sigmoid(x) * (1 - sigmoid(x));
}

// Used for Backpropagation
static double squaredError(double output, double target) {
    return (0.5 * pow(2, (target - output))).toDouble();
}