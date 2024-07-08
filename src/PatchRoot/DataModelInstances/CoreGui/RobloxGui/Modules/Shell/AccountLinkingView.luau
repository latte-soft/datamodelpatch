local l_RobloxGui_0 = game:GetService("CoreGui").RobloxGui;
local l_Shell_0 = l_RobloxGui_0.Modules.Shell;
local l_ContextActionService_0 = game:GetService("ContextActionService");
local v3 = require(l_Shell_0.AccountManager);
local v4 = require(l_Shell_0.AssetManager);
local v5 = require(l_Shell_0.Errors);
local v6 = require(l_Shell_0.ErrorOverlay);
local v7 = require(l_Shell_0.GlobalSettings);
local v8 = require(l_Shell_0.LoadingWidget);
local v9 = require(l_Shell_0.ScreenManager);
local v10 = require(l_Shell_0.SoundManager);
local v11 = require(l_Shell_0.LocalizedStrings);
local v12 = require(l_Shell_0.ThumbnailLoader);
local v13 = require(l_Shell_0.UnlinkAccountOverlay);
local v14 = require(l_Shell_0.Utility);
local v15 = require(l_Shell_0.AppState);
return function()
    local v16 = {};
    local l_gamertag_0 = v15.store:getState().XboxUser.gamertag;
    local l_robloxName_0 = v15.store:getState().RobloxUser.robloxName;
    local l_rbxuid_0 = v15.store:getState().RobloxUser.rbxuid;
    local v20 = string.format(v11:LocalizedString("LinkedAsPhrase"), l_gamertag_0, l_robloxName_0);
    local v21 = v14.Create("Frame")({
        BackgroundTransparency = 1
    });
    local v22 = v14.Create("Frame")({
        Name = "Container", 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(0, 765, 0, 630), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        Selectable = true, 
        SelectionImageObject = v21
    });
    v14.Create("ImageLabel")({
        Name = "GamerPic", 
        Position = UDim2.new(0, 40, 0, 25), 
        Size = UDim2.new(0, 300, 0, 300), 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Image = "rbxapp://xbox/localgamerpic", 
        Parent = v22
    });
    v14.Create("ImageLabel")({
        Name = "AccountLinkIcon", 
        Position = UDim2.new(0, 354, 0, 166), 
        Size = UDim2.new(0, 58, 0, 20), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/AccountLinkIcon.png", 
        Parent = v22
    });
    local v23 = v14.Create("ImageLabel")({
        Name = "ProfileImage", 
        Position = UDim2.new(0, 425, 0, 25), 
        Size = UDim2.new(0, 300, 0, 300), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = v7.CharacterBackgroundColor, 
        BorderSizePixel = 0, 
        Parent = v22
    });
    if l_rbxuid_0 then
        spawn(function()
            local l_Size352x352_0 = v12.AvatarSizes.Size352x352;
            v12:LoadAvatarThumbnailAsync(v23, l_rbxuid_0, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size352x352, true):LoadAsync();
            v23.ImageRectSize = Vector2.new(l_Size352x352_0.X, 1 * l_Size352x352_0.X);
        end);
    end;
    v14.Create("TextLabel")({
        Name = "ProfileLabel", 
        Position = UDim2.new(0, 575, 0, 335), 
        Text = l_robloxName_0 or "", 
        TextXAlignment = "Center", 
        TextYAlignment = "Top", 
        BackgroundColor3 = Color3.new(1, 0, 0), 
        TextColor3 = v7.WhiteTextColor, 
        Font = v7.RegularFont, 
        FontSize = v7.SubHeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v22
    });
    v14.Create("TextLabel")({
        Name = "GamerLabel", 
        Text = l_gamertag_0 or "", 
        TextXAlignment = "Center", 
        TextYAlignment = "Top", 
        Position = UDim2.new(0, 190, 0, 335), 
        BackgroundColor3 = Color3.new(1, 0, 0), 
        TextColor3 = v7.WhiteTextColor, 
        Font = v7.RegularFont, 
        FontSize = v7.SubHeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v22
    });
    v14.Create("TextLabel")({
        Name = "LinkedAsText", 
        Position = UDim2.new(0, 40, 0, 395), 
        Size = UDim2.new(0, 686, 0, 120), 
        Text = v20, 
        TextXAlignment = "Center", 
        TextYAlignment = "Top", 
        BackgroundTransparency = 1, 
        Font = v7.RegularFont, 
        TextColor3 = v7.GreyTextColor, 
        FontSize = v7.SubHeaderSize, 
        TextWrapped = true, 
        Parent = v22
    });
    local v25 = v14.Create("Frame")({
        Name = "UnlinkContainer", 
        Position = UDim2.new(0, 220, 0, 520), 
        Size = UDim2.new(0, 320, 0, 80), 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Parent = v22; 
        v4.CreateShadow(1)
    });
    local v26 = v14.Create("ImageButton")({
        Name = "UnlinkButton", 
        Position = UDim2.new(0, 0, 0, 0), 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = v7.GreySelectedButtonColor, 
        Image = v7.RoundCornerButtonImage, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
        ZIndex = 2, 
        Parent = v25; 
        v10:CreateSound("MoveSelection")
    });
    local l_GreyButtonColor_0 = v7.GreyButtonColor;
    local l_GreySelectedButtonColor_0 = v7.GreySelectedButtonColor;
    local l_WhiteTextColor_0 = v7.WhiteTextColor;
    local l_TextSelectedColor_0 = v7.TextSelectedColor;
    local v31 = v14.Create("TextLabel")({
        Name = "UnlinkText", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Font = v7.RegularFont, 
        FontSize = v7.ButtonSize, 
        TextColor3 = Color3.new(0, 0, 0), 
        Text = v11:LocalizedString("UnlinkGamerTagWord"), 
        ZIndex = 2, 
        Parent = v26
    });
    v14.ResizeButtonWithText(v25, v31, v7.TextHorizontalPadding);
    v22.SelectionGained:connect(function()
        v14.SetSelectedCoreObject(v26);
    end);
    v26.SelectionGained:connect(function()
        v26.ImageColor3 = l_GreySelectedButtonColor_0;
        v31.TextColor3 = l_TextSelectedColor_0;
    end);
    v26.SelectionLost:connect(function()
        v26.ImageColor3 = l_GreyButtonColor_0;
        v31.TextColor3 = l_WhiteTextColor_0;
    end);
    local v32 = v14.Create("Frame")({
        Name = "ModalOverlay", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = v7.ModalBackgroundTransparency, 
        BackgroundColor3 = v7.ModalBackgroundColor, 
        BorderSizePixel = 0, 
        ZIndex = 4
    });
    local v33 = false;
    local function v36()
        if not v33 then
            v33 = true;
            local v34 = nil;
            local v35 = v8({
                Parent = v22
            }, {
                function()
                    v34 = v3:UnlinkAccountAsync();
                end
            });
            v32.Parent = l_RobloxGui_0;
            l_ContextActionService_0:BindCoreAction("BlockB", function()
            end, false, Enum.KeyCode.ButtonB);
            v26.SelectionImageObject = v21;
            v26.ImageColor3 = v7.GreyButtonColor;
            v31.TextColor3 = v7.WhiteTextColor;
            v35:AwaitFinished();
            v35:Cleanup();
            v26.SelectionImageObject = nil;
            v26.ImageColor3 = v7.GreySelectedButtonColor;
            v31.TextColor3 = v7.TextSelectedColor;
            l_ContextActionService_0:UnbindCoreAction("BlockB");
            v32.Parent = nil;
            if v34 ~= v3.AuthResults.Success then
                v9:OpenScreen(v6(not not v34 and v5.Authentication[v34] or v5.Default), false);
            end;
            v33 = false;
            return ;
        else
            return ;
        end;
    end;
    v16.Focus = function(_)
    end;
    v16.RemoveFocus = function(_)
    end;
    v26.MouseButton1Click:connect(function()
        if not v33 then
            v10:Play("ButtonPress");
            v9:OpenScreen(v13({
                Title = v11:LocalizedString("UnlinkTitle"), 
                Msg = v11:LocalizedString("UnlinkPhrase")
            }, v36), false);
            return ;
        else
            return ;
        end;
    end);
    v16.SetParent = function(_, v40)
        v22.Parent = v40;
    end;
    v16.GetUnlinkButton = function(_)
        return v26;
    end;
    return v16;
end;
