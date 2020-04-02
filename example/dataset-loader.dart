import '../lib/src/dataset.dart';

Dataset loadDataset() {
  // TODO: Make this more generic and create a get from yaml function inside library.
  // XOR Example
  List<double> input1 = [0, 0];
  List<double> input2 = [0, 1];
  List<double> input3 = [1, 0];
  List<double> input4 = [1, 1];
  
  List<double> expected_output1 = [0];
  List<double> expected_output2 = [1];
  List<double> expected_output3 = [1];
  List<double> expected_output4 = [0];
  
  Dataset dataset = new Dataset(); // Empty Dataset
  
  // Fill dataset with pairs of input and output data
  dataset.pairs.add(Pair(input1, expected_output1));
  dataset.pairs.add(Pair(input2, expected_output2));
  dataset.pairs.add(Pair(input3, expected_output3));
  dataset.pairs.add(Pair(input4, expected_output4));
  
  return dataset;
}