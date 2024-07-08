local v0 = require(script.Parent.Parent.React);
local v1 = require(script.Parent.FocusContext);
return function()
    local v2 = v0.useContext(v1);
    if not v2 then
        return nil;
    else
        return v2.focusNode.focusController;
    end;
end;
