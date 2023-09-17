source_folder = 'F:\image classification\NN_input\input';
destination_folder = 'F:\image classification\NN_input\train_input';

for i = 1:size(test_input_files,1)
    source_file = fullfile(source_folder, test_input_files(i).name);
    destination_file = fullfile(destination_folder, test_input_files(i).name);
    
    % Check if the source file exists before attempting to move
    if exist(source_file, 'file') == 2
        % Move the file
        movefile(source_file, destination_file);
    else
        fprintf('File %s does not exist in the source folder.\n', files_to_move{i});
    end
end



source_folder = 'F:\image classification\NN_input\input';
destination_folder = 'F:\image classification\NN_input\val_input';
tic
for i = 1:size(val_input_files,1)
    source_file = fullfile(source_folder, val_input_files(i).name);
    destination_file = fullfile(destination_folder, val_input_files(i).name);
    
    % Check if the source file exists before attempting to move
    if exist(source_file, 'file') == 2
        % Move the file
        movefile(source_file, destination_file);
    else
        fprintf('File %s does not exist in the source folder.\n', files_to_move{i});
    end
end
toc



source_folder = 'F:\image classification\NN_input\output';
destination_folder = 'F:\image classification\NN_input\val_output';
tic
for i = 2:size(val_output_files,1)
    source_file = fullfile(source_folder, val_output_files(i).name);
    destination_file = fullfile(destination_folder, val_output_files(i).name);
    
    % Check if the source file exists before attempting to move
    if exist(source_file, 'file') == 2
        % Move the file
        movefile(source_file, destination_file);
    else
        fprintf('File %s does not exist in the source folder.\n', files_to_move{i});
    end
end
toc

source_folder = 'F:\image classification\NN_input\output';
destination_folder = 'F:\image classification\NN_input\train_output';
tic
for i = 1:size(test_output_files,1)
    source_file = fullfile(source_folder, test_output_files(i).name);
    destination_file = fullfile(destination_folder, test_output_files(i).name);
    
    % Check if the source file exists before attempting to move
    if exist(source_file, 'file') == 2
        % Move the file
        movefile(source_file, destination_file);
    else
        fprintf('File %s does not exist in the source folder.\n', files_to_move{i});
    end
end
toc