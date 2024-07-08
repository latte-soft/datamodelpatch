local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.Common.Roact);
local v3 = require(l_CorePackages_0.Cryo);
local l_ImageSetLabel_0 = require(l_CorePackages_0.UIBlox).Core.ImageSet.ImageSetLabel;
local v5 = require(l_Modules_0.LuaApp.Components.GenericIconButton);
local v6 = v2.PureComponent:extend("GenericIconButtonUIBlox");
v6.render = function(v7)
    return v2.createElement(v5, v3.Dictionary.join(v7.props, {
        iconComponent = l_ImageSetLabel_0
    }));
end;
return v6;
