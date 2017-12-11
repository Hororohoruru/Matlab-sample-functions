%This scrip will create a blank figure and present several stimuli
%to the participant.

%In each trial, the participant must quickly perform a visual search
%in order to determine whether there is a target stimulus (black 'X')
%or not. The participant must press the 's' key if there is a target,
%and the 'l' key if it isn't.

%In this version of the script, only the condition with 4 targets is
%present, and only in a modality where the target is the only black colored
%stimulus.

%Each condition is composed by 40 trials. 

%For the data collection, the
%matrix called 'raw_number' collects the participant's answer in its first
%column. If there is a target in the corresponding trial, the second column
%digit will be '1', and be left with the default '0' otherwise.

%After collecting the data corresponding to the 40 trials, the two columns
%of the raw matrix will be compared, and if their values are equal, it will
%be considered a correct answer. Then, the matrix 'correct_number' will get
%a value of '1' in the corresponding trial if the answer is correct, while
%the second column will collect the reaction times of each trial


clear variables
close all

h = figure('Color', 'w', 'ToolBar', 'none', 'MenuBar', 'none');
raw_4 = zeros(40,2);
correct_4 = zeros(40,2);

for n = 1:40     %This loop will generate the 40 trials for each condition
    axis off
    for i = 1:2
        O = text(rand(1,1), rand(1,1), 'O', 'Color', 'b', 'FontSize', 12);
        X = text(rand(1,1), rand(1,1), 'X', 'Color', 'b', 'FontSize', 12);
    end
    target_chance = rand(1,1);   %A random number between 0 and 1 is generated,
    if target_chance < 0.5       %if it-s lower than 0.5, the last printed 'X'
        set(X, 'Color', 'k')     %is turned black
        raw_4(n,2) = 1;          
    end
    tic
    pause
    answer = get(h, 'CurrentCharacter');
    correct_4(n,2) = toc;        %Reaction time is stored in the correct matrix
    if answer == 's'
        answer = 1;
    elseif answer == 'l'
        answer = 0;
    else                         %If the answer provided by the participant
        answer = 2;              %is neither 's' nor 'l', the value in the
    end                          %matrix becomes 2, thus always resulting on
    raw_4(n,1) = answer;         %an incorrect answer, but providing additional
    if raw_4(n,1) == raw_4(n,2)  %information
        correct_4(n,1) = 1;
    end
    delete(gca)
end

