local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Actions.SetPromptState);
local v2 = require(l_Parent_0.Enums.PromptState);
local v3 = require(l_Parent_0.Services.PlatformInterface);
local v4 = require(l_Parent_0.Thunk);
local v5 = {
    v3
};
return function()
    return v4.new(script.Name, v5, function(v6, v7)
        local v8 = v7[v3];
        v6:dispatch(v1(v2.UpsellInProgress));
        v8.openRobuxStore();
    end);
end;
