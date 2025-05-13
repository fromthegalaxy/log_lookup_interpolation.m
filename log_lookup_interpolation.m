
% a
function [xref, yref] = lookup(h)

% 2 + Nh = 8
N = (8 - 2) / h;

% x is the set of numbers from 2 to 8 with step h
xref = 2:h:8;

% calculate f(x) = x + ln(X)
yref = xref + log(xref);

end


% b
function [fx] = LLinterp(xref, yref, x)

%check if x is with within range
if x < 2 || x > 8
    error('Input out of range')
end

n = length(xref);
index = 1;  % initialize the index in xref

for i = 1:n-1

    if x == xref(i)
        % if input x matches number in xref, return directly
        fx = yref(i);
        return ;
    elseif x == 8
        % since the loop stops at n-1, check x = 8 as well
        fx = yref(n);
        return;
    elseif i < n && x > xref(i) && x < xref(i+1)
        % otherwise, record the index where x is bewteen two numbers in
        % xref, and proceed with Lagrance formula
        inedx = i;
        break;
    end
end

% extract the interval of x falls in
x1 = xref(index);
x2 = xref(index+1);
y1 = yref(index);
y2 = yref(index+1);

% apply Lagrance formula
fx = y1 * (x2 - x) / (x2 - x1) + y2 * (x - x1) / (x2 - x1);

end



% c
N = 60;         % number of intervals
h = (8-2) / N;  % step size, from 2 to 8

% generate a set of 100 random number in [2,8]
x_random = 2+(8-2)*rand(100, 1);  
dev = zeros(100, 1);

for i = 1: length(x_random)

    y_real = x_random(i) + log(x_random(i)); % real value of f(x)
    [xref,yref] = lookup(h);    % creates xref and yref with h
    y_est = LLinterp (xref, yref, x_random(i));% compute interpolated val
    dev(i) = abs(y_real - y_est);
end

% calculate the mean value
avg_dev = mean(dev);
disp(avg_dev)





% the average deviation observed is 0.6155. I wouldn't expect
% the same average deviation every time I run the code, as the 
% values of x are generated randomly every time.

