%% This program is the project of a1766539 for intro to programming- matlab and C. It is a simple card guessing game where the computer randomly picks a card and the user has to guess which card it is with hint assistance.
%% a1766539 - 25/04/2020

%% Section 1 ~ Start menu %%
% Prints out welcome message and menu options to the user of the game
clc
correct_input = false;

% loop that determines the user's choice during the 'welcomePrint' function
while correct_input == false
    menu = welcomePrint(); % Custom function that displays all the menu information for the game and returns the user's choice
    
    % 1 = start game, 2 = check rules
    if menu == '1'
        correct_input = true;
    elseif menu == '2'
        clc
        fileprint('Rules.txt');  % Custom function that takes in a text file as given parameter and prints it out as a string to the screen line by line
        pause = input("\nPress enter to return ", 's');
        clc
    else
        clc
    end
end
clc


%% Section 2 ~ Card game mechanics %%

% generates deck and picks a random card from that deck
deck = generateDeck();  % Custom function that generates a deck of 52 cards, stores them into a string array, and returns that array
pick = deck(randi(52,1,1)); % random picking
%disp(pick);

% initialising variables
correct_pick = false;   % correct pick indicator
total_guesses = 3;      % total number of guesses (easier to adjust from a single variable)
count = 0;              % user guess tracker
suit_tester = false;    % suit variable tester
card_tester = false;    % card variable tester
replay = true;          % variable for replaying the game

% loop that determines whether or not the game restarts
while (replay == true)
%% game loop (only escape after 4 guesses (loss) or correct guess (win)) %%
while (correct_pick == false && count < total_guesses)
    
    % user input
    % ~suit input - where the user guesses the suit~
    while (suit_tester == false)
        
        % guess input
        fprintf("Note: Hearts = H/h, Diamonds = D/d, Spades = S/s, and Clubs = C/c\n"); 
        suitguess = input("\nWhat do you think the suit will be?: ", 's');
        clc
        
        % only accepts valid suit guesses
        if (suitguess == "c" || suitguess == "C" || suitguess == "d" || suitguess == "D" || suitguess == "h" || suitguess == "H" || suitguess == "s" ||suitguess == "S")
            suit_tester = true;
        end
    end
    suit_tester = false;
    
    % ~card input - where the user guesses the card~
    while (card_tester == false)
        
        % guess input
        fprintf("Note: 1,11,12,13 = Ace, Jack, Queen, King\n")
        cardguess = input("\nWhat do you think the card number will be?: ", 's');
        clc
        
        % only accepts valid card guesses
        for i=1:13
            if (str2num(cardguess) == i)    % this string convertion method prevents errors occuring mid-script
                card_tester = true;   
            end
        end
        
    end
    card_tester = false;
    numcard = cardguess;   % useful later for hint section
    
    % converts numbers to card names
    switch(cardguess)
        case "1"
            cardguess = "Ace";
        case "11"
            cardguess = "Jack";
        case "12"
            cardguess = "Queen";
        case "13"
            cardguess = "King";
    end
    
    % converts letters to suit names
    switch(suitguess)
        case ("h")
            suitguess = "Hearts";
        case ("H")
            suitguess = "Hearts";
        case ("d")
            suitguess = "Diamonds";
        case ("D")
            suitguess = "Diamonds";
        case ("s")
            suitguess = "Spades";
        case ("S")
            suitguess = "Spades";
        case ("c")
            suitguess = "Clubs";
        case ("C")
            suitguess = "Clubs";
        otherwise
            disp("\ninvalid suit\n");   % here for testing purposes 
    end
    
    % prints guess on screen and whether or not it's correct
    guess = sprintf("%s of %s", cardguess, suitguess);
    fprintf("Your guess: %s", guess);
    
    if(strcmp(guess,pick)==1)    % win determination mechanism
        fprintf("\nCorrect! Congratulation, you guessed the right card! :D\nThanks for playing!\n");
        correct_pick = true;
    else
        fprintf("\nIncorrect!\n");
        if count+1 >= total_guesses
            fprintf("\n(Guess %i out of ", count+1);
            fprintf("%i)\n", total_guesses);
            fprintf("\nBetter luck next time!");
            fprintf("\nCorrect answer: %s\n", pick);
            count = count + 1;
        else
            fprintf("\n~ Hints ~")
            
            % Custom function that takes in information about the suit and
            % card guess, and determines whether they fit the hint criteria
            [suit_hint, five_hint, two_hint] = hintCheck(numcard, suitguess, pick);
            
            % suit hint display result
            if suit_hint == true
                fprintf("\nSuit: Correct")
            else
                fprintf("\nSuit: Incorrect")
            end
                
            % five hint display result
            if five_hint == true
                fprintf("\nWithin five numbers?: Yes")
            else
                fprintf("\nWithin five numbers?: No")
            end
                
            % two hint display result
            if two_hint == true
                fprintf("\nWithin two numbers?: Yes")
            else
                fprintf("\nWithin two numbers?: No")
            end
            
            % guess count
            count = count + 1;
            fprintf("\n(Guess %i out of ", count);
            fprintf("%i)\n", total_guesses);
            
            % pause mechnism (for the user to read results)
            pause = input("\nPress enter when you're ready to continue...", 's');
            clc
        end
    end
    
end

    
    %% restart game mechanism %%
    
    % prompt
    replay_prompt = input("\nDo you want to play again? (Y/N): ", 's');
    clc
    
    % "yes"
    if (replay_prompt == "Y" || replay_prompt == "y")
        % reinitialising variables back to default state
        correct_pick = false;   % correct pick indicator
        count = 0;              % user guess tracker
        suit_tester = false;    % suit variable tester
        card_tester = false;    % card variable tester
        
        % picks a new card from the deck
        pick = deck(randi(52,1,1)); 
    
    % "no"
    else
        % breaks the while loop, ending the game if anything but yes is
        % chosen
        replay = false;
    end
end
