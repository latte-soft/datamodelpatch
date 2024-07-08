local v0 = require(game:GetService("CorePackages").Roact);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Immutable);
local v3 = require(l_Modules_0.LuaApp.Components.ShimmerAnimation);
local v4 = require(l_Modules_0.LuaApp.Components.StateButton);
local v5 = v0.PureComponent:extend("LoadableButton");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local v8 = v2.RemoveFromDictionary(l_props_0, v0.Children, "Loading");
    local l_Loading_0 = l_props_0.Loading;
    v8.Disabled = l_props_0.Disabled or l_Loading_0;
    v8.AutoButtonColor = false;
    local v10 = nil;
    if l_Loading_0 then
        v10 = v0.createElement(v3, {
            Size = UDim2.new(1, 0, 1, 0)
        });
    end;
    return v0.createElement(v4, v8, v2.JoinDictionaries(l_props_0[v0.Children] or {}, {
        LoadingShimmer = v10
    }));
end;
return v5;
