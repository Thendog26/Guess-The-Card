card = "8";
suit = "Clubs";
pick = "Ace of Spades";
[test1suit_hint, test1five_hint, test1two_hint] = hintCheck(card, suit, pick);
disp(test1suit_hint); % expected 0, output 0
disp(test1five_hint); % expected 0, output 0
disp(test1two_hint);  % expected 0, output 0

card = "10";
suit = "Diamonds";
pick = "5 of Diamonds";
[test2suit_hint, test2five_hint, test2two_hint] = hintCheck(card, suit, pick);
disp(test2suit_hint); % expected 1, output 1
disp(test2five_hint); % expected 1, output 1
disp(test2two_hint);  % expected 0, output 0

card = "11";
suit = "Clubs";
pick = "Jack of Hearts";
[test3suit_hint, test3five_hint, test3two_hint] = hintCheck(card, suit, pick);
disp(test3suit_hint); % expected 0, output 0
disp(test3five_hint); % expected 1, output 1
disp(test3two_hint);  % expected 1, output 1