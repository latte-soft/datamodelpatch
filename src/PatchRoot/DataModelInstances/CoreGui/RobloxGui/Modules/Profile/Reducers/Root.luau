local l_Parent_0 = script.Parent.Parent;
local l_Dash_0 = require(l_Parent_0.dependencies).Dash;
local v2 = require(script.Parent.installReducer);
local _ = require(l_Parent_0.Common.GuiInset);
local v4 = v2();
return function(v5, v6)
    return l_Dash_0.join(v5 or {}, {
        Profile = v4(v5.Profile, v6)
    });
end;
