import 'neuron.dart';
import 'layer.dart';
import 'utils.dart';
import 'dataset.dart';

class NeuralNetwork {

    // Layers
    static Layer[] layers;
    
    // Training data
    static Dataset[] dataset;
	
    static void forward(double[] inputs) {
    	// Bring the inputs into the input layer
    	layers[0] = new Layer(inputs);
    	
		// Forward propagation
        for(int i = 1; i < layers.length; i++) {
        	for(int j = 0; j < layers[i].neurons.length; j++) {
        		double sum = 0;
        		for(int k = 0; k < layers[i - 1].neurons.length; k++) {
        			sum += layers[i - 1].neurons[k].value * layers[i].neurons[j].weights[k];
        		}
        		layers[i].neurons[j].value = sigmoid(sum);
        	}
        } 	
    }
    
    static void backward(double learning_rate, Pair data) {
    	
    	int number_layers = layers.length;
    	int out_index = number_layers - 1;
    	
		// Update the output layers 
    	for(int i = 0; i < layers[out_index].neurons.length; i++) { // For each output
    		double output = layers[out_index].neurons[i].value;
    		double target = data.expected_output[i];
    		double derivative = output - target;
    		double delta = derivative * (output * (1 - output));
    		layers[out_index].neurons[i].gradient = delta;
    		
			for(int j = 0; j < layers[out_index].neurons[i].weights.length; j++) { // and for each of their weights
    			double previous_output = layers[out_index - 1].neurons[j].value;
    			double error = delta * previous_output;
    			layers[out_index].neurons[i].weights_old[j] = layers[out_index].neurons[i].weights[j] - learning_rate * error;
    		}
    	}
    	
    	// Update all the subsequent hidden layers
    	for(int i = out_index-1; i > 0; i--) {
    		for(int j = 0; j < layers[i].neurons.length; j++) { // For all neurons in that layers
    			double output = layers[i].neurons[j].value;
    			double gradient_sum = sumGradient(j, i + 1);
    			double delta = (gradient_sum) * (output * (1 - output));
    			layers[i].neurons[j].gradient = delta;
    			
    			for(int k = 0; k < layers[i].neurons[j].weights.length; k++) { // And for all their weights
    				double previous_output = layers[i - 1].neurons[k].value;
    				double error = delta * previous_output;
    				layers[i].neurons[j].weights_old[k] = layers[i].neurons[j].weights[k] - learning_rate * error;
    			}
    		}
    	}
    	
    	// Update all the weights
    	for(int i = 0; i < layers.length; i++) {
    		for(int j = 0; j < layers[i].neurons.length; j++) {
    			layers[i].neurons[j].updateWeights();
    		}
    	}
    }
    
    // This function sums up all the gradient connecting a given neuron in a given layer
    static double sumGradient(int n_index, int l_index) {
    	double gradient_sum = 0;
    	Layer current_layer = layers[l_index];
    	for(int i = 0; i < current_layer.neurons.length; i++) {
    		Neuron current_neuron = current_layer.neurons[i];
    		gradient_sum += current_neuron.weights[n_index] * current_neuron.gradient;
    	}
    	return gradient_sum;
    }
 
    // This function is used to train
    static void train(int iteration, double learning_rate) {
    	for(int i = 0; i < iteration; i++) {
    		for(int j = 0; j < dataset.pairs.length; j++) {
    			forward(dataset.pairs[j].data);
    			backward(learning_rate, dataset.pairs[j]);
    		}
    	}
    }
}