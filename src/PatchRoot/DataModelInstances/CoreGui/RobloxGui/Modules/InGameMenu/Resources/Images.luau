local v0 = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck);
local v1 = require(script.Parent.GetImageSetData)((game:GetService("GuiService"):GetResolutionScale()));
local v2 = {};
for v3, v4 in pairs(v1) do
    v0.isType(v4, "table", "value");
    local v5 = {};
    for v6, v7 in pairs(v4) do
        if v6 == "ImageSet" then
            v5.Image = string.format("rbxasset://textures/ui/ImageSet/%s.png", v7);
        else
            v5[v6] = v7;
        end;
    end;
    v2[v3] = v5;
end;
setmetatable(v2, {
    __index = function(_, v9)
        error(("%q is not a valid member of Images"):format((tostring(v9))), 2);
    end
});
return v2;
