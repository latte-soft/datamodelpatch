local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_TextService_0 = game:GetService("TextService");
local v2 = nil;
pcall(function()
    v2 = game:GetService("PlatformService");
end);
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_Errors_0 = require(l_Shell_0:FindFirstChild("Errors"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_GameData_0 = require(l_Shell_0:FindFirstChild("GameData"));
local l_GameJoin_0 = require(l_Shell_0:FindFirstChild("GameJoin"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_BaseScreen_0 = require(l_Shell_0:FindFirstChild("BaseScreen"));
local l_CarouselView_0 = require(l_Shell_0:FindFirstChild("CarouselView"));
local l_CarouselController_0 = require(l_Shell_0:FindFirstChild("CarouselController"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_GameDetailsStrip_0 = require(l_Shell_0:FindFirstChild("GameDetailsStrip"));
local v19 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v20 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function(v21)
    local v22 = l_BaseScreen_0();
    local v23 = nil;
    local v24 = nil;
    local v25 = true;
    local v26 = true;
    local l_GreenButtonColor_0 = l_GlobalSettings_0.GreenButtonColor;
    local l_GreenSelectedButtonColor_0 = l_GlobalSettings_0.GreenSelectedButtonColor;
    local l_GreyButtonColor_0 = l_GlobalSettings_0.GreyButtonColor;
    local l_GreySelectedButtonColor_0 = l_GlobalSettings_0.GreySelectedButtonColor;
    local l_WhiteTextColor_0 = l_GlobalSettings_0.WhiteTextColor;
    local l_TextSelectedColor_0 = l_GlobalSettings_0.TextSelectedColor;
    local v33 = l_Utility_0.Create("Frame")({
        Name = "ViewContainer", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v22.Container
    });
    v22.ViewContainer = v33;
    local v34 = l_CarouselView_0();
    v34:SetSize(UDim2.new(0, 1724, 0, 450));
    v34:SetPosition(UDim2.new(0, 0, 0, 240));
    v34:SetPadding(18);
    v34:SetItemSizePercentOfContainer(0.6666666666666666);
    v34:SetParent(v33);
    local v35 = l_CarouselController_0(v34);
    local v36 = l_Utility_0.Create("Frame")({
        Name = "PlayButtonContainer", 
        Size = UDim2.new(0, 228, 0, 72), 
        Position = UDim2.new(0, 0, 1, -77), 
        BackgroundTransparency = 1, 
        Parent = v33; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v37 = l_Utility_0.Create("ImageButton")({
        Name = "PlayButton", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GreenButtonColor_0, 
        Image = l_GlobalSettings_0.RoundCornerButtonImage, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
        ZIndex = 2, 
        Parent = v36; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v38 = l_Utility_0.Create("TextLabel")({
        Name = "PlayText", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("PlayWord"), 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_WhiteTextColor_0, 
        ZIndex = 2, 
        Parent = v37
    });
    l_Utility_0.ResizeButtonWithText(v36, v38, l_GlobalSettings_0.TextHorizontalPadding);
    local v39 = l_Utility_0.Create("Frame")({
        Name = "FavoriteButtonContainer", 
        Position = UDim2.new(0, v36.Size.X.Offset + 10, 1, -77), 
        Size = UDim2.new(0, 228, 0, 72), 
        BackgroundTransparency = 1, 
        Parent = v33; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v40 = l_Utility_0.Create("ImageButton")({
        Name = "FavoriteButton", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        ImageColor3 = l_GreyButtonColor_0, 
        Image = l_GlobalSettings_0.RoundCornerButtonImage, 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(Vector2.new(4, 4), Vector2.new(28, 28)), 
        ZIndex = 2, 
        Parent = v39; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v41 = l_Utility_0.Create("TextLabel")({
        Name = "FavoriteText", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("FavoriteWord"), 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        TextColor3 = l_WhiteTextColor_0, 
        ZIndex = 2, 
        Parent = v40
    });
    local v42 = l_Utility_0.Create("ImageLabel")({
        Name = "FavoriteStarImage", 
        Size = UDim2.new(0, 32, 0, 31), 
        Position = UDim2.new(0, 16, 0.5, -15.5), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Icons/FavoriteStar@1080.png", 
        Visible = false, 
        ZIndex = 2, 
        Parent = v40
    });
    l_Utility_0.ResizeButtonWithDynamicText(v39, v41, {
        l_LocalizedStrings_0:LocalizedString("FavoritedWord")
    }, l_GlobalSettings_0.TextHorizontalPadding + ((v42.Position.X.Offset + v42.Size.X.Offset) + 12) / 2);
    local l_v34_Container_0 = v34:GetContainer();
    local v44 = l_Utility_0.Create("Frame")({
        Name = "GameDetailsContainer", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 18, 0, (l_v34_Container_0.Position.Y.Offset + l_v34_Container_0.Size.Y.Offset) + 14), 
        BackgroundTransparency = 1, 
        Parent = v33
    });
    local _ = l_Utility_0.Create("UIListLayout")({
        Name = "GameDetailsContainerLayout", 
        Padding = UDim.new(0, 12), 
        FillDirection = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        Parent = v44
    });
    local v46 = l_Utility_0.Create("TextLabel")({
        Name = "GameTitleLabel", 
        BackgroundTransparency = 1, 
        LayoutOrder = 1, 
        Text = "", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        Font = l_GlobalSettings_0.LightFont, 
        FontSize = l_GlobalSettings_0.HeaderSize, 
        Parent = v44
    });
    local v47 = l_GameDetailsStrip_0(v44, nil, 2);
    local v48 = l_Utility_0.Create("TextLabel")({
        Name = "DescriptionText", 
        Size = UDim2.new(0, 850, 0, 64), 
        LayoutOrder = 3, 
        BackgroundTransparency = 1, 
        Text = "", 
        TextColor3 = l_GlobalSettings_0.LightGreyTextColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        Font = l_GlobalSettings_0.LightFont, 
        TextWrapped = true, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        Parent = v44
    });
    local v49 = l_Utility_0.Create("TextLabel")({
        Name = "noResultsText", 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        Text = l_LocalizedStrings_0:LocalizedString("NoGamesPhrase"), 
        TextColor3 = l_GlobalSettings_0.LightGreyTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.MediumFontSize, 
        Visible = false, 
        Parent = v22.Container
    });
    v37.NextSelectionLeft = v37;
    v40.NextSelectionRight = v40;
    v37.SelectionGained:connect(function()
        v37.ImageColor3 = l_GreenSelectedButtonColor_0;
        v38.TextColor3 = l_TextSelectedColor_0;
    end);
    v37.SelectionLost:connect(function()
        v37.ImageColor3 = l_GreenButtonColor_0;
        v38.TextColor3 = l_WhiteTextColor_0;
    end);
    v40.SelectionGained:connect(function()
        v40.ImageColor3 = l_GreySelectedButtonColor_0;
        v41.TextColor3 = l_TextSelectedColor_0;
    end);
    v40.SelectionLost:connect(function()
        v40.ImageColor3 = l_GreyButtonColor_0;
        v41.TextColor3 = l_WhiteTextColor_0;
    end);
    local function v51(v50)
        if v50 == true then
            v42.Visible = true;
            v41.Position = UDim2.new(0, (v42.Position.X.Offset + v42.Size.X.Offset) + 12, 0, 0);
            v41.Text = l_LocalizedStrings_0:LocalizedString("FavoritedWord");
            v41.TextXAlignment = Enum.TextXAlignment.Left;
            return ;
        else
            v42.Visible = false;
            v41.Position = UDim2.new(0, 0, 0, 0);
            v41.Text = l_LocalizedStrings_0:LocalizedString("FavoriteWord");
            v41.TextXAlignment = Enum.TextXAlignment.Center;
            return ;
        end;
    end;
    local function _(v52)
        v46.Text = v52;
        local v53 = l_TextService_0:getTextSize(v46.Text, l_Utility_0.ConvertFontSizeEnumToInt(v46.FontSize), v46.Font, Vector2.new());
        v46.Size = UDim2.new(0, v53.X, 0, v53.Y);
    end;
    local function _(v55)
        v48.Text = v55;
    end;
    local function _(v57)
        v46.Text = not not v57 and v57.Name or "";
        local v58 = l_TextService_0:getTextSize(v46.Text, l_Utility_0.ConvertFontSizeEnumToInt(v46.FontSize), v46.Font, Vector2.new());
        v46.Size = UDim2.new(0, v58.X, 0, v58.Y);
        v47:setData(v57);
        v48.Text = not not v57 and v57.Description or "";
    end;
    local v60 = {};
    local v61 = nil;
    local function _()
        l_Utility_0.DisconnectEvents(v60);
        v60 = {};
        v46.Text = "";
        local v62 = l_TextService_0:getTextSize(v46.Text, l_Utility_0.ConvertFontSizeEnumToInt(v46.FontSize), v46.Font, Vector2.new());
        v46.Size = UDim2.new(0, v62.X, 0, v62.Y);
        v47:setData(nil);
        v48.Text = "";
        v51();
    end;
    v61 = function(v64)
        l_Utility_0.DisconnectEvents(v60);
        v60 = {};
        local l_l_GameData_0_GameData_0 = l_GameData_0:GetGameData(v64);
        if not l_l_GameData_0_GameData_0 then
            l_Utility_0.DisconnectEvents(v60);
            v60 = {};
            v46.Text = "";
            local v66 = l_TextService_0:getTextSize(v46.Text, l_Utility_0.ConvertFontSizeEnumToInt(v46.FontSize), v46.Font, Vector2.new());
            v46.Size = UDim2.new(0, v66.X, 0, v66.Y);
            v47:setData(nil);
            v48.Text = "";
            v51();
            return ;
        else
            table.insert(v60, l_l_GameData_0_GameData_0.OnGetVoteDataEnd:connect(function(v67)
                v47:setVoteView(v67);
            end));
            table.insert(v60, l_l_GameData_0_GameData_0.OnGetGameDetailsEnd:connect(function(v68)
                v48.Text = v68.Description or "";
                v47:setData(l_l_GameData_0_GameData_0);
                v51(v68.IsFavorited);
            end));
            v46.Text = not not l_l_GameData_0_GameData_0 and l_l_GameData_0_GameData_0.Name or "";
            local v69 = l_TextService_0:getTextSize(v46.Text, l_Utility_0.ConvertFontSizeEnumToInt(v46.FontSize), v46.Font, Vector2.new());
            v46.Size = UDim2.new(0, v69.X, 0, v69.Y);
            v47:setData(l_l_GameData_0_GameData_0);
            v48.Text = not not l_l_GameData_0_GameData_0 and l_l_GameData_0_GameData_0.Description or "";
            v51(l_l_GameData_0_GameData_0.IsFavorited);
            spawn(function()
                if not l_l_GameData_0_GameData_0.VoteData then
                    l_l_GameData_0_GameData_0:GetVoteDataAsync();
                end;
                if not l_l_GameData_0_GameData_0.Description or l_l_GameData_0_GameData_0.IsFavorited == nil then
                    l_l_GameData_0_GameData_0:GetGameDetailsAsync();
                end;
            end);
            return ;
        end;
    end;
    v37.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        local l_v35_CurrentFocusGameData_0 = v35:GetCurrentFocusGameData();
        local l_l_GameData_0_GameData_1 = l_GameData_0:GetGameData(not not l_v35_CurrentFocusGameData_0 and l_v35_CurrentFocusGameData_0.placeId or nil);
        if not ((not l_l_GameData_0_GameData_1 or not v25) or not v26) then
            v25 = false;
            if not l_l_GameData_0_GameData_1.CreatorUserId then
                l_l_GameData_0_GameData_1:GetGameDetailsAsync();
            end;
            l_GameJoin_0:StartGame(l_GameJoin_0.JoinType.Normal, l_l_GameData_0_GameData_1.PlaceId, l_l_GameData_0_GameData_1.CreatorUserId, v21);
            v25 = true;
        end;
    end);
    v40.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        local l_v35_CurrentFocusGameData_1 = v35:GetCurrentFocusGameData();
        local l_l_GameData_0_GameData_2 = l_GameData_0:GetGameData(not not l_v35_CurrentFocusGameData_1 and l_v35_CurrentFocusGameData_1.placeId or nil);
        if l_l_GameData_0_GameData_2 then
            local v74, v75 = l_l_GameData_0_GameData_2:PostFavoriteAsync();
            if not v74 then
                if v75 then
                    l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Errors_0.Favorite[v75]), false);
                end;
            else
                v51(l_l_GameData_0_GameData_2.IsFavorited);
                return ;
            end;
        end;
    end);
    v22.LoadGameCollection = function(_, v77)
        v33.Visible = false;
        v49.Visible = false;
        v34:SetParent(nil);
        spawn(function()
            local v78 = l_LoadingWidget_0({
                Parent = v22.Container
            }, {
                function()
                    v35:InitializeAsync(v77);
                end
            });
            v78:AwaitFinished();
            v78:Cleanup();
            v78 = nil;
            v34:SetParent(v33);
            if v22:IsFocused() then
                if not v35:HasResults() then
                    v49.Visible = true;
                else
                    v33.Visible = true;
                    l_Utility_0.SetSelectedCoreObject(v34:GetFocusItem());
                    return ;
                end;
            end;
        end);
    end;
    v22.GetDefaultSelectionObject = function(_)
        return v34:GetFocusItem();
    end;
    v22.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("BaseCarouselScreenId"), 
            Title = v22:GetTitle()
        };
    end;
    local l_Focus_0 = v22.Focus;
    v22.Focus = function(v82)
        l_Focus_0(v82);
        v34:Focus();
        if v2 then
            v24 = v2.ViewChanged:connect(function(v83)
                if v83 == 0 then
                    v26 = false;
                    wait(1);
                    v26 = true;
                end;
            end);
        end;
        v23 = v35.NewItemSelected:connect(v61);
        local l_v35_CurrentFocusGameData_2 = v35:GetCurrentFocusGameData();
        v61(not not l_v35_CurrentFocusGameData_2 and l_v35_CurrentFocusGameData_2.placeId or nil);
        v35:Connect();
    end;
    local l_RemoveFocus_0 = v22.RemoveFocus;
    v22.RemoveFocus = function(v86)
        l_RemoveFocus_0(v86);
        v24 = l_Utility_0.DisconnectEvent(v24);
        v23 = l_Utility_0.DisconnectEvent(v23);
        v35:Disconnect();
        l_Utility_0.DisconnectEvents(v60);
        v60 = {};
    end;
    if not (not (v19() > 0) or not v20()) then
        local l_Show_0 = v22.Show;
        v22.Show = function(v88)
            l_Show_0(v88);
            l_Analytics_0.reportNavigationLoaded(v21);
        end;
    end;
    return v22;
end;
