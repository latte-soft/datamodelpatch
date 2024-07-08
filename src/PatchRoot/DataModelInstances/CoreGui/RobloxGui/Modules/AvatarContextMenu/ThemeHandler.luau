local l_InsertService_0 = game:GetService("InsertService");
local l_StarterGui_0 = game:GetService("StarterGui");
local v2 = {
    BackgroundImage = "rbxasset://textures/blackBkg_round.png", 
    BackgroundImageScaleType = Enum.ScaleType.Slice, 
    BackgroundImageSliceCenter = Rect.new(12, 12, 12, 12), 
    BackgroundImageTransparency = 0, 
    BackgroundTransparency = 1, 
    BackgroundColor = Color3.fromRGB(31, 31, 31), 
    NameTagColor = Color3.fromRGB(79, 79, 79), 
    NameUnderlineColor = Color3.fromRGB(255, 255, 255), 
    ButtonFrameColor = Color3.fromRGB(79, 79, 79), 
    ButtonFrameTransparency = 0, 
    ButtonImage = "", 
    ButtonImageScaleType = Enum.ScaleType.Slice, 
    ButtonImageSliceCenter = Rect.new(8, 6, 46, 44), 
    ButtonColor = Color3.fromRGB(79, 79, 79), 
    ButtonTransparency = 1, 
    ButtonHoverColor = Color3.fromRGB(163, 162, 165), 
    ButtonHoverTransparency = 0.5, 
    ButtonUnderlineColor = Color3.fromRGB(137, 137, 137), 
    Font = Enum.Font.SourceSansBold, 
    TextColor = Color3.fromRGB(255, 255, 255), 
    TextScale = 1, 
    LeaveMenuImage = "rbxasset://textures/loading/cancelButton.png", 
    ScrollRightImage = "rbxasset://textures/ui/AvatarContextMenu_Arrow.png", 
    ScrollLeftImage = "", 
    SelectedCharacterIndicator = l_InsertService_0:LoadLocalAsset("rbxasset://models/AvatarContextMenu/AvatarContextArrow.rbxm"), 
    Size = UDim2.new(0.95, 0, 0.9, 0), 
    MinSize = Vector2.new(200, 200), 
    MaxSize = Vector2.new(300, 300), 
    AspectRatio = 1.15, 
    AnchorPoint = Vector2.new(0.5, 1), 
    OnScreenPosition = UDim2.new(0.5, 0, 0.98, 0), 
    OffScreenPosition = UDim2.new(0.5, 0, 1, 300)
};
local v3 = {};
v3.__index = v3;
v3.UpdateTheme = function(v4, v5)
    local v6 = {};
    for v7, v8 in pairs(v2) do
        if typeof(v5[v7]) == typeof(v8) then
            v6[v7] = v5[v7];
        elseif v5[v7] == nil then
            v6[v7] = v8;
        else
            error(string.format("AvatarContextMenuTheme wrong type for key %s: %s. Expected type %s", v7, typeof(v5[v7]), (typeof(v8))), 2);
        end;
    end;
    v4.Theme = v6;
end;
v3.RegisterCoreMethods = function(v9)
    l_StarterGui_0:RegisterSetCore("AvatarContextMenuTheme", function(v10)
        if type(v10) == "table" then
            for v11 in pairs(v10) do
                if v2[v11] == nil then
                    error(string.format("AvatarContextMenuTheme got invalid key: %s", v11));
                end;
            end;
            v9:UpdateTheme(v10);
            return ;
        else
            error("AvatarContextMenuTheme argument must be a table");
            return ;
        end;
    end);
end;
v3.GetTheme = function(v12)
    return v12.Theme;
end;
v3.new = function()
    local v13 = setmetatable({}, v3);
    v13.Theme = v2;
    v13:RegisterCoreMethods();
    return v13;
end;
return v3.new();
