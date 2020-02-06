function [correctness] = Correct_OrNot(no_words,...
    targ_position,x,y,roi_1,roi_2,roi_3,roi_4)
%Correctness_Sample 
%   Determine whether a selection is correct or incorrect
%
%   targ_position is a number between 1 and 4 indicating where on screen
%   Correct Answer is
%       if no_words = 2
%           1 = left side; 2 = right side
%       if no_words = 4
%           1 = top left; 2 = top right; 3 = bottom left; 4 = bottom right
%
%   ROI's are expected to be vectors of length 4:
%       [xmax (right-most), xmin, ymax (bottom-most), ymin]
%   if no_words = 2, will use only roi_1 (LEFT) and roi_2 (RIGHT)
%   if no_words = 4, will use all 4 rois
%       roi_1 = top left; roi_2 = top right; roi_3 = bottom left; roi_4 =
%       bottom right
%
%   Correctness output will be 1 for correct or 0 for incorrect


if no_words == 2
    
    if targ_position == 1 %left
        
        if x <= roi_1(1) && x >= roi_1(2) && y <= roi_1(3) && y >= roi_1(4)%in left ROI
            correctness = 1;
        else
            correctness = 0;
        end
        
    elseif targ_position == 2 %right
        
        if x <= roi_2(1) && x >= roi_2(2) && y <= roi_2(3) && y >= roi_2(4)%in right ROI
            correctness = 1;
        else
            correctness = 0;
        end
        
    else
        error('if no_words is 2, targ_position must be 1 or 2')
    end
    
elseif no_words == 4
    
    if targ_position == 1 %top left
        
        if x <= roi_1(1) && x >= roi_1(2) && y <= roi_1(3) && y >= roi_1(4)%in left top ROI
            correctness = 1;
        else
            correctness = 0;
        end
        
    elseif targ_position == 2 %top right
        
        if x <= roi_2(1) && x >= roi_2(2) && y <= roi_2(3) && y >= roi_2(4)%in right top ROI
            correctness = 1;
        else
            correctness = 0;
        end
        
    elseif targ_position == 3 %bottom left
        
        if x <= roi_3(1) && x >= roi_3(2) && y <= roi_3(3) && y >= roi_3(4)%in left bottom ROI
            correctness = 1;
        else
            correctness = 0;
        end
        
    elseif targ_position == 4 %bottom right
        
        if x <= roi_4(1) && x >= roi_4(2) && y <= roi_4(3) && y >= roi_4(4)%in right bottom ROI
            correctness = 1;
        else
            correctness = 0;
        end
        
    else
        error('if no_words is 4, targ_position must be 1, 2, 3, or 4')
    end
    
else
    error('no_words must be 2 or 4')
end





end

