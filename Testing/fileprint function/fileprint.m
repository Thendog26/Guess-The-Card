% This function is used to read the text from the specified .txt file and
% output it to the screen
%% Nathan Shepherd - 25/04/2020 

function [] = fileprint(txt)

   % reads input
   text=fileread(txt);
   
   % cycles through text input and prints it out line by line
   for i = 1:length(text)
       fprintf("%s", text(i));
   end
   
   fprintf('\n');
   
end