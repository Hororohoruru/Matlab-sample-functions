function probability(n,k)

% This function simulates a binary probability system (in this case, a coin
% toss), and calculates the probability of getting k number of positive or
% '1' results (in this case, a 'heads' result)

% With n as input, it provides info for all possible k values (k = 0:n)
% If k is provided as input, it only displays the probability for that
% value of k

% n is the number of trials
% k is the number of successes or non-zero results
% p is the probability of a positive outcome (set to 0.5 by default)


p = 0.5;
fprintf('\n')
fprintf('If we flip a coin with %.2f%% probability of going heads %d times:\n', p, n)
fprintf('\n')

fprintf('    The probability of...wait.\n') %%The program asks if p ~= 0.5
prompt1 = '    Sorry for asking this, but I hope that your coin''s probability of going heads is 50%, right? (y/n): ';
x = lower(input(prompt1, 's'));       
                                      
if x == 'y'                           %%If the answer is 'y', it continues
    fprintf('\n')                     %%normally with the p's default value
    fprintf('    Thank you, sorry for asking such a silly question. Then:\n')
    fprintf('\n')
    if nargin == 1                    %%If only n was provided, then it
        for k = 0:n                   %%calculates for al possible k values
            A = nchoosek(n,k);
            prob = A*(p^k)*((1-p)^(n-k));
            fprintf('    The probability of getting %d heads in %d flips is %.6f%%\n', k, n, prob)
        end
    else                              %%If k is provided too, it only 
        A = nchoosek(n,k);            %%calculates for that value of k
        prob = A*(p^k)*((1-p)^(n-k));
        fprintf('    The probability of getting %d heads in %d flips is %.6f%%\n', k, n, prob)
    end
elseif x == 'n'                       %%If the answer is 'n', it asks for
    fprintf('\n')                     %%the new value of p
    prompt2 = '    ...oh. Well, then what''s your coin''s probability of going heads? (Input an integer between 1 and 100): ';
    y = input(prompt2);
    fprintf('\n')
    if y < 1 || y > 100 || floor(y) ~= y || ~isscalar(y)  %%Check if input is an integer between 1 and 100
       fprintf('    That is not a valid answer. Please try again!\n')
    else
        p = y/100;                    %%New value of p is set
        fprintf('    Such a rare coin you have there. None of my business, however. Then:\n')
        fprintf('\n')
        if nargin == 1                %%Same code as in the 'y' answer
            for k = 0:n               %%block for n and n,k provided
                A = nchoosek(n,k);
                prob = A*(p^k)*((1-p)^(n-k));
                fprintf('    The probability of getting %d heads in %d flips is %.6f%%\n', k, n, prob)
            end
        else
            A = nchoosek(n,k);
            prob = A*(p^k)*((1-p)^(n-k));
            fprintf('    The probability of getting %d heads in %d flips is %.6f%%\n', k, n, prob)
        end
    end        
else                                 %%If the answer is not 'y', 'Y', 'n'
    fprintf('\n')                    %%or 'N', this message is shown
    fprintf('    That''s not a valid answer, try again!\n')
end

fprintf('\n')
