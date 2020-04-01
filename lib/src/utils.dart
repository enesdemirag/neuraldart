import 'dart:math' as math;

// Random double between min - max
static double randomWeight(int min, int max) {
    return math.Random.nextDouble() * (max - min) + min;
}

// Sigmoid Function
static double sigmoid(double x) {
    return (1 / (1 + math.pow(math.e, -1 * x))).toDouble();
}

// Derivative of Sigmoid Function
static double sigmoidDerivative(double x) {
    return sigmoid(x) * (1 - sigmoid(x));
}

// Used for Backpropagation
static double squaredError(double output, double target) {
    return (0.5 * math.pow(2, (target - output))).toDouble();
}

// Used to calculate the overall error rate
static double sumSquaredError(double[] outputs, double[] targets) {
	double sum = 0;
	for(var i in outputs) {
		sum += squaredError(outputs[i], targets[i]);
	}
	return sum;
}