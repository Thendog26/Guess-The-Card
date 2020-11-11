%% This function generates and returns a standard 52 card deck as a string array
%% Nathan Shepherd, 25-04-2020

function [deck] = generateDeck()
    % initialising variables
    deck = [];
    tempdeck = [];
    
    % deck information
    suits = ["Clubs", "Diamonds", "Hearts", "Spades"]; 
    cards = ["Ace", "2", "3", "4", "5", "6", "7", "8", "9", "10", "Jack", "Queen", "King"];
    
    % deck generation loop
    for i = 1:4 % suit loop
        for j = 1:13    % card looop
            tempcard = sprintf("%s of %s", cards(j), suits(i));
            tempdeck = [tempdeck, tempcard];
        end
        deck = [deck, tempdeck];    % master deck output
        tempdeck = [];
    end
end