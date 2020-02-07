function [ ok ] = DisplayWords( window, wRect, color, ...
    txtcolor, distancex, textstyle, filled, firstword,...
    secondword, thirdword, fourthword, distancey)
%DisplayWords 
%   Displays words a particular (given) distance from the center of
%   the screen

%   Assumes Psychtoolbox has been initiated, 'OpenWindow' performed, screen
%   number found, etc. (See TestScreenText.m for example)

%   Distance is distance from center in x or y direction -- choose in
%   proportion of total screen size (e.g. if you want words halfway between
%   the corner of the screen and the center, input 4 for a quarter, if you
%   want the words a little closer to the corners, input 3 for a third)
%   Color is the color of the circle (either outline or filled in)
%   Textstyle is 0=normal, 1=bold, 2=italic, 4=underline, 8=outline,
%   32=condense, 64=extend
%   Filled=1 if you want the circle filled in, filled=0 if you want just an
%   outline circle
%   Function will assume that if you give a third word, you will also give
%   a fourth and want 4 displayed. If you give only 2 words, will assume
%   only want 2 displayed. Can only display either 2 or 4 words. If 4
%   words, requires distancey inputted.

[xCenter, yCenter] = RectCenter(wRect);
baseRect = [0 0 50 50];
centeredRect = CenterRectOnPointd(baseRect, xCenter, yCenter);
maxDiameter = max(baseRect);

Screen('TextStyle', window, textstyle); % textstyle Bold (0=normal, 1=bold, 
    % 2=italic, 4=underline, 8=outline, 32=condense, 64=extend)

if nargin < 10
    thirdword = '0';
    fourthword = '0';
    distancey = 0;
    numberwords = 2;
else
    numberwords = 4;
end
    
if numberwords == 4

    if filled == 0

        Screen('FrameOval', window, color, centeredRect, 5, 5);
    
        Screen_ctext(window, wRect, firstword, -(wRect(3)/distancex), -(wRect(4)/distancey), txtcolor, 30)
        Screen_ctext(window, wRect, secondword, +(wRect(3)/distancex), -(wRect(4)/distancey), txtcolor, 30)
        Screen_ctext(window, wRect, thirdword, -(wRect(3)/distancex), +(wRect(4)/distancey), txtcolor, 30)
        Screen_ctext(window, wRect, fourthword, +(wRect(3)/distancex), +(wRect(4)/distancey), txtcolor, 30)

        Screen('Flip',window);
    
    elseif filled == 1

        Screen('FillOval', window, color, centeredRect, maxDiameter);
    
        Screen_ctext(window, wRect, firstword, -(wRect(3)/distancex), -(wRect(4)/distancey), txtcolor, 30)
        Screen_ctext(window, wRect, secondword, +(wRect(3)/distancex), -(wRect(4)/distancey), txtcolor, 30)
        Screen_ctext(window, wRect, thirdword, -(wRect(3)/distancex), +(wRect(4)/distancey), txtcolor, 30)
        Screen_ctext(window, wRect, fourthword, +(wRect(3)/distancex), +(wRect(4)/distancey), txtcolor, 30)

        Screen('Flip', window);
    
    end
    
elseif numberwords == 2
    
    if filled == 0

        Screen('FrameOval', window, color, centeredRect, 5, 5);
    
        Screen_ctext(window, wRect, firstword, -(wRect(3)/distancex), 0, txtcolor, 30)
        Screen_ctext(window, wRect, secondword, +(wRect(3)/distancex), 0, txtcolor, 30)

        Screen('Flip',window);
    
    elseif filled == 1

        Screen('FillOval', window, color, centeredRect, maxDiameter);
    
        Screen_ctext(window, wRect, firstword, -(wRect(3)/distancex), 0, txtcolor, 30)
        Screen_ctext(window, wRect, secondword, +(wRect(3)/distancex), 0, txtcolor, 30)

        Screen('Flip', window);
    
    end
    
end

ok = 1;

end

