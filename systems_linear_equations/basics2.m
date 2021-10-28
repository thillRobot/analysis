% ME 3001 - Mechanical Engineering Analysis with MALTAB 
% Tristan Hill - More Basics - arrays and basic functions

clear all % be sure to clear the workspace before you do anything
close all % this closes all figure windows

% MATLAB has tons of built in functionality
% tools abnd programs from every branch of science and mathematics

% Basic Mathematics Functions 

% create an array from 'min' to 'max' in steps of 'inc'
min=-5;
max=5;
inc=.1;
x=min:inc:max;

% find the number of elements in the array
length(x)

% find the 'shape' or 'dimensions' of the array
size(x)

% two main ways to process, or operate on all the elements

%1) - in a loop

 for i=1:length(x)
    i               %print the index
    x(i)            %print i^th element of the array x
    y(i)=sin(x(i));  %create new array, each time assign the ith element to 
                    %e^x(i)     
 end

% now graph the curve you just computed
figure(1)
plot(x,y) % these two 1-d arrays must have the same length or will not run

figure(2)
plot(y)  % if only 1 arguments is passed in, it is interpretted as y values
         % and array index is used a x values

figure(1)
hold on           % can you tell what 'hold on' does
plot(-2,.2,'rd') % we can also plot individual points on the curve

hold off
for j=1:length(x)
    
    plot(x(j),sin(x(j)),'gd');
    hold on 
    plot(x,y)
    hold off
    pause(.1)
end


         
         



         

         