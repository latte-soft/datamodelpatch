local l_Parent_0 = script.Parent;
local v1 = require(l_Parent_0.GetImageSetData);
local v2 = require(l_Parent_0.FallbackImages);
local _ = require(l_Parent_0.ImagesTypes);
local v4 = require(l_Parent_0.Parent.Parent.Logger);
local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CorePackages");
local l_status_0, l_result_0 = pcall(l_GuiService_0.GetResolutionScale, l_GuiService_0);
if not (l_status_0 and l_script_FirstAncestor_0) then
    v4:warning("Can't get resolution scale, default to scale 1");
    l_result_0 = 1;
end;
if l_GuiService_0:IsTenFootInterface() then
    v4:info("scale the resolution to 3 for 10 foot UI ");
    l_result_0 = 3;
end;
local v9 = nil;
local v10, v11 = v1(l_result_0);
v9 = v10;
l_result_0 = v11;
v10 = function()
    local l_Parent_1 = script.Parent.Parent.Parent;
    if l_script_FirstAncestor_0 == nil then
        return nil;
    else
        local v13 = {};
        local l_l_Parent_1_0 = l_Parent_1;
        while l_l_Parent_1_0 ~= nil and l_l_Parent_1_0 ~= l_script_FirstAncestor_0 do
            table.insert(v13, 1, l_l_Parent_1_0.Name);
            l_l_Parent_1_0 = l_l_Parent_1_0.Parent;
        end;
        return "LuaPackages/" .. table.concat(v13, "/");
    end;
end;
v11 = function(v15, v16)
    if v15 == nil then
        v4:debug("use fallback images for {}", v16);
        return v2[v16];
    else
        return string.format("rbxasset://%s/AppImageAtlas/%s.png", v15, v16);
    end;
end;
local v17 = v10();
local v18 = {
    ImagesResolutionScale = l_result_0
};
for v19, v20 in pairs(v9) do
    assert(typeof(v20) == "table", "invalid sourceData from GetImageSetData for scale " .. tostring(l_result_0));
    local v21 = {};
    for v22, v23 in pairs(v20) do
        if v22 == "ImageSet" then
            local v24;
            if v17 == nil then
                v4:debug("use fallback images for {}", v23);
                v24 = v2[v23];
            else
                v24 = string.format("rbxasset://%s/AppImageAtlas/%s.png", v17, v23);
            end;
            v21.Image = v24;
        else
            v21[v22] = v23;
        end;
    end;
    v18[v19] = v21;
end;
setmetatable(v18, {
    __index = function(_, v26)
        error(("%q is not a valid member of Images"):format((tostring(v26))), 2);
    end
});
return v18;
