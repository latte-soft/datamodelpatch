local v0 = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Actions.SetGlobalContextMenuInset);
return function(v1, v2)
    v1 = v1 or {
        left = 0, 
        top = 0, 
        right = 0, 
        bottom = 0
    };
    assert(v1, "");
    if v2.type == v0.name then
        return {
            left = v2.left, 
            top = v2.top, 
            right = v2.right, 
            bottom = v2.bottom
        };
    else
        return v1;
    end;
end;
