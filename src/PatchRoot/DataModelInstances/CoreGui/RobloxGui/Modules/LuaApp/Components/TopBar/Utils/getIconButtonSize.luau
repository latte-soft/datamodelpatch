local l_CorePackages_0 = game:GetService("CorePackages");
local _ = game:GetService("CoreGui").RobloxGui.Modules;
local l_FormFactor_0 = require(l_CorePackages_0.Workspace.Packages.FormFactor).Enums.FormFactor;
local _ = require(l_CorePackages_0.Cryo);
local _ = require(l_CorePackages_0.Roact);
local _ = require(l_CorePackages_0.RoactNavigation);
local v6 = require(script.Parent.Parent.TopBarConstants);
local v7 = {
    [l_FormFactor_0.COMPACT] = {
        IconButtonSize = 34
    }, 
    [l_FormFactor_0.WIDE] = {
        IconButtonSize = 44
    }
};
return function(v8)
    local v9 = v7[v8];
    return not not v9 and v9.IconButtonSize or v6.DEFAULT_ICON_BUTTON_SIZE;
end;
