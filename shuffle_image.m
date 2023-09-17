
input_folder = 'F:\image classification\NN_input\input';
output_folder = 'F:\image classification\NN_input\output';

input_files = dir(fullfile(input_folder, '*.png')); % Assuming jpg images
output_files = dir(fullfile(output_folder, '*.png'));

total_samples = length(input_files);
train_ratio = 0.7;
val_ratio   = 0.2;

num_train_samples = round(total_samples * train_ratio);
num_val_samples = round(total_samples * val_ratio) ;
num_test_samples = total_samples - num_train_samples - num_val_samples;

% Create an index permutation to shuffle the dataset
index_permutation = randperm(total_samples);

% Use the same permutation for both input and output files
shuffled_input_files = input_files(index_permutation);
shuffled_output_files = output_files(index_permutation);

% Separate training and validation sets
train_input_files = shuffled_input_files(1:num_train_samples);
train_output_files = shuffled_output_files(1:num_train_samples);

val_input_files = shuffled_input_files(num_train_samples+1:num_train_samples+1 + num_val_samples );
val_output_files = shuffled_output_files(num_train_samples+1:num_train_samples+1 + num_val_samples);

test_input_files = shuffled_input_files(num_train_samples+1 + num_val_samples+1:end);
test_output_files = shuffled_output_files(num_train_samples+1 + num_val_samples+1:end);
