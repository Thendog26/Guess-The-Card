%% This function takes in the suit and card guess from the user and returns whether the hint is true or not
%% Nathan Shepherd - 25/04/2020

function [suit, five, two] = hintCheck(cardGuess, suitGuess, pick)

    % splits pick into individual words
    pick_array = strsplit(pick);
    
    % converts name numbers to their numerical value for testing purposes
    switch (pick_array(1))
        case "Ace"
            pick_array(1) = "1";
        case "Jack"
            pick_array(1) = "11";
        case "Queen"
            pick_array(1) = "12";
        case "King"
            pick_array(1) = "13";
    end
    
    %% suit hint test
    if pick_array(3) == suitGuess
        suit = true;
    else
        suit = false;
    end
    
    %% five hint test
    five_test = false;
    while (five_test == false)
        
    if (str2num(pick_array(1)) >= str2num(cardGuess))
        
        % if cardGuess is smaller or equal to pick
        count = 0; 
        for i = str2num(cardGuess):str2num(pick_array(1))
            if count < 6
                if (str2num(cardGuess)+count) == str2num(pick_array(1))
                    five = true;
                    five_test = true;
                end
                count = count + 1;
            else
                five = false;
                five_test = true;
            end
        end
        
    else
        % if pick is smaller than cardGuess 
        count = 0;
        for i = str2num(pick_array(1)):str2num(cardGuess)
            if count < 6
                if str2num(cardGuess) == (str2num(pick_array(1))+count)
                    five = true;
                    five_test = true;
                end
                count = count + 1;
            else
                five = false;
                five_test = true;
            end
        end
        
    end
    
    end
    
    %% two hint test
    two_test = false;
    while (two_test == false)
        
    if (str2num(pick_array(1)) >= str2num(cardGuess))
        
        % if cardGuess is smaller or equal to pick
        count = 0; 
        for i = str2num(cardGuess):str2num(pick_array(1))
            if count < 3
                if (str2num(cardGuess)+count) == str2num(pick_array(1))
                    two = true;
                    two_test = true;
                end
                count = count + 1;
            else
                two = false;
                two_test = true;
            end
        end
        
    else
        % if pick is smaller than cardGuess 
        count = 0;
        for i = str2num(pick_array(1)):str2num(cardGuess)
            if count < 3
                if str2num(cardGuess) == (str2num(pick_array(1))+count)
                    two = true;
                    two_test = true;
                end
                count = count + 1;
            else
                two = false;
                two_test = true;
            end
        end
        
    end
    
    end
end