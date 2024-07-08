local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local v2 = require(l_Parent_1.Parent.Parent.React);
local v3 = require(l_Parent_1.Indicator.StatGroup);
local v4 = require(l_Parent_0.FooterFrame);
return function(v5)
    return v2.createElement(v4, v5, {
        Stats = v2.createElement(v3, {
            ratingText = v5.ratingText, 
            playingText = v5.playingText
        })
    });
end;
