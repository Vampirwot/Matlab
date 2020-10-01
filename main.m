clc
clear all
 
greetings = sprintf(['Программа определения параметров рассеивающей среды по экспериментальному временному распределению\n' ...
    'Choose the scenario: press enter "y", if you want to launch user''s scenario\n'...
    'or enter "n", if you want to launch default scenario.']);
disp(greetings);
choise = input('y/n?: ', 's');
if (choise == 'y')
    disp('You choose the users''s scenario')
    user_scenario();
end
if (choise == 'n')
    disp('You choose the default scenario')
    default_scenario();
end

