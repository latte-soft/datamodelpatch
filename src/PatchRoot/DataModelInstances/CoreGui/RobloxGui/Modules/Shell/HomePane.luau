local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_RobloxGui_0 = l_CoreGui_0:FindFirstChild("RobloxGui");
local l_Shell_0 = l_RobloxGui_0:FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_FriendsData_0 = require(l_Shell_0:FindFirstChild("FriendsData"));
local l_FriendsView_0 = require(l_Shell_0:FindFirstChild("FriendsView"));
local l_ScrollingGrid_0 = require(l_Shell_0:FindFirstChild("ScrollingGrid"));
local l_GameSort_0 = require(l_Shell_0:FindFirstChild("GameSort"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_AssetManager_0 = require(l_Shell_0:FindFirstChild("AssetManager"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_SortsData_0 = require(l_Shell_0:FindFirstChild("SortsData"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local l_default_0 = require(l_CorePackages_0.Workspace.Packages.LoggingProtocol).default;
local v23 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v24 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v25 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
local v26 = require(l_Shell_0.Flags.GetFFlagXboxAnalyticsTrackTTI);
local v27 = Vector2.new(1920, 1080);
local v28 = Vector2.new(450, 343);
local v29 = Vector2.new(450, 38);
local v30 = Vector2.new(450, 300);
local v31 = Vector2.new(450, 300);
local v32 = Vector2.new(1234, 608);
return function(v33)
    local v34 = {};
    local v35 = false;
    local v36 = {};
    local v37 = l_Utility_0.Create("Frame")({
        Name = "HomePane", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Parent = v33
    });
    local v38 = l_Utility_0.Create("Frame")({
        Name = "ProfileContainer", 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v37
    });
    local v39 = l_Utility_0.Create("TextLabel")({
        Name = "NameLabel", 
        Text = "", 
        TextXAlignment = "Left", 
        TextYAlignment = "Top", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v38
    });
    local v40 = l_Utility_0.Create("ImageButton")({
        Name = "ProfileButton", 
        AutoButtonColor = false, 
        BackgroundTransparency = 1, 
        Parent = v38; 
        l_SoundManager_0:CreateSound("MoveSelection")
    });
    local v41 = l_Utility_0.Create("Frame")({
        Name = "ProfileImageContainer", 
        BackgroundTransparency = 1, 
        Position = UDim2.new(0, 0, 0, 0), 
        Parent = v40; 
        l_AssetManager_0.CreateShadow(1)
    });
    local v42 = l_Utility_0.Create("ImageLabel")({
        Name = "ProfileImage", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        ZIndex = 3, 
        Parent = v41
    });
    l_Utility_0.Create("Frame")({
        Name = "ProfileImageBackground", 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 0, 
        BackgroundColor3 = l_GlobalSettings_0.CharacterBackgroundColor, 
        ZIndex = 2, 
        Parent = v41
    });
    local v43 = l_Utility_0.Create("Frame")({
        Name = "AvatarBrushImage", 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.AvatarBoxBackgroundColor, 
        BackgroundTransparency = l_GlobalSettings_0.AvatarBoxBackgroundDeselectedTransparency, 
        ZIndex = 2
    });
    local v44 = l_Utility_0.Create("ImageLabel")({
        Name = "AvatarBrushImage", 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Parent = v43, 
        Image = "rbxasset://textures/ui/Shell/Icons/CustomizeIcon@1080.png", 
        Size = UDim2.new(0, 47, 0, 48)
    });
    local v45 = l_Utility_0.Create("TextLabel")({
        Name = "AvatarTextLabel", 
        Text = l_LocalizedStrings_0:LocalizedString("EditAvatarPhrase"), 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.ButtonSize, 
        BackgroundTransparency = 1, 
        ZIndex = 2, 
        Parent = v43
    });
    v40.MouseButton1Click:connect(function()
        l_SoundManager_0:Play("ButtonPress");
        l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.NavigateToEquippedAvatar);
    end);
    local function v49()
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        local v47 = l_SelectedCoreObject_0 == v40 and l_GlobalSettings_0.AvatarBoxBackgroundSelectedTransparency or l_GlobalSettings_0.AvatarBoxBackgroundDeselectedTransparency;
        local v48 = l_SelectedCoreObject_0 == v40 and l_GlobalSettings_0.AvatarBoxTextSelectedTransparency or l_GlobalSettings_0.AvatarBoxTextDeselectedTransparency;
        l_Utility_0.PropertyTweener(v43, "BackgroundTransparency", v47, v47, 0, nil, true);
        l_Utility_0.PropertyTweener(v45, "TextTransparency", v48, v48, 0, nil, true);
        l_Utility_0.PropertyTweener(v44, "ImageTransparency", v48, v48, 0, nil, true);
    end;
    local v50 = nil;
    local function v55()
        local l_gamertag_0 = l_AppState_0.store:getState().XboxUser.gamertag;
        v39.Text = not not l_gamertag_0 and l_gamertag_0 or "";
        local l_rbxuid_0 = l_AppState_0.store:getState().RobloxUser.rbxuid;
        if l_rbxuid_0 then
            if v50 then
                v50:Cancel();
            end;
            local l_Size352x352_0 = l_ThumbnailLoader_0.AvatarSizes.Size352x352;
            local v54 = l_ThumbnailLoader_0:LoadAvatarThumbnailAsync(v42, l_rbxuid_0, Enum.ThumbnailType.AvatarThumbnail, Enum.ThumbnailSize.Size352x352, true);
            v50 = v54;
            spawn(function()
                v54:LoadAsync();
                v42.ImageRectSize = Vector2.new(l_Size352x352_0.X, (v31.Y / v31.X) * l_Size352x352_0.X);
            end);
        end;
    end;
    v55();
    local v56 = l_Utility_0.Create("Frame")({
        Name = "FriendActivityContainer", 
        BackgroundTransparency = 1, 
        Parent = v37
    });
    local v57 = l_Utility_0.Create("TextLabel")({
        Name = "FriendActivityTitle", 
        Text = l_LocalizedStrings_0:LocalizedString("FriendActivityWord"), 
        Size = UDim2.new(1, 0, 0, 50), 
        Position = UDim2.new(0, 0, 0, 10), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v56
    });
    local v58 = l_Utility_0.Create("TextLabel")({
        Name = "NoFriendsOnlineMessage", 
        Text = l_LocalizedStrings_0:LocalizedString("NoFriendsOnlinePhrase"), 
        Size = UDim2.new(0.9, 0, 1, -125), 
        Position = UDim2.new(0.05, 0, 0, 125), 
        TextYAlignment = "Top", 
        TextColor3 = l_GlobalSettings_0.GreyTextColor, 
        TextWrapped = true, 
        TextTransparency = l_GlobalSettings_0.FriendStatusTextTransparency, 
        Font = l_GlobalSettings_0.BoldFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v56
    });
    local v59 = l_ScrollingGrid_0({
        SelectionMode = "Middle", 
        Dynamic = true
    });
    v59:SetSize(UDim2.new(1, 0, 1, -60));
    v59:SetRowColumnConstraint(1);
    v59:SetScrollDirection(v59.Enum.ScrollDirection.Vertical);
    v59:SetCellSize(Vector2.new(446, 114));
    v59:SetSpacing(Vector2.new(0, 26));
    v59:SetPosition(UDim2.new(0, 0, 0, v57.Position.Y.Offset + v57.Size.Y.Offset));
    local l_v59_GuiObject_0 = v59:GetGuiObject();
    l_v59_GuiObject_0.Visible = false;
    v59:SetParent(v56);
    local function v62(v61)
        v58.Visible = v61 == 0;
        l_v59_GuiObject_0.Visible = v61 > 0;
    end;
    local v65 = l_LoadingWidget_0({
        Parent = v56
    }, {
        function()
            local v63 = l_FriendsData_0.GetOnlineFriendsAsync();
            l_FriendsView_0(v59, v63, nil, v62);
            local v64 = #v63;
            v58.Visible = v64 == 0;
            l_v59_GuiObject_0.Visible = v64 > 0;
        end
    });
    spawn(function()
        v65:AwaitFinished();
        v65:Cleanup();
    end);
    local v66 = l_Utility_0.Create("Frame")({
        Name = "SortsContainer", 
        BackgroundTransparency = 1, 
        Parent = v37
    });
    local v67 = false;
    local function v108()
        if not v67 then
            v67 = true;
            local v106 = l_LoadingWidget_0({
                Parent = v66
            }, {
                function()
                    while #v36 > 0 do
                        local v68 = table.remove(v36);
                        if v68 then
                            if not ((not l_GuiService_0.SelectedCoreObject or not l_GuiService_0.SelectedCoreObject:IsDescendantOf(v68:GetContainer())) or not v35) then
                                l_Utility_0.SetSelectedCoreObject(v34:GetDefaultSelectionObject());
                            end;
                            v68:Destroy();
                        end;
                    end;
                    local l_l_SortsData_0_UserFavorites_0 = l_SortsData_0:GetUserFavorites();
                    local l_l_l_SortsData_0_UserFavorites_0_SortAsync_0 = l_l_SortsData_0_UserFavorites_0:GetSortAsync(0, 4);
                    local l_l_SortsData_0_UserRecent_0 = l_SortsData_0:GetUserRecent();
                    local l_l_l_SortsData_0_UserRecent_0_SortAsync_0 = l_l_SortsData_0_UserRecent_0:GetSortAsync(0, 4);
                    local v73 = l_l_l_SortsData_0_UserRecent_0_SortAsync_0 and #l_l_l_SortsData_0_UserRecent_0_SortAsync_0 > 2;
                    local v74 = l_l_l_SortsData_0_UserFavorites_0_SortAsync_0 and #l_l_l_SortsData_0_UserFavorites_0_SortAsync_0 > 2;
                    local function _(v75, v76, v77, v78)
                        if v76 then
                            v75:SetPlaceIds(v76, v77, v78);
                        end;
                        v75:SetTitle(v77);
                        v75:SetVisible(false);
                        v75:SetParent(v66);
                        table.insert(v36, v75);
                    end;
                    local function v84(v80, v81, v82)
                        local l_l_GameSort_0_MainGridView_0 = l_GameSort_0:CreateMainGridView(UDim2.new(0, 378, 1, 0), Vector2.new(10, 10), UDim2.new(1, 0, 0, 378), UDim2.new(0, 184, 0, 184));
                        if v81 then
                            l_l_GameSort_0_MainGridView_0:SetPlaceIds(v81, v80, v82);
                        end;
                        l_l_GameSort_0_MainGridView_0:SetTitle(v80);
                        l_l_GameSort_0_MainGridView_0:SetVisible(false);
                        l_l_GameSort_0_MainGridView_0:SetParent(v66);
                        table.insert(v36, l_l_GameSort_0_MainGridView_0);
                        return l_l_GameSort_0_MainGridView_0;
                    end;
                    local function _(v85, v86, v87, v88, v89, v90, v91, v92)
                        local l_l_GameSort_0_GridView_0 = l_GameSort_0:CreateGridView(v85, v86, v87, v88, v89);
                        if v90 then
                            l_l_GameSort_0_GridView_0:SetPlaceIds(v90, v91, v92);
                        end;
                        l_l_GameSort_0_GridView_0:SetTitle(v91);
                        l_l_GameSort_0_GridView_0:SetVisible(false);
                        l_l_GameSort_0_GridView_0:SetParent(v66);
                        table.insert(v36, l_l_GameSort_0_GridView_0);
                        return l_l_GameSort_0_GridView_0;
                    end;
                    local v95 = UDim2.new(0, 0, 0, 0);
                    local v96 = (not not v74 and v73) and 50 or 28;
                    if v74 then
                        local v97 = v84(l_LocalizedStrings_0:LocalizedString("FavoritesSortTitle"), l_l_l_SortsData_0_UserFavorites_0_SortAsync_0, l_l_SortsData_0_UserFavorites_0);
                        v97:SetPosition(v95);
                        v95 = v95 + UDim2.new(0, v97:GetContainer().Size.X.Offset + v96, 0, 0);
                    end;
                    if v73 then
                        local v98 = v84(l_LocalizedStrings_0:LocalizedString("RecentlyPlayedSortTitle"), l_l_l_SortsData_0_UserRecent_0_SortAsync_0, l_l_SortsData_0_UserRecent_0);
                        v98:SetPosition(v95);
                        v95 = v95 + UDim2.new(0, v98:GetContainer().Size.X.Offset + v96, 0, 0);
                    end;
                    local l_l_SortsData_0_Sort_0 = l_SortsData_0:GetSort(l_SortsData_0.DefaultSortId.Featured);
                    if l_l_SortsData_0_Sort_0 then
                        local v100 = l_LocalizedStrings_0:LocalizedString("FeaturedTitle");
                        local v101 = nil;
                        if not v73 or not v74 then
                            if not v73 and not v74 then
                                local l_l_l_SortsData_0_Sort_0_SortAsync_0 = l_l_SortsData_0_Sort_0:GetSortAsync(0, 9);
                                local l_l_GameSort_0_GridView_1 = l_GameSort_0:CreateGridView(UDim2.new(0, 1236, 0, 648), UDim2.new(0, 300, 0, 300), Vector2.new(12, 12), 2, 4);
                                if l_l_l_SortsData_0_Sort_0_SortAsync_0 then
                                    l_l_GameSort_0_GridView_1:SetPlaceIds(l_l_l_SortsData_0_Sort_0_SortAsync_0, v100, l_l_SortsData_0_Sort_0);
                                end;
                                l_l_GameSort_0_GridView_1:SetTitle(v100);
                                l_l_GameSort_0_GridView_1:SetVisible(false);
                                l_l_GameSort_0_GridView_1:SetParent(v66);
                                table.insert(v36, l_l_GameSort_0_GridView_1);
                                v101 = l_l_GameSort_0_GridView_1;
                            else
                                local l_l_l_SortsData_0_Sort_0_SortAsync_1 = l_l_SortsData_0_Sort_0:GetSortAsync(0, 7);
                                local l_l_GameSort_0_GridView_2 = l_GameSort_0:CreateGridView(UDim2.new(0, 858, 1, 0), UDim2.new(0, 276, 0, 276), Vector2.new(15, 20), 2, 3);
                                if l_l_l_SortsData_0_Sort_0_SortAsync_1 then
                                    l_l_GameSort_0_GridView_2:SetPlaceIds(l_l_l_SortsData_0_Sort_0_SortAsync_1, v100, l_l_SortsData_0_Sort_0);
                                end;
                                l_l_GameSort_0_GridView_2:SetTitle(v100);
                                l_l_GameSort_0_GridView_2:SetVisible(false);
                                l_l_GameSort_0_GridView_2:SetParent(v66);
                                table.insert(v36, l_l_GameSort_0_GridView_2);
                                v101 = l_l_GameSort_0_GridView_2;
                            end;
                        else
                            v101 = v84(v100, l_l_SortsData_0_Sort_0:GetSortAsync(0, 4), l_l_SortsData_0_Sort_0);
                        end;
                        v101:SetPosition(v95);
                    end;
                end
            });
            spawn(function()
                v106:AwaitFinished();
                v106:Cleanup();
                v106 = nil;
                v67 = false;
                for v107 = 1, #v36 do
                    v36[v107]:SetVisible(true);
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
    local function v110()
        local l_AbsoluteSize_0 = l_RobloxGui_0.AbsoluteSize;
        v38.Size = l_Utility_0.CalculateRelativeDimensions(v38, v28, v27, l_AbsoluteSize_0);
        v39.Size = l_Utility_0.CalculateRelativeDimensions(v39, v29, v27, l_AbsoluteSize_0);
        v40.Size = l_Utility_0.CalculateRelativeDimensions(v40, v30, v27, l_AbsoluteSize_0);
        v40.AnchorPoint = Vector2.new(0, 1);
        v40.Position = UDim2.new(0, 0, 1, -6);
        v41.Size = l_Utility_0.CalculateRelativeDimensions(v41, v31, v27, l_AbsoluteSize_0);
        v43.Size = UDim2.new(1 - v41.Size.X.Scale, -v41.Size.X.Offset, 1, 0);
        v43.Position = UDim2.new(1 - v43.Size.X.Scale, v43.Size.X.Offset, 0, 0);
        v44.AnchorPoint = Vector2.new(0.5, 0.5);
        v44.Position = UDim2.new(0.5, 0, 0.42, 0);
        v45.AnchorPoint = Vector2.new(0.5, 0.5);
        v45.Position = UDim2.new(0.5, 0, 0.7, 0);
        v56.Size = UDim2.new(v38.Size.X.Scale, 0, 0, 300);
        v56.Position = UDim2.new(0, 0, v38.Size.Y.Scale, 0);
        v66.Size = l_Utility_0.CalculateRelativeDimensions(v66, v32, v27, l_AbsoluteSize_0);
        v66.Position = UDim2.new(1 - v66.Size.X.Scale, 0, 0, 0);
    end;
    v110();
    local v111 = nil;
    local v112 = nil;
    local v113 = nil;
    v34.GetName = function(_)
        return l_LocalizedStrings_0:LocalizedString("HomeWord");
    end;
    v34.GetId = function(_)
        return l_Analytics_0.TabNames("HomeId");
    end;
    v34.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("HomePaneId")
        };
    end;
    v34.IsFocused = function(_)
        return v35;
    end;
    v34.GetDefaultSelectionObject = function(_)
        return v40;
    end;
    v34.SetSelectionObject = function(v119)
        l_Utility_0.SetSelectedCoreObject(v119:GetDefaultSelectionObject());
    end;
    v34.Show = function(v120, _)
        v37.Visible = true;
        v108();
        v110();
        l_Utility_0.DisconnectEvent(v111);
        v111 = l_RobloxGui_0:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
            l_RunService_0.RenderStepped:wait();
            v110();
        end);
        l_Utility_0.DisconnectEvent(v112);
        l_Utility_0.DisconnectEvent(v113);
        v112 = v40.SelectionGained:connect(v49);
        v113 = v40.SelectionLost:connect(v49);
        v49();
        v55();
        l_ScreenManager_0:DefaultCancelFade(v120.TransitionTweens);
        v120.TransitionTweens = l_ScreenManager_0:DefaultFadeIn(v37);
        delay(0.5, function()
            if v35 and l_GuiService_0.SelectedCoreObject == nil then
                v120:SetSelectionObject();
            end;
        end);
        l_FriendsData_0:SuspendUpdate();
        l_ScreenManager_0:PlayDefaultOpenSound();
        if v24() > 0 then
            if not v25() then
                l_Analytics_0.reportNavigationLoaded(v34:GetName());
            else
                l_Analytics_0.reportNavigationLoaded(l_Analytics_0.TabNames("HomeId"));
                return ;
            end;
        end;
    end;
    v34.Hide = function(v122, v123)
        v37.Visible = false;
        v112 = l_Utility_0.DisconnectEvent(v112);
        v113 = l_Utility_0.DisconnectEvent(v113);
        v111 = l_Utility_0.DisconnectEvent(v111);
        l_ScreenManager_0:DefaultCancelFade(v122.TransitionTweens);
        v122.TransitionTweens = nil;
        if v123 then
            l_FriendsData_0:ResumeUpdate();
        end;
    end;
    v34.Focus = function(v124)
        v35 = true;
        v110();
        if not v23.isUserEnrolled() then
            v124:SetSelectionObject();
        else
            local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
            if not (not l_SelectedCoreObject_1 or l_SelectedCoreObject_1:IsDescendantOf(v37)) then
                v124:SetSelectionObject();
            end;
        end;
        v49();
        if v26() then
            l_default_0:logEventOnce("home_page_interactive");
        end;
    end;
    v34.RemoveFocus = function(_)
        v35 = false;
        local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
        if not (not l_SelectedCoreObject_2 or not l_SelectedCoreObject_2:IsDescendantOf(v37)) then
            l_Utility_0.SetSelectedCoreObject(nil);
        end;
    end;
    v34.SetPosition = function(_, v129)
        v37.Position = v129;
    end;
    v34.SetParent = function(_, v131)
        v37.Parent = v131;
    end;
    v34.IsAncestorOf = function(_, v133)
        return v37 and v37:IsAncestorOf(v133);
    end;
    return v34;
end;
