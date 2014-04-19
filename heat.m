%Task 1
%Names: Ojas Goyal, Kyle Tsuyemura, Aaron Yang; Section A02
%Program: The purpose of this program is to solve the multi-variable Poisson Equations
%for the evolution of heat. The program shows how heat dissipates over time
%under certain conditions.

h = 0.025E-6; % thermal conductivity
c = 1E3;       % heat capacity
d = 1E-15;   % density of a material 
alpha = h/(c*d);

%Task 2: Verify the equation analytically and find the relationship between
%alpha and k
k = alpha/4;

%Task 3: Prompts user to type in the initial point source location
u=300; %Initial temperature of the system in Kelvins
heater = 400; %point source with temperature 400 Kelvins
xo=input('Enter value for xo: ');
while abs(xo) >= 400    %if xo is greater than 400, then get a smaller input
    disp('Enter value for xo less than 400')
    xo=input('Enter value for xo: ');
end
yo=input('Enter value for yo: ');
while abs(yo) >= 400    %if yo is greater than 400, then get a smaller input
    disp('Enter value for yo less than 400')
    yo=input('Enter value for yo: ');
end
zo=input('Enter value for zo: ');
while abs(zo) >= 400    %if zo is greater than 400, then get a smaller input
   disp('Enter value for zo less than 400')
   zo=input('Enter value for zo: ');
end
if isempty(xo) %Set default value
    xo=0;
end
if isempty(yo) %Set default value
    yo=0;
end
if isempty(zo) %Set default value
    zo=0;
end
%Task 4
T=input('Enter the time, T: '); %ask for the time 
for t = 0:.5:T %Task 5, 7: Makes a movie from 0 to the time specified by the user.
    g=@(X,Y) (300+ (((4*pi*t.*k)^(-3/2))*exp(-((X-xo).^2+(Y-yo).^2+(-zo).^2)/(4*t.*k))));
    %The equation that calculates heat dissipated.
    x = -400:400; y = x; [X,Y] = meshgrid(x,y); %Making X and Y a Matrix to solve the equation.
    z = g(X,Y); %Get the temperature values from the equation.
    mesh(X,Y,z); axis([-400 400 -400 400 300 380]); grid on; %Graphing and labeling axis.
    xlabel('distance in x [um]'); ylabel('distance in y [um]'); zlabel('Temperature [K]');
    pause(0.5) %adds a delay for each image shown
end
%Task 6: Makes a contour graph
    figure(2); contour(z); title('Contour Graph'); grid on;
    xlabel('distance in x [um]'); ylabel('distance in y [um]');