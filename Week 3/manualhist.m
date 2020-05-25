function p = manualhist
% MANUALHIST generates a bimodel histogram interactively. 
% P = MANUALHIST generates a bimodel histogram using
% TWOMODEGAUSS(m1, sig1, m2, sig2, A1, A2, k). 
% m1 and m2 are the means of the two modes and must be in the range [0, 1]. 
% sig1 and sig2 are the standard deviation of the two modes.  
% A1 and A2 are amplitude values, and
% k is offset value that raises the "floor" of histogram. The number of
% elements in the histogram vector P is 256 and sum(P) is normalized to 1.
% MANUALHIST repeately prompts for the parameters and plots the resulting
% histogram until user types an 'x' to quit, and then it returns the last
% histogram computed.

% Initialize
repeats = true;
quitnow = 'x';

% Compute a default histogram in case the user quits before
% estimateing at least one histogram.
p = twomodegauss(0.15, 0.05, 0.75, 0.05, 1, 0.07, 0.002);

% Cycle until an x is input
while repeats
    s = input('Enter m1, sig1, m2, sig2, A1, A2, k or x to quit:', 's');
    if s == quitnow
        break
    end
    
    % Convert the input string to a vector of numerical values and verify
    % the number of inputs.
        v = str2num(s);
    if numel(v) ~= 7
        disp('Incorrect number of inputs.')
        continue
    end
    
    p = twomodegauss(v(1), v(2), v(3), v(4), v(5), v(6), v(7));
    figure, plot(p)
    xlim([0 255])
end
