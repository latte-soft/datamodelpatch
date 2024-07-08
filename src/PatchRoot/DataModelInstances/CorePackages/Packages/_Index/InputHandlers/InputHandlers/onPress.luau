local _ = require(script.Parent.Parent.FocusNavigation);
local v1 = require(script.Parent.handleInput);
return function(v2)
    return v1({
        onPress = v2
    });
end;
