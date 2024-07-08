local _ = require(script.Parent.Parent.FocusNavigation);
local v1 = require(script.Parent.handleInput);
return function(v2, v3, v4)
    return v1({
        hold = {
            durationSeconds = v2, 
            onComplete = v3, 
            onStep = v4
        }
    });
end;
