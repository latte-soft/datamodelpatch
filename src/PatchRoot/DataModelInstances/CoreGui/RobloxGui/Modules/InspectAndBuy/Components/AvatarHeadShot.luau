local l_CorePackages_0 = game:GetService("CorePackages");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Parent_0.Colors);
local v6 = v3.PureComponent:extend("AvatarHeadShot");
local l_Headshot_0 = require(l_CoreGui_0:WaitForChild("RobloxGui"):WaitForChild("Modules").Common.LegacyThumbnailUrls).Headshot;
v6.render = function(v8)
    local l_playerId_0 = v8.props.playerId;
    local v10 = nil;
    if l_playerId_0 and l_playerId_0 ~= "" then
        v10 = l_Headshot_0:format(l_playerId_0, 48, 48);
    end;
    if v10 then
        return v3.createElement("ImageLabel", {
            Size = UDim2.new(0, 48, 0, 48), 
            BackgroundColor3 = v5.GrayBackground, 
            BorderSizePixel = 0, 
            Image = v10, 
            LayoutOrder = 1
        }, {
            MaskFrame = v3.createElement("ImageLabel", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Image = "rbxasset://textures/ui/LuaApp/graphic/gr-avatar mask-90x90.png", 
                ImageColor3 = v5.Carbon
            })
        });
    else
        return nil;
    end;
end;
return v4.UNSTABLE_connect2(function(v11, _)
    return {
        playerId = v11.playerId
    };
end)(v6);
