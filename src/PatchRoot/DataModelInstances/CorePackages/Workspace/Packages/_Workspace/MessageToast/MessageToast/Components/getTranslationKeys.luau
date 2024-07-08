local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Common.TextKeys);
local v2 = require(l_Parent_0.Common.Types);
local v3 = {
    [v2.DefaultError] = {
        toastTitle = v1.DefaultErrorTitle, 
        toastSubtitle = v1.DefaultErrorSubtitle
    }
};
return function(v4, v5)
    if not (v4 == v2.Custom) or not v5 then
        return v3[v4];
    else
        return v5;
    end;
end;
