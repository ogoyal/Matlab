%Task 1
%Names: Ojas Goyal, Kyle Tsuyemura, Aaron Yang; Section A02
%Program: Solves an equation used in Quantum Mechanics and
%Electromagnetics. The equation is cot(x) = sqrt((xo^2/x^2) - 1).
%We are trying to find solutions for x when the equation is true.
while true
    %Task 2: ask user value for N which divides the variable x into N
    %points
    N = input('Enter a discretization of x-variable (N): ');
    if isempty(N) %Task 4: sets default parameters
        N = 1000;
    end
    %Task 3: ask user for xo
    xo = input('Enter a value for xo: ');
    if isempty(xo) %Task 4: sets default parameters
        xo = 20;
    end
    %Task 3: ask user for number of solutions
    solutions = input('Enter number of solutions: ');
    if isempty(solutions) %Task 4: sets default parameters
        solutions = 5;
    end
    if solutions > xo %Task 3: if # of solutions asked is greater than xo, set solutions to min. value
        disp('Error. Number of solutions > xo')
        solutions = xo;
    end
    %Task 5: Asks for precision
    precision = input('Enter the precision: ');
    x = linspace(-xo,xo,N); %divides x into N points
    %Task 6: Plot left and right side of the equation
    plot(x, cot(x)); axis([-xo xo -xo xo]); grid on; xlabel('x'); ylabel('y'); title('Graph of Quantum Well Equation')
    hold on
    plot(x, sqrt((xo^2./x.^2) - 1), 'r'); grid on;
    xlabel('x'); ylabel('y')
    %Task 7: Asks the user for the m-th interval
    m = input('Enter m-th interval: ');
    while m ~= 0 %continue the loop until the user enters 0
        x = linspace(-xo,xo,abs(2*xo/pi)); %makes the intervals of pi from -xo to xo
        if abs(m) >= abs(2*xo/pi) %checks if the input for m is within the correct range
            disp('Error, value of m is greater than possible')
            m = input('Enter m-th interval (Enter 0 to quit): ');
        end
        for k = x(abs(m)):precision:x(abs(m)+ 1) %using for loop to find solutions for the equation
            g = cot(k) - sqrt((xo^2/k^2) - 1);
            if abs(g)<=precision
                fprintf('The solution is %d in the %d-th interval \n', k, abs(m)) %displays the solution
            end
        end
        m = input('Enter m-th interval (Enter 0 to quit): ');
        if m == 0 %exit when the user enters 0
            break
        end
    end
    %Task 8: Continue the program until the user enters no
    answer = input('Do you want to find another solution (yes or no)?: ', 's');
    switch answer
        case ('yes')
            continue
        case ('no')
            disp('Alright, I am done then');
            break
        otherwise
            disp('Sorry, I do not understand')
            continue
    end
end