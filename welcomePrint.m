%% function that prints the welcome message to the game
%% Nathan Shepherd - 25/04/2020

function [ menu ] = welcomePrint()
    fprintf("\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\n");
    fprintf("\a Welcome to 'Guess The Card'! \a\n\a Made by Nathan Shepherd      \a\n\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\a\n");
    fprintf("1. Start Game\n");
    fprintf("2. Rules/Goals\n");
    menu = input("\nWhat would you like to do?(e.g to start the game, enter '1'): ",'s');
end