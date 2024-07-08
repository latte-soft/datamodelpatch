local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.AvatarExperience.AvatarEditor.Reducers.DefaultBodyColorRanges);
local v2 = require(l_Modules_0.AvatarExperience.AvatarEditor.Actions.SetDefaultBodyColorRanges);
local v3 = require(l_Modules_0.AvatarExperience.AvatarEditor.Constants);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
local v5 = {
    RawBodyColorRanges = {
        {
            Color3.fromRGB(255, 0, 0), 
            Color3.fromRGB(255, 50, 50), 
            Color3.fromRGB(255, 100, 100)
        }, 
        {
            Color3.fromRGB(0, 255, 0), 
            Color3.fromRGB(50, 255, 50), 
            Color3.fromRGB(100, 255, 100)
        }, 
        {
            Color3.fromRGB(0, 0, 255), 
            Color3.fromRGB(50, 50, 255), 
            Color3.fromRGB(100, 100, 255)
        }, 
        {
            Color3.fromHex("0f0f0f"), 
            Color3.fromHex("888888"), 
            Color3.fromHex("e0e0e0")
        }
    }
};
v5.DefaultBodyColorRanges = v1(nil, v2(v5.RawBodyColorRanges));
v5.ExpectedColorData = {
    range_red_100 = {
        color3 = Color3.fromRGB(255, 100, 100), 
        sliderValue = 1, 
        rangeId = "ff0000"
    }, 
    range_red_050 = {
        color3 = Color3.fromRGB(255, 50, 50), 
        sliderValue = 0.5, 
        rangeId = "ff0000"
    }, 
    range_red_025 = {
        color3 = Color3.fromRGB(255, 25, 25), 
        sliderValue = 0.25, 
        rangeId = "ff0000"
    }, 
    range_green_050 = {
        color3 = Color3.fromRGB(50, 255, 50), 
        sliderValue = 0.5, 
        rangeId = "00ff00"
    }, 
    range_green_075 = {
        color3 = Color3.fromRGB(75, 255, 75), 
        sliderValue = 0.75, 
        rangeId = "00ff00"
    }, 
    range_blue_000 = {
        color3 = Color3.fromRGB(0, 0, 255), 
        sliderValue = 0, 
        rangeId = "0000ff"
    }, 
    range_white = {
        color3 = Color3.fromRGB(255, 255, 255), 
        rangeId = "0f0f0f", 
        sliderValue = 1
    }, 
    range_black = {
        color3 = Color3.fromRGB(0, 0, 0), 
        rangeId = "0f0f0f", 
        sliderValue = 0
    }
};
v5.VariedBodyColorDatas = {
    headColor3 = v5.ExpectedColorData.range_red_100, 
    torsoColor3 = v5.ExpectedColorData.range_green_075, 
    rightLegColor3 = v5.ExpectedColorData.range_blue_000, 
    leftLegColor3 = v5.ExpectedColorData.range_red_025, 
    rightArmColor3 = v5.ExpectedColorData.range_white, 
    leftArmColor3 = v5.ExpectedColorData.range_black
};
v5.VariedBodyColor3s = {};
for v6, v7 in v5.VariedBodyColorDatas, nil, nil do
    v5.VariedBodyColor3s[v6] = v7.color3;
end;
v5.makeBodyColor3s = function(v8)
    local v9 = {};
    for _, v11 in v3.allBodyPartForSkinColoringIds, nil, nil do
        v9[v11] = v8.color3;
    end;
    return v9;
end;
v5.makeBodyPartRangeIds = function(v12)
    local v13 = {};
    for _, v15 in v3.allBodyPartForSkinColoringIds, nil, nil do
        v13[v15] = v12.rangeId;
    end;
    return v13;
end;
v5.makeRangeIdToBodyPartsToSliderAndColor3Values = function(v16)
    local v17 = {};
    for _, v19 in v3.allBodyPartForSkinColoringIds, nil, nil do
        local l_color3_0 = v16.color3;
        local l_rangeId_0 = v16.rangeId;
        local l_sliderValue_0 = v16.sliderValue;
        local v23 = v17[l_rangeId_0] or {};
        v23[v19] = {
            sliderValue = l_sliderValue_0, 
            color3 = l_color3_0
        };
        v17[l_rangeId_0] = v23;
    end;
    return v17;
end;
return v5;
