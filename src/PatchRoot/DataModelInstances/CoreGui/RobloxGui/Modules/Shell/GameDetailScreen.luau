local l_Modules_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules");
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local l_GuiService_0 = game:GetService("GuiService");
local v3 = nil;
pcall(function()
    v3 = game:GetService("PlatformService");
end);
local l_TextService_0 = game:GetService("TextService");
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_GameData_0 = require(l_Shell_0:FindFirstChild("GameData"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ImageOverlay_0 = require(l_Shell_0:FindFirstChild("ImageOverlay"));
local l_ReportOverlay_0 = require(l_Shell_0:FindFirstChild("ReportOverlay"));
local l_ExperienceGuidelinesOverlay_0 = require(l_Shell_0:FindFirstChild("ExperienceGuidelinesOverlay"));
local l_BadgeSort_0 = require(l_Shell_0:FindFirstChild("BadgeSort"));
local l_ScrollingTextBox_0 = require(l_Shell_0:FindFirstChild("ScrollingTextBox"));
local l_PopupText_0 = require(l_Shell_0:FindFirstChild("PopupText"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_GameJoin_0 = require(l_Shell_0:FindFirstChild("GameJoin"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_VoteView_0 = require(l_Shell_0:FindFirstChild("VoteView"));
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_UserData_0 = require(l_Shell_0:FindFirstChild("UserData"));
local l_MoreButton_0 = require(l_Shell_0:FindFirstChild("Widgets"):FindFirstChild("MoreButton"));
local l_AchievementManager_0 = require(l_Shell_0:FindFirstChild("AchievementManager"));
local v30 = require(l_Modules_0.Shell.BatchThumbnailLoader);
return function(v31)
    local v32 = l_BaseScreen_0();
    local v33 = Vector2.new(228, 72);
    local v34 = Vector2.new(228, 72);
    local l_WhiteTextColor_0 = l_GlobalSettings_0.WhiteTextColor;
    local l_TextSelectedColor_0 = l_GlobalSettings_0.TextSelectedColor;
    local v37 = nil;
    local v38 = nil;
    local v39 = false;
    local v40 = true;
    local v41 = true;
    local v42 = nil;
    local v43 = false;
    local function _()
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        return v42;
    end;
    local _ = l_Utility_0.Create("ImageLabel")({
        Name = "EdgeSelectionImage", 
        Size = UDim2.new(1, 32, 1, 32), 
        Position = UDim2.new(0, -16, 0, -16), 
        Image = "rbxasset://textures/ui/SelectionBox.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(21, 21, 41, 41), 
        BackgroundTransparency = 1
    });
    local v46 = l_Utility_0.Create("ScrollingFrame")({
        Name = "ScrollingFrame", 
        ClipsDescendants = false, 
        Size = UDim2.new(1, 0, 1, 0), 
        CanvasSize = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v32.Container, 
        ScrollingEnabled = false, 
        Selectable = false, 
        BorderSizePixel = 0, 
        ScrollBarThickness = 0
    });
    v32:SetTitle("");
    spawn(function()
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        v32:SetTitle(v42.Name or "");
    end);
    local v75 = (function(v47, v48, v49)
        local v50 = {};
        local v51 = {};
        local v52 = false;
        local v53 = false;
        local v54 = l_Utility_0.Create("Frame")({
            Name = "ContentContainer", 
            Size = v47, 
            Position = v48, 
            BackgroundTransparency = 1, 
            Parent = v49
        });
        local function v58()
            local v55 = 0;
            for v56 = 1, #v51 do
                local v57 = v51[v56];
                v57.Item.Position = UDim2.new(0, v55 + v57.Padding.x, 0, v57.Padding.y);
                v55 = (v55 + v57.Item.Size.X.Offset) + v57.Padding.x;
            end;
        end;
        v50.AddItem = function(_, v60, v61)
            local v62 = {
                Item = v60, 
                Padding = v61 or Vector2.new(0, 0)
            };
            v60.Parent = v54;
            table.insert(v51, v62);
            v58();
        end;
        v50.RemoveItem = function(_, v64)
            for v65 = 1, #v51 do
                local v66 = v51[v65];
                if v66.Item == v64 then
                    v66.Item.Parent = nil;
                    table.remove(v51, v65);
                    v58();
                    return ;
                end;
            end;
        end;
        v50.TweenContentLeft = function(_)
            if not v52 then
                v52 = true;
                v54:TweenPosition(UDim2.new(0, 8, 0, v54.Position.Y.Offset), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true, function(_)
                    v52 = false;
                end);
            end;
        end;
        v50.TweenContentRight = function(_)
            if not v53 then
                v53 = true;
                v54:TweenPosition(UDim2.new(-1, 8, 0, v54.Position.Y.Offset), Enum.EasingDirection.InOut, Enum.EasingStyle.Quad, 0.5, true, function(_)
                    v53 = false;
                end);
            end;
        end;
        v50.TweenContent = function(v71, v72)
            if not (not v72 or not v72:IsDescendantOf(v54)) then
                local l_v72_0 = v72;
                while l_v72_0.Parent ~= v54 do
                    l_v72_0 = l_v72_0.Parent;
                end;
                if v54.AbsoluteSize.x < l_v72_0.Position.X.Offset + l_v72_0.Size.X.Offset then
                    v71:TweenContentRight();
                    return ;
                elseif l_v72_0.Position.X.Offset < v54.AbsoluteSize.x then
                    v71:TweenContentLeft();
                end;
            end;
        end;
        v50.ResetTween = function(_)
            v52 = false;
            v53 = false;
        end;
        return v50;
    end)(UDim2.new(1, 0, 0, 622), UDim2.new(0, 8, 0, 210), v46);
    local v76 = l_Utility_0.Create("Frame")({
        Name = "PlayButtonContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v33.X, 0, v33.Y), 
        Position = UDim2.new(0, 0, 1, -77), 
        Parent = v46; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v77 = l_Utility_0.Create("ImageButton")({
        Name = "PlayButton", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GlobalSettings_0.GreenButtonColor, 
        Image = l_GlobalSettings_0.RoundCornerButtonImage, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
        Parent = v76, 
        ZIndex = 2; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v78 = l_Utility_0.Create("TextLabel")({
        Name = "PlayText", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("PlayWord"), 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_WhiteTextColor_0, 
        ZIndex = 2, 
        Parent = v77
    });
    l_Utility_0.ResizeButtonWithText(v76, v78, l_GlobalSettings_0.TextHorizontalPadding);
    local v79 = l_Utility_0.Create("Frame")({
        Name = "FavoriteButtonContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, v34.X, 0, v34.Y), 
        Position = UDim2.new(0, v76.Size.X.Offset + 10, 1, -77), 
        Parent = v46; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v80 = l_Utility_0.Create("ImageButton")({
        Name = "FavoriteButton", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GlobalSettings_0.GreyButtonColor, 
        ScaleType = Enum.ScaleType.Slice, 
        Parent = v79, 
        Image = l_GlobalSettings_0.RoundCornerButtonImage, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
        ZIndex = 2; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    v80.NextSelectionLeft = v77;
    v80.NextSelectionDown = v80;
    v80.NextSelectionUp = v80;
    v80.NextSelectionRight = v80;
    local v81 = l_Utility_0.Create("TextLabel")({
        Name = "FavoriteText", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("FavoriteWord"), 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_WhiteTextColor_0, 
        ZIndex = 2, 
        Parent = v80
    });
    local v82 = l_Utility_0.Create("ImageLabel")({
        Name = "FavoriteStarImage", 
        BackgroundTransparency = 1, 
        Visible = false, 
        ZIndex = 2, 
        Parent = v80, 
        Image = "rbxasset://textures/ui/Shell/Icons/FavoriteStar@1080.png", 
        Size = UDim2.new(0, 32, 0, 31)
    });
    v82.Position = UDim2.new(0, 16, 0.5, -v82.Size.Y.Offset / 2);
    l_Utility_0.ResizeButtonWithDynamicText(v79, v81, {
        l_LocalizedStrings_0:LocalizedString("FavoritedWord")
    }, l_GlobalSettings_0.TextHorizontalPadding + ((v82.Position.X.Offset + v82.Size.X.Offset) + 12) / 2);
    local v83 = l_Utility_0.Create("Frame")({
        Name = "FavoriteRedirectFrame", 
        Size = UDim2.new(1, 0, 0, v79.Size.Y.Offset), 
        Position = UDim2.new(0, v79.Position.X.Offset + v79.Size.X.Offset, 1, v79.Position.Y.Offset), 
        BackgroundTransparency = 1, 
        Selectable = true, 
        Parent = v46
    });
    local v84 = l_Utility_0.Create("Frame")({
        Name = "GameIconContainer", 
        Size = UDim2.new(0, 566, 1, 0), 
        BackgroundTransparency = 1
    });
    v75:AddItem(v84, Vector2.new(0, 0));
    local v85 = l_Utility_0.Create("ImageLabel")({
        Name = "GameIconImage", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = Color3.new(), 
        ZIndex = 2, 
        Parent = l_Utility_0.Create("Frame")({
            Name = "GameIconCorrectAspectContainer", 
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 566), 
            Position = UDim2.new(0, 0, 0.5, 0), 
            AnchorPoint = Vector2.new(0, 0.5), 
            Parent = v84; 
            l_AssetManager_0.CreateShadow(1)
        })
    });
    local function v88(v86)
        if not v86.ImageToken then
            local v87 = l_ThumbnailLoader_0:Create(v85, v86.UniverseId, l_ThumbnailLoader_0.GameIconSizes.Medium, l_ThumbnailLoader_0.AssetType.SquareIcon);
            spawn(function()
                v87:LoadAsync(true, true, {
                    ZIndex = v85.ZIndex
                });
            end);
            return ;
        else
            v30:CreateThumbnail(v85, v86.ImageToken, v30.Sizes.Medium, true, true, {
                ZIndex = v85.ZIndex
            });
            return ;
        end;
    end;
    spawn(function()
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        v88(v42);
        l_GameData_0:AddRelatedGuiObject(v31, v85);
    end);
    local v89 = l_Utility_0.Create("Frame")({
        Name = "RatingDescriptionContainer", 
        Size = UDim2.new(0, 394, 1, 0), 
        BackgroundTransparency = 1
    });
    v75:AddItem(v89, Vector2.new(38, 0));
    local v90 = l_Utility_0.Create("TextLabel")({
        Name = "RatingDescriptionTitle", 
        Size = UDim2.new(0, 0, 0, 33), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("RatingDescriptionTitle"), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Parent = v89
    });
    local v91 = l_VoteView_0();
    v91:SetPosition(UDim2.new(0, 0, 0, v90.Size.Y.Offset));
    local l_Container_0 = v91.Container;
    local v93 = l_Utility_0.Create("Frame")({
        Name = "RatingDescriptionLineBreak", 
        Size = UDim2.new(0, 362, 0, 2), 
        Position = UDim2.new(0, 0, 0, l_Container_0.Position.Y.Offset + l_Container_0.Size.Y.Offset), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.LineBreakColor, 
        Parent = v89
    });
    local v94 = l_Utility_0.Create("Frame")({
        Name = "DescriptionContainer", 
        Size = UDim2.new(1, 0, 0, 430), 
        Position = UDim2.new(0, 0, 0, (v93.Position.Y.Offset + v93.Size.Y.Offset) + 20), 
        BackgroundTransparency = 1, 
        Parent = v89
    });
    local v95 = l_Utility_0.Create("UIListLayout")({
        SortOrder = Enum.SortOrder.LayoutOrder, 
        FillDirection = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        HorizontalAlignment = Enum.HorizontalAlignment.Center, 
        Padding = UDim.new(0, 10), 
        Parent = v94
    });
    local v96 = l_ScrollingTextBox_0(UDim2.new(1, 0, 1, 0), UDim2.new(0, 0, 0, 0), v94);
    v96:SetLayoutOrder(0);
    local v97 = l_Utility_0.Create("TextButton")({
        Name = "ExperienceGuidelinesContainer", 
        Size = UDim2.new(1, 0, 0, 200), 
        Visible = true, 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.new(0.09803921568627451, 0.10588235294117647, 0.11372549019607843), 
        Text = "", 
        LayoutOrder = 2, 
        Selectable = true, 
        Parent = v94
    });
    local v98 = l_Utility_0.Create("UIPadding")({
        Name = "ExperienceGuidelinesPadding", 
        PaddingTop = UDim.new(0, 17), 
        PaddingBottom = UDim.new(0, 17), 
        PaddingLeft = UDim.new(0, 17), 
        PaddingRight = UDim.new(0, 17), 
        Parent = v97
    });
    local v99 = l_Utility_0.Create("UIListLayout")({
        Name = "ExperienceGuidelinesLayout", 
        FillDirection = Enum.FillDirection.Horizontal, 
        Padding = UDim.new(0, 16), 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Center, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v97
    });
    local v100 = l_Utility_0.Create("TextLabel")({
        Name = "ExperienceGuidelinesName", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 0), 
        AnchorPoint = Vector2.new(0, 0.5), 
        Font = l_GlobalSettings_0.BoldFont, 
        FontSize = l_GlobalSettings_0.SmallTitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextTransparency = 0, 
        Text = "", 
        TextWrapped = true, 
        Parent = v97, 
        LayoutOrder = 0
    });
    local v101 = l_Utility_0.Create("TextLabel")({
        Name = "ExperienceGuidelinesDescriptors", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 0, 0, 0), 
        AnchorPoint = Vector2.new(0, 0.5), 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SmallTitleSize, 
        TextColor3 = l_GlobalSettings_0.LightGreyTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = "", 
        TextWrapped = true, 
        Parent = v97, 
        LayoutOrder = 1
    });
    local function v104()
        local l_v91_DefaultSelection_0 = v91:GetDefaultSelection();
        if l_v91_DefaultSelection_0 then
            l_v91_DefaultSelection_0.NextSelectionLeft = v80;
            if not v96:IsSelectable() then
                l_v91_DefaultSelection_0.NextSelectionDown = v97;
                v97.NextSelectionLeft = v80;
                v80.NextSelectionRight = l_v91_DefaultSelection_0;
                v80.NextSelectionUp = l_v91_DefaultSelection_0;
            else
                local l_v96_SelectableObject_0 = v96:GetSelectableObject();
                l_v96_SelectableObject_0.NextSelectionUp = l_v91_DefaultSelection_0;
                l_v91_DefaultSelection_0.NextSelectionDown = l_v96_SelectableObject_0;
                v80.NextSelectionRight = l_v96_SelectableObject_0;
                v80.NextSelectionUp = l_v96_SelectableObject_0;
                l_v96_SelectableObject_0.NextSelectionLeft = v80;
                l_v96_SelectableObject_0.NextSelectionDown = v97;
                v97.NextSelectionLeft = v80;
                return ;
            end;
        end;
    end;
    local v105 = l_Utility_0.Create("Frame")({
        Name = "LineBreak", 
        Size = UDim2.new(0, 2, 0, 566), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.new(0.3058823529411765, 0.3058823529411765, 0.3058823529411765), 
        BorderSizePixel = 0
    });
    v75:AddItem(v105, Vector2.new(32, 33));
    local v106 = l_Utility_0.Create("Frame")({
        Name = "ThumbsContainer", 
        Size = UDim2.new(0, 630, 1, 0), 
        BackgroundTransparency = 1
    });
    v75:AddItem(v106, Vector2.new(52, 0));
    local v107 = v90:Clone();
    v107.Name = "ThumbsTitle";
    v107.Text = l_LocalizedStrings_0:LocalizedString("GameImagesTitle");
    v107.Parent = v106;
    local v108 = l_Utility_0.Create("Frame")({
        Name = "ThumbsContent", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v106
    });
    local v109 = l_Utility_0.Create("Frame")({
        Name = "MainThumbContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, 0, 0, 374), 
        Position = UDim2.new(0, 0, 0, v107.Size.Y.Offset), 
        Parent = v108; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v110 = l_Utility_0.Create("ImageButton")({
        Name = "MainThumbImage", 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = Color3.new(), 
        Size = UDim2.new(1, 0, 1, 0), 
        ZIndex = 2, 
        Parent = v109; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v111 = l_Utility_0.Create("Frame")({
        Name = "SmThumbLeftContainer", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 310, 0, 184), 
        Position = UDim2.new(0, 0, 0, (v109.Position.Y.Offset + v109.Size.Y.Offset) + 8), 
        Parent = v108; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v112 = l_Utility_0.Create("ImageButton")({
        Name = "SmThumbLeft", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 0, 
        BackgroundColor3 = Color3.new(), 
        BorderSizePixel = 0, 
        ZIndex = 2, 
        Parent = v111; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v113 = v111:Clone();
    local l_SmThumbLeft_0 = v113.SmThumbLeft;
    v113.Name = "SmThumbLeftContainer";
    l_SmThumbLeft_0.Name = "SmThumbRight";
    v113.Position = UDim2.new(0, v111.Size.X.Offset + 10, 0, v111.Position.Y.Offset);
    v113.Parent = v108;
    local v115 = l_MoreButton_0();
    v115.Size = UDim2.new(0, 108, 0, 50);
    v115.Image = "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png";
    v115.Position = UDim2.new(1, -v115.Size.X.Offset + 3, 0, (v113.Position.Y.Offset + v113.Size.Y.Offset) + 12);
    v115.Visible = false;
    v115.ZIndex = 2;
    v115.SelectionImageObject = nil;
    v115.Parent = v108;
    local v116 = l_Utility_0.Create("Frame")({
        Name = "BadgeContainer", 
        Size = UDim2.new(0, 568, 1, 0), 
        BackgroundTransparency = 1
    });
    v75:AddItem(v116, Vector2.new(52, 0));
    local v117 = v90:Clone();
    v117.Name = "BadgeTitle";
    v117.Text = l_LocalizedStrings_0:LocalizedString("GameBadgesTitle");
    v117.Parent = v116;
    local v118 = l_Utility_0.Create("Frame")({
        Name = "RelatedGamesContainer", 
        Size = v116.Size, 
        BackgroundTransparency = 1
    });
    local v119 = not l_AchievementManager_0:AllGamesUnlocked();
    if not v119 then
        v75:AddItem(v118, Vector2.new(52, 0));
    end;
    local v120 = v117:Clone();
    v120.Name = "RelatedGamesTitle";
    v120.Text = l_LocalizedStrings_0:LocalizedString("RelatedGamesTitle");
    v120.Parent = v118;
    local v121 = l_Utility_0.Create("Frame")({
        Name = "RelatedGamesImageFrame", 
        Size = UDim2.new(1, 0, 566, 0), 
        Position = UDim2.new(0, 0, 0, v120.Size.Y.Offset), 
        BackgroundTransparency = 1, 
        Parent = v118
    });
    local v122 = {};
    local v123 = 1;
    for v124 = 1, 2 do
        for v125 = 1, 2 do
            local v126 = l_Utility_0.Create("Frame")({
                Name = tostring(v123), 
                BackgroundTransparency = 1, 
                Size = UDim2.new(0, 276, 0, 276), 
                Position = UDim2.new(0, (v124 - 1) * 276 + (v124 - 1) * 14, 0, (v125 - 1) * 276 + (v125 - 1) * 14), 
                Parent = v121; 
                l_AssetManager_0.CreateShadow(1)
            });
            l_Utility_0.Create("ImageButton")({
                Name = "Image", 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundTransparency = 0, 
                BackgroundColor3 = l_GlobalSettings_0.GreyButtonColor, 
                BorderSizePixel = 0, 
                ZIndex = 2, 
                Parent = v126; 
                l_SoundManager_0:CreateSound("MoveSelection")
            });
            v122[v123] = v126;
            v123 = v123 + 1;
        end;
    end;
    local v127 = v105:Clone();
    v127.Name = "RelatedGamesMoreDetailsLineBreak";
    v75:AddItem(v127, Vector2.new(52, v127.Position.Y.Offset));
    local v128 = l_Utility_0.Create("Frame")({
        Name = "MoreDetailsContainer", 
        Size = UDim2.new(0, 386, 1, 0), 
        BackgroundTransparency = 1, 
        Selectable = true
    });
    v75:AddItem(v128, Vector2.new(52, 0));
    local v129 = v120:Clone();
    v129.Name = "MoreDetailsTitle";
    v129.Text = l_LocalizedStrings_0:LocalizedString("MoreDetailsTitle");
    v129.Parent = v128;
    local v130 = l_Utility_0.Create("Frame")({
        Name = "MoreDetailsContent", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v128
    });
    local v131 = l_Utility_0.Create("TextLabel")({
        Name = "UpdatedText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 0, 0, v129.Size.Y.Offset + 48), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("LastUpdatedWord"), 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SmallTitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Parent = v130
    });
    local v132 = l_Utility_0.Create("TextLabel")({
        Name = "LastUpdatedText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 0, 0, v131.Position.Y.Offset + 34), 
        BackgroundTransparency = 1, 
        Text = "", 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Parent = v130
    });
    local v133 = v131:Clone();
    v133.Name = "CreationText";
    v133.Position = UDim2.new(0, 0, 0, v132.Position.Y.Offset + 70);
    v133.Text = l_LocalizedStrings_0:LocalizedString("CreationDateWord");
    v133.Parent = v130;
    local v134 = v132:Clone();
    v134.Name = "CreationDateText";
    v134.Position = UDim2.new(0, 0, 0, v133.Position.Y.Offset + 34);
    v134.Parent = v130;
    local v135 = v131:Clone();
    v135.Name = "MaxPlayersText";
    v135.Position = UDim2.new(0, 0, 0, v134.Position.Y.Offset + 70);
    v135.Text = l_LocalizedStrings_0:LocalizedString("MaxPlayersWord");
    v135.Parent = v130;
    local v136 = v132:Clone();
    v136.Name = "MaxPlayersCountText";
    v136.Position = UDim2.new(0, 0, 0, v135.Position.Y.Offset + 34);
    v136.Parent = v130;
    local v137 = v131:Clone();
    v137.Name = "CreatorText";
    v137.Position = UDim2.new(0, 0, 0, v136.Position.Y.Offset + 70);
    v137.Text = l_LocalizedStrings_0:LocalizedString("CreatedByWord");
    v137.Parent = v130;
    local v138 = l_Utility_0.Create("ImageLabel")({
        Name = "CreatorIcon", 
        Size = UDim2.new(0, 32, 0, 32), 
        Position = UDim2.new(0, 0, 0, (v137.Position.Y.Offset + 34) - 14), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/RobloxIcon32.png", 
        Parent = v130
    });
    local v139 = v132:Clone();
    v139.Name = "CreatorNameText";
    v139.Position = UDim2.new(0, v138.Size.X.Offset + 8, 0, v137.Position.Y.Offset + 34);
    v139.Parent = v130;
    local v140 = l_Utility_0.Create("TextButton")({
        Name = "ReportFrame", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_GlobalSettings_0.GreyButtonColor, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        Text = "", 
        Parent = l_Utility_0.Create("Frame")({
            Name = tostring(v123), 
            BackgroundTransparency = 1, 
            Size = UDim2.new(0, 91, 0, 91), 
            Position = UDim2.new(0, 0, 0, l_Utility_0.Create("Frame")({
                Name = "DetailsBottomLineBreak", 
                Size = UDim2.new(0, 308, 0, 2), 
                Position = UDim2.new(0, 107, 0, (v129.Size.Y.Offset + 566) - 2), 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_GlobalSettings_0.LineBreakColor, 
                Parent = v128
            }).Position.Y.Offset - 95), 
            Parent = v128; 
            l_AssetManager_0.CreateShadow(1)
        }), 
        ZIndex = 2; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v141 = l_Utility_0.Create("ImageLabel")({
        Name = "ReportIcon", 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Parent = v140, 
        Image = "rbxasset://textures/ui/Shell/Icons/ReportIcon@1080.png", 
        Size = UDim2.new(0, 52, 0, 43)
    });
    v141.Position = UDim2.new(0.5, -v141.Size.X.Offset / 2, 0.5, -v141.Size.Y.Offset / 2);
    local _ = l_Utility_0.Create("TextLabel")({
        Name = "ReportText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(1, 16, 0.5, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.TitleSize, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Text = l_LocalizedStrings_0:LocalizedString("ReportGameWord"), 
        Parent = v140
    });
    v140.MouseButton1Click:connect(function()
        local v143 = l_UserData_0.GetLocalUserIdAsync();
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        local l_v42_0 = v42;
        if l_v42_0 then
            l_ScreenManager_0:OpenScreen(l_ReportOverlay_0:CreateReportOverlay(l_ReportOverlay_0.ReportType.REPORT_GAME, v31, l_v42_0.CreatorUserId, l_v42_0.Name, l_v42_0.Description, v143), false);
            return ;
        else
            l_Utility_0.DebugLog("ReportFrame.MouseButton1Click:connect() could not fetch data.");
            return ;
        end;
    end);
    v77.NextSelectionRight = v80;
    v112.NextSelectionDown = v115;
    v112.NextSelectionRight = l_SmThumbLeft_0;
    local function _()
        if not (not v40 or not v41) then
            v40 = false;
            while v43 do
                wait();
            end;
            v43 = true;
            if not v42 then
                v42 = l_GameData_0:GetGameData(v31, true);
                v42:GetGameDetailsAsync();
            end;
            v43 = false;
            local l_v42_1 = v42;
            local v146 = nil;
            if l_v42_1 then
                v146 = l_v42_1.CreatorUserId;
            end;
            l_GameJoin_0:StartGame(l_GameJoin_0.JoinType.Normal, v31, v146, "GameDetails");
            v40 = true;
        end;
    end;
    local function v149(v148)
        if v148 == true then
            v82.Visible = true;
            v81.Position = UDim2.new(0, (v82.Position.X.Offset + v82.Size.X.Offset) + 12, 0, 0);
            v81.Text = l_LocalizedStrings_0:LocalizedString("FavoritedWord");
            v81.TextXAlignment = Enum.TextXAlignment.Left;
            return ;
        else
            if v148 == false then
                v82.Visible = false;
                v81.Position = UDim2.new(0, 0, 0, 0);
                v81.Text = l_LocalizedStrings_0:LocalizedString("FavoriteWord");
                v81.TextXAlignment = Enum.TextXAlignment.Center;
            end;
            return ;
        end;
    end;
    v77.SelectionGained:connect(function()
        v77.ImageColor3 = l_GlobalSettings_0.GreenSelectedButtonColor;
        v78.TextColor3 = l_TextSelectedColor_0;
    end);
    v77.SelectionLost:connect(function()
        v77.ImageColor3 = l_GlobalSettings_0.GreenButtonColor;
        v78.TextColor3 = l_WhiteTextColor_0;
    end);
    v80.SelectionGained:connect(function()
        v80.ImageColor3 = l_GlobalSettings_0.GreySelectedButtonColor;
        v81.TextColor3 = l_TextSelectedColor_0;
    end);
    v80.SelectionLost:connect(function()
        v80.ImageColor3 = l_GlobalSettings_0.GreyButtonColor;
        v81.TextColor3 = l_WhiteTextColor_0;
    end);
    v128.SelectionGained:connect(function()
        l_Utility_0.SetSelectedCoreObject(v140);
    end);
    v83.SelectionGained:connect(function()
        l_Utility_0.SetSelectedCoreObject(v80);
    end);
    v77.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        if not v39 then
            v39 = true;
            if not (not v40 or not v41) then
                v40 = false;
                while v43 do
                    wait();
                end;
                v43 = true;
                if not v42 then
                    v42 = l_GameData_0:GetGameData(v31, true);
                    v42:GetGameDetailsAsync();
                end;
                v43 = false;
                local l_v42_2 = v42;
                local v151 = nil;
                if l_v42_2 then
                    v151 = l_v42_2.CreatorUserId;
                end;
                l_GameJoin_0:StartGame(l_GameJoin_0.JoinType.Normal, v31, v151, "GameDetails");
                v40 = true;
            end;
            v39 = false;
            return ;
        else
            return ;
        end;
    end);
    local v152 = false;
    v80.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        if not v152 then
            v152 = true;
            while v43 do
                wait();
            end;
            v43 = true;
            if not v42 then
                v42 = l_GameData_0:GetGameData(v31, true);
                v42:GetGameDetailsAsync();
            end;
            v43 = false;
            local l_v42_3 = v42;
            if l_v42_3 then
                local v154, v155 = l_v42_3:PostFavoriteAsync();
                if v154 == true then
                    v149(l_v42_3.IsFavorited);
                elseif v155 then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Favorite[v155]), false);
                end;
            end;
            v152 = false;
            return ;
        else
            return ;
        end;
    end);
    local function v160(v156, v157, v158)
        local v159 = l_ThumbnailLoader_0:Create(v156, v158[v157], l_ThumbnailLoader_0.Sizes.Large, l_ThumbnailLoader_0.AssetType.Icon, false);
        v156.MouseButton1Click:connect(function()
            l_SoundManager_0:Play("OverlayOpen");
            l_ScreenManager_0:OpenScreen(l_ImageOverlay_0(v158, v157), false);
        end);
        spawn(function()
            v159:LoadAsync(true, true, {
                ZIndex = v156.ZIndex
            });
        end);
    end;
    local function v162(v161)
        if #v161 >= 3 then
            v160(v110, 1, v161);
            v160(v112, 2, v161);
            v160(l_SmThumbLeft_0, 3, v161);
            if #v161 > 3 then
                v115.Visible = true;
                v115.MouseButton1Click:connect(function()
                    l_SoundManager_0:Play("OverlayOpen");
                    l_ScreenManager_0:OpenScreen(l_ImageOverlay_0(v161, 1), false);
                end);
                return ;
            end;
        else
            v75:RemoveItem(v106);
        end;
    end;
    local function v168(v163)
        if #v163 > 0 then
            for v164 = 1, #v122 do
                local l_Image_0 = v122[v164].Image;
                if v163[v164] then
                    local l_l_GameData_0_GameData_0 = l_GameData_0:GetGameData(v163[v164]);
                    if not v32.ImageToken then
                        local v167 = l_ThumbnailLoader_0:Create(l_Image_0, l_l_GameData_0_GameData_0.UniverseId, l_ThumbnailLoader_0.GameIconSizes.Medium, l_ThumbnailLoader_0.AssetType.SquareIcon);
                        spawn(function()
                            v167:LoadAsync(true, true, {
                                ZIndex = l_Image_0.ZIndex
                            });
                        end);
                    else
                        v30:CreateThumbnail(l_Image_0, v32.ImageToken, v30.Sizes.Medium, true, true, {
                            ZIndex = l_Image_0.ZIndex
                        });
                    end;
                    l_Image_0.MouseButton1Click:connect(function()
                        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameDetail, l_l_GameData_0_GameData_0.PlaceId, l_l_GameData_0_GameData_0.Name, l_l_GameData_0_GameData_0.IconId);
                    end);
                    l_PopupText_0(l_Image_0, l_l_GameData_0_GameData_0.Name);
                    l_GameData_0:AddRelatedGuiObject(v31, l_Image_0);
                end;
            end;
            return ;
        else
            v75:RemoveItem(v118);
            return ;
        end;
    end;
    local function v169()
        v96:SetSize(UDim2.new(1, 0, 0, (math.min(v96:GetTextSize().y, (v94.AbsoluteSize.y - v97.Size.Y.Offset) - v95.Padding.Offset))));
    end;
    local function v175(v170, v171, v172)
        if v172 then
            if v172 == 0 then
                v100.Text = v170;
                if #v171 > 0 then
                    v101.Text = table.concat(v171, ", ");
                else
                    v101.Text = l_LocalizedStrings_0:LocalizedString("SuitableForAllPhrase");
                end;
            elseif v172 > 0 then
                v100.Text = v170;
                v101.Text = table.concat(v171, ", ");
            end;
        else
            v100.Text = l_LocalizedStrings_0:LocalizedString("AgeGuidelinesPhrase");
            v101.Text = l_LocalizedStrings_0:LocalizedString("NotAvailableWord");
        end;
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v100.Text, l_Utility_0.ConvertFontSizeEnumToInt(v100.FontSize), v100.Font, Vector2.new(0, 0));
        v100.Size = UDim2.new(0, l_l_TextService_0_TextSize_0.X, 0, l_l_TextService_0_TextSize_0.Y);
        local l_l_TextService_0_TextSize_1 = l_TextService_0:GetTextSize(v101.Text, l_Utility_0.ConvertFontSizeEnumToInt(v101.FontSize), v101.Font, Vector2.new(((v97.AbsoluteSize.x - 2 * v98.PaddingTop.Offset) - v99.Padding.Offset) - l_l_TextService_0_TextSize_0.X, 1000));
        v101.Size = UDim2.new(0, l_l_TextService_0_TextSize_1.X, 0, l_l_TextService_0_TextSize_1.Y);
        v97.Size = UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_1.Y + 2 * v98.PaddingTop.Offset);
        v97.MouseButton1Click:connect(function()
            l_ScreenManager_0:OpenScreen(l_ExperienceGuidelinesOverlay_0(v170, v171, v172), false);
        end);
    end;
    local v176 = nil;
    local function v177()
        while not (((not v32 or not v32.TransitionTweens) or not v32.TransitionTweens[1]) or v32.TransitionTweens[1]:IsFinished()) do
            wait();
        end;
    end;
    local _ = function(v178, v179)
        for _, v181 in pairs(v179) do
            table.insert(v178, v181);
        end;
    end;
    local function v187(v183, v184)
        local v185 = {
            Container = v183
        };
        v185.SelectionHolder = l_Utility_0.Create("Frame")({
            Name = "SelectionHolder", 
            Size = UDim2.new(1, 0, 1, -v184.Size.Y.Offset), 
            Position = UDim2.new(0, 0, 0, v184.Size.Y.Offset), 
            BackgroundTransparency = 1, 
            Parent = v185.Container, 
            Selectable = true
        });
        v185.DefaultSelection = v185.SelectionHolder;
        v185.Container.SelectionGained:connect(function()
            l_Utility_0.SetSelectedCoreObject(v185.DefaultSelection);
        end);
        v185.PostLoaded = function(v186)
            v186.SelectionHolder.Selectable = false;
            if not (not (l_GuiService_0.SelectedCoreObject == v186.SelectionHolder) or not v186.DefaultSelection) then
                l_Utility_0.SetSelectedCoreObject(v186.DefaultSelection);
            end;
            v186.SelectionHolder:Destroy();
        end;
        return v185;
    end;
    local v188 = {};
    table.insert(v188, (v187(v89, v90)));
    table.insert(v188, (v187(v106, v107)));
    table.insert(v188, (v187(v116, v117)));
    if not v119 then
        table.insert(v188, (v187(v118, v120)));
    end;
    local function _(v189)
        local l_v80_0 = v80;
        v189 = v189 - 1;
        while true do
            if not (v189 > 0) or not v188[v189] then
                return l_v80_0;
            elseif not v188[v189].DefaultSelection then
                v189 = v189 - 1;
            else
                return v188[v189].DefaultSelection;
            end;
        end;
    end;
    local function v194(v192)
        local l_v140_0 = v140;
        v192 = v192 + 1;
        while true do
            if not (v192 > 0) or not v188[v192] then
                return l_v140_0;
            elseif not v188[v192].DefaultSelection then
                v192 = v192 + 1;
            else
                return v188[v192].DefaultSelection;
            end;
        end;
    end;
    v93.Visible = false;
    v94.Visible = false;
    local function v196()
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        local l_v42_4 = v42;
        if l_v42_4 then
            v149(l_v42_4.IsFavorited);
            return ;
        else
            l_Utility_0.DebugLog("GameDetail:loadFavoritedDataAsync() could not fetch data.");
            return ;
        end;
    end;
    local function v198()
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        local l_v42_5 = v42;
        if l_v42_5 then
            v96:SetText(l_v42_5.Description);
            v175(l_v42_5.ageDisplayName, l_v42_5.descriptorDisplayNames, l_v42_5.minimumAge);
            v169();
            return ;
        else
            l_Utility_0.DebugLog("GameDetail:loadDescriptionAndGuidelinesDataAsync() could not fetch data.");
            return ;
        end;
    end;
    local function v200()
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        local l_v42_6 = v42;
        if l_v42_6 then
            v91:InitializeAsync(l_v42_6);
            return ;
        else
            l_Utility_0.DebugLog("GameDetail:loadVoteDataAsync() could not fetch data.");
            return ;
        end;
    end;
    v80.NextSelectionRight = v188[1].SelectionHolder;
    v80.NextSelectionUp = v188[1].SelectionHolder;
    v188[1].SelectionHolder.NextSelectionLeft = v80;
    v188[1].SelectionHolder.NextSelectionDown = v80;
    local v201 = l_LoadingWidget_0({
        Parent = v188[1].SelectionHolder
    }, {
        v196, 
        v198, 
        v200, 
        v177
    });
    do
        local l_v201_0 = v201;
        spawn(function()
            l_v201_0:AwaitFinished();
            l_v201_0:Cleanup();
            l_v201_0 = nil;
            v93.Visible = true;
            v94.Visible = true;
            v91:SetParent(v89);
            v91:SetVisible(true);
            local l_v91_DefaultSelection_1 = v91:GetDefaultSelection();
            if l_v91_DefaultSelection_1 then
                l_v91_DefaultSelection_1.NextSelectionLeft = v80;
                if not v96:IsSelectable() then
                    l_v91_DefaultSelection_1.NextSelectionDown = v97;
                    v97.NextSelectionLeft = v80;
                    v80.NextSelectionRight = l_v91_DefaultSelection_1;
                    v80.NextSelectionUp = l_v91_DefaultSelection_1;
                else
                    local l_v96_SelectableObject_1 = v96:GetSelectableObject();
                    l_v96_SelectableObject_1.NextSelectionUp = l_v91_DefaultSelection_1;
                    l_v91_DefaultSelection_1.NextSelectionDown = l_v96_SelectableObject_1;
                    v80.NextSelectionRight = l_v96_SelectableObject_1;
                    v80.NextSelectionUp = l_v96_SelectableObject_1;
                    l_v96_SelectableObject_1.NextSelectionLeft = v80;
                    l_v96_SelectableObject_1.NextSelectionDown = v97;
                    v97.NextSelectionLeft = v80;
                end;
            end;
            v188[1].DefaultSelection = v91:GetDefaultSelection() or v194(1);
            v188[1]:PostLoaded();
            if v32 then
                v32.TransitionTweens = v32.TransitionTweens or {};
                l_v91_DefaultSelection_1 = v32.TransitionTweens;
                for _, v206 in pairs((l_ScreenManager_0:FadeInSitu(v93))) do
                    table.insert(l_v91_DefaultSelection_1, v206);
                end;
                l_v91_DefaultSelection_1 = v32.TransitionTweens;
                for _, v208 in pairs((l_ScreenManager_0:FadeInSitu(v94))) do
                    table.insert(l_v91_DefaultSelection_1, v208);
                end;
                v75:TweenContent(l_GuiService_0.SelectedCoreObject);
            end;
        end);
    end;
    v196 = {};
    do
        local l_v196_0, l_v200_0 = v196, v200;
        v198 = function()
            while v43 do
                wait();
            end;
            v43 = true;
            if not v42 then
                v42 = l_GameData_0:GetGameData(v31, true);
                v42:GetGameDetailsAsync();
            end;
            v43 = false;
            local l_v42_7 = v42;
            if l_v42_7 then
                l_v196_0 = l_v42_7:GetThumbnailIdsAsync();
                return ;
            else
                l_Utility_0.DebugLog("GameDetail:loadThumbsAsync() could not fetch data.");
                return ;
            end;
        end;
        v108.Visible = false;
        l_v200_0 = l_LoadingWidget_0({
            Parent = v188[2].SelectionHolder
        }, {
            v198, 
            v177
        });
        spawn(function()
            l_v200_0:AwaitFinished();
            l_v200_0:Cleanup();
            l_v200_0 = nil;
            v108.Visible = true;
            local v212 = #l_v196_0 >= 3;
            v162(l_v196_0);
            v188[2].DefaultSelection = not not v212 and v110 or v194(2);
            v188[2]:PostLoaded();
            if v32 then
                v32.TransitionTweens = v32.TransitionTweens or {};
                local l_TransitionTweens_0 = v32.TransitionTweens;
                for _, v215 in pairs((l_ScreenManager_0:FadeInSitu(v108))) do
                    table.insert(l_TransitionTweens_0, v215);
                end;
                v75:TweenContent(l_GuiService_0.SelectedCoreObject);
            end;
        end);
    end;
    v196 = {};
    v198 = "";
    do
        local l_v196_1, l_v198_0, l_v201_1 = v196, v198, v201;
        l_v201_1 = l_LoadingWidget_0({
            Parent = v188[3].SelectionHolder
        }, {
            function()
                while v43 do
                    wait();
                end;
                v43 = true;
                if not v42 then
                    v42 = l_GameData_0:GetGameData(v31, true);
                    v42:GetGameDetailsAsync();
                end;
                v43 = false;
                local l_v42_8 = v42;
                if l_v42_8 then
                    l_v196_1 = l_v42_8:GetBadgeDataAsync();
                    l_v198_0 = l_v42_8.Name or "";
                    return ;
                else
                    l_Utility_0.DebugLog("GameDetail:loadBadgeDataAsync() could not fetch data.");
                    return ;
                end;
            end, 
            v177
        });
        spawn(function()
            l_v201_1:AwaitFinished();
            l_v201_1:Cleanup();
            l_v201_1 = nil;
            local v220 = #l_v196_1 >= 4;
            local v221 = nil;
            if not v220 then
                v75:RemoveItem(v116);
                v188[3].DefaultSelection = v194(3);
            else
                v221 = l_BadgeSort_0(l_v198_0, UDim2.new(1, 0, 0, 566), UDim2.new(0, 0, 0, v117.Size.Y.Offset), v116);
                v221:Initialize(l_v196_1);
                v188[3].DefaultSelection = v221:GetDefaultSelection();
            end;
            v188[3]:PostLoaded();
            if v32 then
                v32.TransitionTweens = v32.TransitionTweens or {};
                if v221 then
                    local l_TransitionTweens_1 = v32.TransitionTweens;
                    for _, v224 in pairs((l_ScreenManager_0:FadeInSitu(v221:GetContainer()))) do
                        table.insert(l_TransitionTweens_1, v224);
                    end;
                end;
                v75:TweenContent(l_GuiService_0.SelectedCoreObject);
            end;
        end);
    end;
    if not v119 then
        v196 = {};
        do
            local l_v196_2, l_v200_1 = v196, v200;
            v198 = function()
                while v43 do
                    wait();
                end;
                v43 = true;
                if not v42 then
                    v42 = l_GameData_0:GetGameData(v31, true);
                    v42:GetGameDetailsAsync();
                end;
                v43 = false;
                local l_v42_9 = v42;
                if l_v42_9 then
                    l_v196_2 = l_v42_9:GetRecommendedGamesAsync();
                    return ;
                else
                    l_Utility_0.DebugLog("GameDetail:loadRelatedGamesAsync() could not fetch data.");
                    return ;
                end;
            end;
            v121.Visible = false;
            l_v200_1 = l_LoadingWidget_0({
                Parent = v188[4].SelectionHolder
            }, {
                v198, 
                v177
            });
            spawn(function()
                l_v200_1:AwaitFinished();
                l_v200_1:Cleanup();
                l_v200_1 = nil;
                v121.Visible = true;
                v168(l_v196_2);
                v188[4].DefaultSelection = #l_v196_2 > 0 and v122[1].Image or v194(4);
                v188[4]:PostLoaded();
                if v32 then
                    v32.TransitionTweens = v32.TransitionTweens or {};
                    local l_TransitionTweens_2 = v32.TransitionTweens;
                    for _, v230 in pairs((l_ScreenManager_0:FadeInSitu(v121))) do
                        table.insert(l_TransitionTweens_2, v230);
                    end;
                    v75:TweenContent(l_GuiService_0.SelectedCoreObject);
                end;
            end);
        end;
    end;
    v196 = function()
        while v43 do
            wait();
        end;
        v43 = true;
        if not v42 then
            v42 = l_GameData_0:GetGameData(v31, true);
            v42:GetGameDetailsAsync();
        end;
        v43 = false;
        local l_v42_10 = v42;
        if l_v42_10 then
            v132.Text = l_v42_10.LastUpdated or v132.Text;
            v134.Text = l_v42_10.CreationDate or v134.Text;
            v139.Text = l_v42_10.CreatorName or v139.Text;
            v136.Text = l_v42_10.MaxPlayers or v136.Text;
            return ;
        else
            l_Utility_0.DebugLog("GameDetail:loadMoreGameDetailsAsync() could not fetch data.");
            return ;
        end;
    end;
    v130.Visible = false;
    v198 = l_LoadingWidget_0({
        Parent = v130
    }, {
        v196, 
        v177
    });
    do
        local l_v198_1 = v198;
        spawn(function()
            l_v198_1:AwaitFinished();
            l_v198_1:Cleanup();
            l_v198_1 = nil;
            v130.Visible = true;
            if v32 then
                v32.TransitionTweens = v32.TransitionTweens or {};
                local l_TransitionTweens_3 = v32.TransitionTweens;
                for _, v235 in pairs((l_ScreenManager_0:FadeInSitu(v130))) do
                    table.insert(l_TransitionTweens_3, v235);
                end;
                v75:TweenContent(l_GuiService_0.SelectedCoreObject);
            end;
        end);
    end;
    v32.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("GameDetailId"), 
            PlaceId = v31
        };
    end;
    v32.GetDefaultSelectionObject = function(_)
        return v77;
    end;
    v196 = v32.Show;
    v32.Show = function(v238)
        v196(v238);
    end;
    v198 = v32.Focus;
    v32.Focus = function(v239)
        v198(v239);
        v75:ResetTween();
        v75:TweenContent(l_GuiService_0.SelectedCoreObject);
        v37 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
            local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
            if l_SelectedCoreObject_0 then
                v75:TweenContent(l_SelectedCoreObject_0);
            end;
        end);
        if v3 then
            v38 = v3.ViewChanged:connect(function(v241)
                if v241 == 0 then
                    v41 = false;
                    wait(1);
                    v41 = true;
                end;
            end);
        end;
        l_EventHub_0:addEventListener(l_EventHub_0.Notifications.GameJoin, "gameJoin", function(v242)
            if not (v91:GetCanVote() or not v242) then
                v91:SetCanVote(true);
                local l_v91_DefaultSelection_2 = v91:GetDefaultSelection();
                if l_v91_DefaultSelection_2 then
                    l_v91_DefaultSelection_2.NextSelectionLeft = v80;
                    if not v96:IsSelectable() then
                        l_v91_DefaultSelection_2.NextSelectionDown = v97;
                        v97.NextSelectionLeft = v80;
                        v80.NextSelectionRight = l_v91_DefaultSelection_2;
                        v80.NextSelectionUp = l_v91_DefaultSelection_2;
                    else
                        local l_v96_SelectableObject_2 = v96:GetSelectableObject();
                        l_v96_SelectableObject_2.NextSelectionUp = l_v91_DefaultSelection_2;
                        l_v91_DefaultSelection_2.NextSelectionDown = l_v96_SelectableObject_2;
                        v80.NextSelectionRight = l_v96_SelectableObject_2;
                        v80.NextSelectionUp = l_v96_SelectableObject_2;
                        l_v96_SelectableObject_2.NextSelectionLeft = v80;
                        l_v96_SelectableObject_2.NextSelectionDown = v97;
                        v97.NextSelectionLeft = v80;
                        return ;
                    end;
                end;
            end;
        end);
        v176 = v96.OnSelectableChanged:connect(v104);
    end;
    v200 = v32.RemoveFocus;
    v32.RemoveFocus = function(v245)
        v200(v245);
        v37 = l_Utility_0.DisconnectEvent(v37);
        v38 = l_Utility_0.DisconnectEvent(v38);
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.GameJoin, "gameJoin");
        v176 = l_Utility_0.DisconnectEvent(v176);
    end;
    return v32;
end;
