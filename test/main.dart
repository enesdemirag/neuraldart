import '../lib/neuralnetwork.dart';
import '../lib/dataset.dart';

Dataset loadDataset() { // TODO: Make this more generic and get from json. 
	double input1 = [0, 0];
	double input2 = [0, 1];
	double input3 = [1, 0];
	double input4 = [1, 1];
	
	double expected_output1 = 0;
	double expected_output2 = 1;
	double expected_output3 = 1;
	double expected_output4 = 0;
	
	dataset = new Dataset[4];
	dataset.pairs[0] = new Pair(input1, expectedOutput1);
	dataset.pairs[1] = new Pair(input2, expectedOutput2);
	dataset.pairs[2] = new Pair(input3, expectedOutput3);
	dataset.pairs[3] = new Pair(input4, expectedOutput4);
	
	return dataset;  
}

// Main Method
static void main() {
	// Set Min and Max weight value for all neurons
	Neuron.setRange(-1, 1);
	
	// Create the layers
	layers = new Layer(3);
	layers[0] = null; 				// Input layer
	layers[1] = new Layer(2,6); 	// Hidden layer / 6 neurons each have 2 weights (connections)
	layers[2] = new Layer(6,1); 	// Output layer / 1 neuron with 6 weights (connections) 
	
	// Create the training data
	dataset = loadDataset();
	
	print("============");
	print("Output before training");
	print("============");
	for(var i in dataset.pairs) {
		forward(i.data);
		print(layers[2].neurons[0].value);
	}
	
	train(1000000, 0.05);

	print("============");
	print("Output after training");
	print("============");
	for(var i in dataset.pairs) {
		forward(i.data);
		print(layers[2].neurons[0].value);
	}
}