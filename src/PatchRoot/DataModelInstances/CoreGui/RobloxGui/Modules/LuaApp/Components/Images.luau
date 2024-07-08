local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local v2 = require(l_CorePackages_0.Workspace.Packages.RobloxAppAssets).GetImageSetData((game:GetService("GuiService"):GetResolutionScale()));
local v3 = {};
for v4, v5 in pairs(v2) do
    v1.isType(v5, "table", "value");
    local v6 = {};
    for v7, v8 in pairs(v5) do
        if v7 == "ImageSet" then
            v6.Image = string.format("rbxasset://textures/ui/ImageSet/%s.png", v8);
        else
            v6[v7] = v8;
        end;
    end;
    v3[v4] = v6;
end;
setmetatable(v3, {
    __index = function(_, v10)
        error(("%q is not a valid member of Images"):format((tostring(v10))), 2);
    end
});
return v3;
