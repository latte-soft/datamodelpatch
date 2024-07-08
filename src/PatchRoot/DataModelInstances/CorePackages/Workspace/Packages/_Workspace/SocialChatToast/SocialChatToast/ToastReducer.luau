local v0 = require(script.Parent.Actions.ShowToast);
local v1 = require(script.Parent.Actions.ToastComplete);
return function(v2, v3)
    v2 = v2 or nil;
    if v3.type == v0.name then
        return v3.toast;
    else
        if v3.type == v1.name then
            v2 = nil;
        end;
        return v2;
    end;
end;
