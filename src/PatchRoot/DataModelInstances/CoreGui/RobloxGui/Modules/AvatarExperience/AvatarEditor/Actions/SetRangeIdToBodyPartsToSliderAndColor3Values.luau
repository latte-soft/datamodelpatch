local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Rodux);
local v3 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = require(l_Modules_0.LuaApp.mutedError);
local v6 = require(l_Modules_0.AvatarExperience.ColorPicker.ColorPickerUtils);
local v7 = require(l_Modules_0.AvatarExperience.Flags.FFlagColorPickerSliderEpsilon);
return v2.makeActionCreator(script.Name, function(v8, v9, v10, v11)
    v3.isType(v8, "string", "rangeId");
    v3.isType(v9, "string", "bodyPartForSkinColoringId");
    v3.isType(v10, "number", "sliderValue");
    if not v7 then
        if not (v10 >= 0) or v10 > 1 then
            v5(string.format("SetRangeIdToBodyPartsToSliderAndColor3Values: sliderValue %s should be between 0 and 1 inclusive", (tostring(v10))));
            v10 = math.clamp(v10, 0, 1);
        end;
    else
        local v12, v13 = v6.clampBetween0And1(v10);
        if v13 then
            v5(string.format("getColor3AtValueInRange: value %s should be between 0 and 1 inclusive", (tostring(v10))));
        end;
        v10 = v12;
    end;
    v3.isType(v11, "Color3", "color3");
    return {
        rangeId = v8, 
        bodyPartForSkinColoringId = v9, 
        sliderValue = v10, 
        color3 = v11
    };
end);
