local l_Modules_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules");
local l_Shell_0 = l_Modules_0:FindFirstChild("Shell");
local l_Widgets_0 = l_Shell_0:FindFirstChild("Widgets");
local l_GuiService_0 = game:GetService("GuiService");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_PopupText_0 = require(l_Shell_0:FindFirstChild("PopupText"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Alerts_0 = require(l_Shell_0:FindFirstChild("Alerts"));
local l_ErrorOverlay_0 = require(l_Shell_0:FindFirstChild("ErrorOverlay"));
local l_LockedGameSortView_0 = require(l_Shell_0:FindFirstChild("LockedGameSortView"));
local l_MoreButton_0 = require(l_Widgets_0:FindFirstChild("MoreButton"));
local l_GameData_0 = require(l_Shell_0:FindFirstChild("GameData"));
local l_SortsData_0 = require(l_Shell_0:FindFirstChild("SortsData"));
local v18 = require(l_Modules_0.Shell.BatchThumbnailLoader);
local l_LuaContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ContextBarContext")).LuaContext;
local v20 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v21 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v22 = {};
local function v24(v23)
    return (l_Utility_0.Create("TextLabel")({
        Name = "SortTitle", 
        Size = UDim2.new(1, 0, 0, 36), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Text = v23
    }));
end;
local function v32(v25, v26)
    local v27, v28 = l_MoreButton_0();
    v28 = l_Utility_0.Create("ImageLabel")({
        Name = "OverrideSelection", 
        Image = "rbxasset://textures/ui/SelectionBox.png", 
        ScaleType = Enum.ScaleType.Slice, 
        SliceCenter = Rect.new(19, 19, 43, 43), 
        BackgroundTransparency = 1
    });
    v27 = l_Utility_0.Create("ImageButton")({
        Name = "MoreButton", 
        Size = UDim2.new(1, 0, 0, 50), 
        Position = UDim2.new(0, 0, 1, v25), 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Visible = false, 
        SelectionImageObject = v28, 
        Parent = v26; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v29 = l_Utility_0.Create("ImageLabel")({
        Name = "MoreImage", 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = 2, 
        Parent = v27
    });
    local function v31(v30)
        v29.Image = not v30 and "rbxasset://textures/ui/Shell/Buttons/MoreButton@1080.png" or "rbxasset://textures/ui/Shell/Buttons/MoreButtonSelected@1080.png";
        v29.Size = UDim2.new(0, 108, 0, 50);
        v29.Position = UDim2.new(1, -v29.Size.X.Offset, 0, 0);
        v28.Size = UDim2.new(0, v29.Size.X.Offset + 14, 0, v29.Size.Y.Offset + 14);
        v28.Position = UDim2.new(1, -v28.Size.X.Offset + 7, 0, -7);
    end;
    v27.SelectionGained:connect(function()
        v31(true);
    end);
    v27.SelectionLost:connect(function()
        v31(false);
    end);
    v31(l_GuiService_0.SelectedCoreObject == v27);
    return v27;
end;
local function v35(v33, v34)
    return l_Utility_0.Create("ImageButton")({
        Name = "GameThumbButton", 
        Size = v33, 
        Position = v34, 
        BackgroundTransparency = 0, 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.ModalBackgroundColor; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
end;
local function v44(v36, v37, v38, v39, v40)
    for v41 = 1, v36 do
        for v42 = 1, v37 do
            local v43 = v35(v38, UDim2.new(0, (v42 - 1) * v38.X.Offset + (v42 - 1) * v39.x, 0, (v41 - 1) * v38.Y.Offset + (v41 - 1) * v39.y));
            table.insert(v40, v43);
            v43.Name = tostring(#v40);
        end;
    end;
end;
local function v48(v45)
    local v46 = {};
    for v47 = 1, #v45 do
        table.insert(v46, (l_PopupText_0(v45[v47], "")));
    end;
    return v46;
end;
local function v101(v49, v50, v51)
    local v52 = {};
    local v53 = false;
    local v54 = false;
    local v55 = nil;
    v52.Container = l_Utility_0.Create("Frame")({
        Name = "SortContainer", 
        Size = v49, 
        BackgroundTransparency = 1
    });
    local v56 = v24("");
    v56.Parent = v52.Container;
    local v57 = v32(12, v52.Container);
    local v58 = v48(v50);
    local v59 = l_Utility_0.Create("Frame")({
        Name = "ImageContainer", 
        Size = UDim2.new(1, 0, 0, v51), 
        Position = UDim2.new(0, 0, 0, 36), 
        BackgroundTransparency = 1, 
        Parent = v52.Container
    });
    for v60 = 1, #v50 do
        v50[v60].Parent = v59;
    end;
    local v61 = l_LockedGameSortView_0();
    local function _()
        for v62 = 1, #v50 do
            v61:CreateLockedIconOverlay(v50[v62]);
            v50[v62].Selectable = false;
        end;
    end;
    local function _()
        if v53 == true then
            v61:SetParent(v59);
            for v64 = 1, #v50 do
                v61:CreateLockedIconOverlay(v50[v64]);
                v50[v64].Selectable = false;
            end;
            v57.Visible = false;
            return ;
        else
            v61:SetParent(nil);
            v61:RemoveLockedIconOverlays();
            v57.Visible = v54;
            return ;
        end;
    end;
    v52.SetLockState = function(_, v67)
        v53 = v67;
        if v53 == true then
            v61:SetParent(v59);
            for v68 = 1, #v50 do
                v61:CreateLockedIconOverlay(v50[v68]);
                v50[v68].Selectable = false;
            end;
            v57.Visible = false;
            return ;
        else
            v61:SetParent(nil);
            v61:RemoveLockedIconOverlays();
            v57.Visible = v54;
            return ;
        end;
    end;
    v52.SetParent = function(v69, v70)
        v69.Container.Parent = v70;
    end;
    v52.GetContainer = function(v71)
        return v71.Container;
    end;
    v52.SetPosition = function(v72, v73)
        v72.Container.Position = v73;
    end;
    v52.SetTitle = function(_, v75)
        v56.Text = v75;
    end;
    v52.SetVisible = function(v76, v77)
        v76.Container.Visible = v77;
    end;
    v52.SetPlaceIds = function(_, v79, v80, v81)
        if v79 then
            for v82 = 1, #v50 do
                local v83 = not not v79[v82] and v79[v82].placeId or nil;
                local _ = l_ThumbnailLoader_0.Sizes.Medium;
                local l_SquareIcon_0 = l_ThumbnailLoader_0.AssetType.SquareIcon;
                if not v83 then
                    v50[v82].BackgroundColor3 = l_GlobalSettings_0.GreyButtonColor;
                    v50[v82].Image = "";
                    local _ = l_Utility_0.Create("ImageLabel")({
                        Name = "NoGameImage", 
                        Size = UDim2.new(0, 102, 0, 102), 
                        BackgroundTransparency = 1, 
                        Image = "rbxasset://textures/ui/Shell/Icons/GamePlusIcon.png", 
                        ZIndex = v50[v82].ZIndex, 
                        Parent = v50[v82], 
                        AnchorPoint = Vector2.new(0.5, 0.5), 
                        Position = UDim2.new(0.5, 0, 0.5, 0)
                    });
                    v50[v82].MouseButton1Click:connect(function()
                        if v81 == l_SortsData_0:GetUserPlaces() then
                            l_ScreenManager_0:OpenScreen(l_ErrorOverlay_0(l_Alerts_0.PlayMyPlaceMoreGames), false);
                            return ;
                        else
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameGenre, l_LocalizedStrings_0:LocalizedString("FeaturedTitle"), l_SortsData_0:GetSort(l_SortsData_0.DefaultSortId.Featured));
                            return ;
                        end;
                    end);
                    if v58[v82] then
                        v58[v82]:SetText(l_LocalizedStrings_0:LocalizedString("MoreGamesPhrase"));
                    end;
                else
                    local l_l_GameData_0_GameData_0 = l_GameData_0:GetGameData(v83);
                    if l_l_GameData_0_GameData_0 then
                        if v50[v82] then
                            if not l_l_GameData_0_GameData_0.ImageToken then
                                local v88 = l_ThumbnailLoader_0:Create(v50[v82], l_l_GameData_0_GameData_0.UniverseId, l_ThumbnailLoader_0.GameIconSizes.Medium, l_SquareIcon_0);
                                spawn(function()
                                    if not v88:LoadAsync(true, false) then
                                    end;
                                end);
                            else
                                v18:CreateThumbnail(v50[v82], l_l_GameData_0_GameData_0.ImageToken, v18.Sizes.Medium, true, false);
                            end;
                            v50[v82].MouseButton1Click:connect(function()
                                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameDetail, v83);
                            end);
                            l_GameData_0:AddRelatedGuiObject(v83, v50[v82]);
                        end;
                        if v58[v82] then
                            v58[v82]:SetText(l_l_GameData_0_GameData_0.Name);
                        end;
                    end;
                end;
            end;
            v54 = #v50 < #v79;
            v57.Visible = v54;
            v57.MouseButton1Click:connect(function()
                l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameGenre, v80, v81);
            end);
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.UnlockedUGC, "unlockView", function()
                v52:SetLockState(false);
            end);
            if v20.isUserEnrolled() then
                local v89 = false;
                do
                    local l_v89_0 = v89;
                    local function v94(_, v92, _)
                        if v92 == Enum.UserInputState.Begin then
                            l_v89_0 = true;
                            return ;
                        else
                            if not (not (v92 == Enum.UserInputState.End) or not l_v89_0) then
                                if v21() > 0 then
                                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameGenre, v80, v81, "ButtonX");
                                    return ;
                                else
                                    l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameGenre, v80, v81);
                                end;
                            end;
                            return ;
                        end;
                    end;
                    l_Utility_0.DisconnectEvent(v55);
                    v55 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
                        if not v52:Contains(l_GuiService_0.SelectedCoreObject) then
                            l_LuaContext_0:UnbindAction("X" .. v80);
                            return ;
                        else
                            l_LuaContext_0:BindAction("X" .. v80, Enum.KeyCode.ButtonX, l_LocalizedStrings_0:LocStringUA("Feature.GamePage.ActionSeeAll"), v94);
                            return ;
                        end;
                    end);
                end;
            end;
        end;
    end;
    v52.GetDefaultSelection = function(_)
        local v96 = nil;
        if not v53 then
            if #v50 > 0 then
                v96 = v50[1];
            end;
            return v96;
        else
            return (v61:GetSelection());
        end;
    end;
    v52.Contains = function(_, v98)
        for v99 = 1, #v50 do
            if v50[v99] == v98 then
                return true;
            end;
        end;
        return false;
    end;
    v52.Destroy = function(v100)
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.UnlockedUGC, "unlockView");
        v100.Container:Destroy();
        if v20.isUserEnrolled() then
            l_Utility_0.DisconnectEvent(v55);
        end;
    end;
    return v52;
end;
v22.CreateMainGridView = function(_, v103, v104, v105, v106)
    local v107 = {};
    local v108 = (v105.Y.Offset + v104.y) + v106.Y.Offset;
    local v109 = v35(v105, UDim2.new(0, 0, 0, 0));
    table.insert(v107, v109);
    v109.Name = tostring(#v107);
    for v110 = 1, 2 do
        local v111 = v35(v106, UDim2.new(0, (v110 - 1) * v106.X.Offset + (v110 - 1) * v104.x, 1, -v106.Y.Offset));
        table.insert(v107, v111);
        v111.Name = tostring(#v107);
    end;
    return (v101(v103, v107, v108));
end;
v22.CreateGridView = function(_, v113, v114, v115, v116, v117)
    local v118 = {};
    local v119 = v114.Y.Offset * v117 + (v117 - 1) * v115.y;
    v44(v116, v117, v114, v115, v118);
    return (v101(v113, v118, v119));
end;
return v22;
