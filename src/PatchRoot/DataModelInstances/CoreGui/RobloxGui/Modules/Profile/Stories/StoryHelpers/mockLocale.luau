local v0 = require(script:FindFirstAncestor("Profile").dependencies);
local l_LocalizationProvider_0 = v0.LocalizationProvider;
local l_Roact_0 = v0.Roact;
local v6 = {
    Format = function(_, v4, _)
        return v4;
    end, 
    changed = {
        connect = function()
        end
    }
};
return function(v7, v8)
    return l_Roact_0.createElement(l_LocalizationProvider_0, {
        localization = v6
    }, {
        TestElement1 = l_Roact_0.createElement(v7, v8)
    });
end;
