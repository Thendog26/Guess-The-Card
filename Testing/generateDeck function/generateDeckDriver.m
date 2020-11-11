deck = generateDeck();
for i = 1:length(deck)
    fprintf("i: %i\n", i);
    fprintf("%s \n\n", deck(i));
end