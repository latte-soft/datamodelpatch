local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RunService_0 = game:GetService("RunService");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local v5 = require(l_Shell_0.ErrorOverlay);
local l_PackageData_0 = require(l_Shell_0:FindFirstChild("PackageData"));
local l_ScrollingGrid_0 = require(l_Shell_0:FindFirstChild("ScrollingGrid"));
local l_AvatarTile_0 = require(l_Shell_0:FindFirstChild("AvatarTile"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_ScreenManager_0 = require(l_Shell_0:FindFirstChild("ScreenManager"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_ThumbnailLoader_0 = require(l_Shell_0:FindFirstChild("ThumbnailLoader"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local l_HintActionView_0 = require(l_Shell_0:FindFirstChild("HintActionView"));
local l_AppState_0 = require(l_Shell_0:FindFirstChild("AppState"));
local l_LuaContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ContextBarContext")).LuaContext;
local v20 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v21 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v22 = require(l_Shell_0.Flags.GetFFlagXboxFixAvatarSelection);
local v23 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function(v24)
    local v25 = {
        TransitionTweens = nil
    };
    local v26 = false;
    local v27 = false;
    local v28 = {};
    local v29 = nil;
    local l_v24_0 = v24;
    local v31 = l_Utility_0.Create("Frame")({
        Name = "AvatarPane", 
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1, 
        Visible = false
    });
    local v32 = l_Utility_0.Create("Frame")({
        Name = "MyAvatarContainer", 
        Size = UDim2.new(0.38, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ClipsDescendants = true, 
        Parent = v31
    });
    local v33 = l_Utility_0.Create("TextLabel")({
        Name = "MyNameLabel", 
        Text = "", 
        Size = UDim2.new(1, 0, 0, 25), 
        Position = UDim2.new(0, 12, 0, 0), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v32
    });
    local v34 = l_Utility_0.Create("Frame")({
        Name = "ProfileImageContainer", 
        Size = UDim2.new(0.68, 0, 0.9, -v33.Size.Y.Offset), 
        Position = UDim2.new(0.16, 0, 0.05, v33.Size.Y.Offset), 
        BackgroundTransparency = 1, 
        Parent = v32
    });
    local v35 = l_Utility_0.Create("ImageLabel")({
        Name = "ProfileImage", 
        Size = UDim2.new(0, 780, 0, 780), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        BackgroundTransparency = 1, 
        ZIndex = 3, 
        Parent = v34
    });
    local v36 = l_Utility_0.Create("ImageLabel")({
        Name = "CrossfadeProfileImage", 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0, 0, 0, 0), 
        BackgroundTransparency = 1, 
        ImageTransparency = 1, 
        ZIndex = 3, 
        Parent = v35
    });
    local v37 = l_Utility_0.Create("ImageLabel")({
        Name = "CharacterGlowBase", 
        Size = UDim2.new(0, 1015, 0, 1002), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Images/CharacterGlow/CharacterGlowBase.png", 
        ImageTransparency = 0.2, 
        Parent = v34, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    local v38 = l_Utility_0.Create("ImageLabel")({
        Name = "CharacterGlowTop", 
        Size = UDim2.new(0, 1026, 0, 1009), 
        BackgroundTransparency = 1, 
        Image = "rbxasset://textures/ui/Shell/Images/CharacterGlow/CharacterGlowTop.png", 
        ImageTransparency = 0.2, 
        ZIndex = 2, 
        Parent = v34, 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.new(0.5, 0, 0.5, 0)
    });
    local function _()
        v35.Size = l_Utility_0.CalculateFill(v35, l_ThumbnailLoader_0.AvatarSizes.Size352x352);
        v35.AnchorPoint = Vector2.new(0.5, 0.5);
        v35.Position = UDim2.new(0.5, 0, 0.5, 0);
    end;
    local v40 = l_HintActionView_0(nil, "AvatarPaneSelectAction");
    v40:SetImage("rbxasset://textures/ui/Shell/ButtonIcons/XButton.png");
    v40:SetText(l_LocalizedStrings_0:LocalizedString("EquipWord"));
    v40:SetTransparency(1);
    v40:SetParent(l_v24_0.Parent);
    local function v43(v41, v42)
        v40:SetVisibleWithTween((not v41 or v42) and 1 or 0);
    end;
    local function _(v44)
        v40:BindAction(v44, Enum.KeyCode.ButtonX);
    end;
    local function v46()
        v40:UnbindAction();
        v40:SetTransparency(1);
    end;
    local v47 = l_Utility_0.Create("Frame")({
        Name = "SelectableAvatarsContainer", 
        Size = UDim2.new(0.6, 0, 1, 0), 
        Position = UDim2.new(0.4, 0, 0, 0), 
        BackgroundTransparency = 1, 
        Parent = v31
    });
    local v48 = l_Utility_0.Create("TextLabel")({
        Name = "NoCatalogStatusMessage", 
        Text = l_LocalizedStrings_0:LocalizedString("DefaultErrorPhrase"), 
        Size = UDim2.new(0.9, 0, 1, -125), 
        Position = UDim2.new(0.05, 0, 0, 0), 
        TextColor3 = l_GlobalSettings_0.GreyTextColor, 
        TextWrapped = true, 
        TextTransparency = l_GlobalSettings_0.FriendStatusTextTransparency, 
        Font = l_GlobalSettings_0.BoldFont, 
        FontSize = l_GlobalSettings_0.DescriptionSize, 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v47
    });
    local v49 = l_Utility_0.Create("TextLabel")({
        Name = "MyCollectionTitle", 
        Text = l_LocalizedStrings_0:LocalizedString("AvatarOutfitsTitle"), 
        Size = UDim2.new(1, 0, 0, 40), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        BackgroundTransparency = 1, 
        Visible = false, 
        Parent = v47
    });
    local v50 = l_ScrollingGrid_0();
    v50:SetSize(UDim2.new(1, 0, 1, -v49.Size.Y.Offset - 40));
    v50:SetScrollDirection(v50.Enum.ScrollDirection.Horizontal);
    v50:SetCellSize(Vector2.new(220, 220));
    v50:SetSpacing(Vector2.new(25, 25));
    v50:SetPosition(UDim2.new(0, 0, 0, v49.Size.Y.Offset));
    v50:SetRowColumnConstraint(1);
    local v51 = l_Utility_0.Create("TextLabel")({
        Name = "CatalogTitle", 
        Text = l_LocalizedStrings_0:LocalizedString("AvatarCatalogTitle"), 
        Size = UDim2.new(1, 0, 0, 40), 
        Position = UDim2.new(0, 0, 0, 0), 
        TextXAlignment = "Left", 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = l_GlobalSettings_0.SubHeaderSize, 
        BackgroundTransparency = 1, 
        Parent = v47
    });
    local v52 = l_ScrollingGrid_0();
    v52:SetSize(UDim2.new(1, 0, 1, -v51.Size.Y.Offset - 40));
    v52:SetScrollDirection(v52.Enum.ScrollDirection.Horizontal);
    v52:SetCellSize(Vector2.new(220, 220));
    v52:SetPosition(UDim2.new(0, 0, 0, 40));
    v52:SetSpacing(Vector2.new(25, 25));
    v52:SetRowColumnConstraint(2);
    v52:SetParent(v47);
    local function _()
        v50:SortItems(function(v53, v54)
            local v55 = (v53 and v28[v53]) and v28[v53]:GetPackageInfo();
            local v56 = (v54 and v28[v54]) and v28[v54]:GetPackageInfo();
            local v57 = v55 and v55:IsWearing();
            local v58 = v56 and v56:IsWearing();
            local v59 = v55 and v55:GetName();
            local v60 = v56 and v56:GetName();
            if not v57 then
                if not v58 then
                    if not v59 or not v60 then
                        return v55 ~= nil;
                    else
                        return v59 < v60;
                    end;
                else
                    return false;
                end;
            else
                return true;
            end;
        end);
    end;
    local function v62()
        if #v52.GridItems == 0 then
            v50:SetRowColumnConstraint(2);
            v51.Visible = false;
            v52.Visible = false;
            v52:SetParent(nil);
            return ;
        else
            v50:SetRowColumnConstraint(1);
            v51.Visible = true;
            v52.Visible = true;
            v52:SetParent(v47);
            return ;
        end;
    end;
    local function v71()
        v51.Position = UDim2.new(0, 0, 0, 320);
        v52:SetPosition(UDim2.new(0, 0, 0, 360));
        v52:SetRowColumnConstraint(1);
        v49.Visible = true;
        v50:SetParent(v47);
        v62();
        v50:SortItems(function(v63, v64)
            local v65 = (v63 and v28[v63]) and v28[v63]:GetPackageInfo();
            local v66 = (v64 and v28[v64]) and v28[v64]:GetPackageInfo();
            local v67 = v65 and v65:IsWearing();
            local v68 = v66 and v66:IsWearing();
            local v69 = v65 and v65:GetName();
            local v70 = v66 and v66:GetName();
            if not v67 then
                if not v68 then
                    if not v69 or not v70 then
                        return v65 ~= nil;
                    else
                        return v69 < v70;
                    end;
                else
                    return false;
                end;
            else
                return true;
            end;
        end);
    end;
    local v72 = nil;
    local v73 = 1;
    local function _(v74, v75, v76, v77)
        if v76 then
            v77 = v77 or 0.75;
            v73 = v73 + 1;
            local l_v73_0 = v73;
            local l_v77_0 = v77;
            spawn(function()
                local v80 = nil;
                if v72 then
                    v72:Cleanup();
                end;
                if type(v76) == "function" then
                    local v81 = l_LoadingWidget_0({
                        Parent = v74, 
                        ZIndex = 3
                    }, {
                        function()
                            v80 = v76();
                        end
                    });
                    v72 = v81;
                    v81:AwaitFinished();
                    v81:Cleanup();
                elseif not (not (type(v76) == "table") or not v76.Image) then
                    v80 = v76;
                end;
                if not ((not (l_v73_0 == v73) or not v80) or not v74) and v80.Image ~= v74.Image then
                    local v82 = false;
                    if v74.Image == "" then
                        v82 = v75.Image == "";
                    end;
                    if not v82 then
                        v75.Image = v74.Image;
                    else
                        l_v77_0 = 0;
                    end;
                    l_Utility_0.PropertyTweener(v75, "ImageTransparency", if not v82 then v74.ImageTransparency else 0, 1, l_v77_0, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 1, l_v77_0, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 1, l_v77_0, l_Utility_0.EaseInOutQuad, true);
                    v74.ImageTransparency = 1;
                    v74.Image = v80.Image;
                    l_Utility_0.PropertyTweener(v74, "ImageTransparency", v74.ImageTransparency, 0, v77, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 0.2, v77, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 0.2, v77, l_Utility_0.EaseInOutQuad, true);
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
    local function _(v84)
        v33.Text = l_AppState_0.store:getState().XboxUser.gamertag;
        local l_v35_0 = v35;
        local l_v36_0 = v36;
        local v87 = nil;
        if v84 then
            v87 = v87 or 0.75;
            v73 = v73 + 1;
            local l_v73_1 = v73;
            local l_v87_0 = v87;
            spawn(function()
                local v90 = nil;
                if v72 then
                    v72:Cleanup();
                end;
                if type(v84) == "function" then
                    local v91 = l_LoadingWidget_0({
                        Parent = l_v35_0, 
                        ZIndex = 3
                    }, {
                        function()
                            v90 = v84();
                        end
                    });
                    v72 = v91;
                    v91:AwaitFinished();
                    v91:Cleanup();
                elseif not (not (type(v84) == "table") or not v84.Image) then
                    v90 = v84;
                end;
                if not ((not (l_v73_1 == v73) or not v90) or not l_v35_0) and v90.Image ~= l_v35_0.Image then
                    local v92 = false;
                    if l_v35_0.Image == "" then
                        v92 = l_v36_0.Image == "";
                    end;
                    if not v92 then
                        l_v36_0.Image = l_v35_0.Image;
                    else
                        l_v87_0 = 0;
                    end;
                    l_Utility_0.PropertyTweener(l_v36_0, "ImageTransparency", if not v92 then l_v35_0.ImageTransparency else 0, 1, l_v87_0, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 1, l_v87_0, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 1, l_v87_0, l_Utility_0.EaseInOutQuad, true);
                    l_v35_0.ImageTransparency = 1;
                    l_v35_0.Image = v90.Image;
                    l_Utility_0.PropertyTweener(l_v35_0, "ImageTransparency", l_v35_0.ImageTransparency, 0, v87, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 0.2, v87, l_Utility_0.EaseInOutQuad, true);
                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 0.2, v87, l_Utility_0.EaseInOutQuad, true);
                end;
            end);
            return ;
        else
            return ;
        end;
    end;
    local function v97(v94, v95)
        if v95 then
            local v96 = v94 and v94:GetGuiObject();
            if not (not v96 or not v52:ContainsItem(v96)) then
                v52:RemoveItem(v96);
                v50:AddItem(v96);
                v71();
                if v26 then
                    l_GuiService_0.SelectedCoreObject = v96;
                end;
            end;
        end;
    end;
    local v98 = {};
    local function v102(v99)
        local v100 = v99 and v99:GetPackageInfo();
        if not (not (not (not v100 or v100:IsOwned()) and v100.OwnershipChanged ~= nil) or v98[v99]) then
            v98[v99] = v100.OwnershipChanged:connect(function(v101)
                v97(v99, v101);
            end);
        end;
    end;
    local function _(v103)
        if v98[v103] then
            v98[v103]:disconnect();
            v98[v103] = nil;
        end;
    end;
    local function v115()
        local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
        if not v28[l_SelectedCoreObject_0] then
            v43(false, false);
        else
            local l_PackageInfo_0 = v28[l_SelectedCoreObject_0]:GetPackageInfo();
            if l_PackageInfo_0 then
                v43(l_PackageInfo_0:IsOwned(), l_PackageInfo_0:IsWearing());
            end;
        end;
        v50:SortItems(function(v107, v108)
            local v109 = (v107 and v28[v107]) and v28[v107]:GetPackageInfo();
            local v110 = (v108 and v28[v108]) and v28[v108]:GetPackageInfo();
            local v111 = v109 and v109:IsWearing();
            local v112 = v110 and v110:IsWearing();
            local v113 = v109 and v109:GetName();
            local v114 = v110 and v110:GetName();
            if not v111 then
                if not v112 then
                    if not v113 or not v114 then
                        return v109 ~= nil;
                    else
                        return v113 < v114;
                    end;
                else
                    return false;
                end;
            else
                return true;
            end;
        end);
    end;
    local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
    local function _()
        local l_SelectedCoreObject_2 = l_GuiService_0.SelectedCoreObject;
        if v28[l_SelectedCoreObject_1] then
            v28[l_SelectedCoreObject_1]:RemoveFocus();
        end;
        if v28[l_SelectedCoreObject_2] then
            v28[l_SelectedCoreObject_2]:Focus();
            l_SelectedCoreObject_1 = l_SelectedCoreObject_2;
        end;
        v115();
    end;
    v25.GetDefaultSelectableObject = function(_)
        if not v50:GetFirstVisibleItem() then
            if not v52:GetFirstVisibleItem() then
                if not v50.GridItems[1] then
                    if not v52.GridItems[1] then
                        return ;
                    else
                        return v52.GridItems[1];
                    end;
                else
                    return v50.GridItems[1];
                end;
            else
                return v52:GetFirstVisibleItem();
            end;
        else
            return v50:GetFirstVisibleItem();
        end;
    end;
    local v120 = nil;
    local v121 = {};
    local v122 = nil;
    local function v125()
        for _, v124 in pairs(v121) do
            v124:disconnect();
        end;
        v121 = {};
    end;
    local function v147()
        if not (not v120 or not v121) then
            table.insert(v121, v120.OnDifferentWearing:connect(function(_)
                v115();
            end));
            table.insert(v121, v120.OnDifferentOwned:connect(function(_, _)
                v115();
            end));
            table.insert(v121, v120.OnProfileImageUpdateEnd:connect(function(v129)
                v33.Text = l_AppState_0.store:getState().XboxUser.gamertag;
                local l_v35_1 = v35;
                local l_v36_1 = v36;
                local v132 = nil;
                if v129 then
                    v132 = v132 or 0.75;
                    v73 = v73 + 1;
                    local l_v73_2 = v73;
                    local l_v132_0 = v132;
                    spawn(function()
                        local v135 = nil;
                        if v72 then
                            v72:Cleanup();
                        end;
                        if type(v129) == "function" then
                            local v136 = l_LoadingWidget_0({
                                Parent = l_v35_1, 
                                ZIndex = 3
                            }, {
                                function()
                                    v135 = v129();
                                end
                            });
                            v72 = v136;
                            v136:AwaitFinished();
                            v136:Cleanup();
                        elseif not (not (type(v129) == "table") or not v129.Image) then
                            v135 = v129;
                        end;
                        if not ((not (l_v73_2 == v73) or not v135) or not l_v35_1) and v135.Image ~= l_v35_1.Image then
                            local v137 = false;
                            if l_v35_1.Image == "" then
                                v137 = l_v36_1.Image == "";
                            end;
                            if not v137 then
                                l_v36_1.Image = l_v35_1.Image;
                            else
                                l_v132_0 = 0;
                            end;
                            l_Utility_0.PropertyTweener(l_v36_1, "ImageTransparency", if not v137 then l_v35_1.ImageTransparency else 0, 1, l_v132_0, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 1, l_v132_0, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 1, l_v132_0, l_Utility_0.EaseInOutQuad, true);
                            l_v35_1.ImageTransparency = 1;
                            l_v35_1.Image = v135.Image;
                            l_Utility_0.PropertyTweener(l_v35_1, "ImageTransparency", l_v35_1.ImageTransparency, 0, v132, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 0.2, v132, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 0.2, v132, l_Utility_0.EaseInOutQuad, true);
                        end;
                    end);
                    return ;
                else
                    return ;
                end;
            end));
            table.insert(v121, v120.OnProfileImageUpdateBegin:connect(function()
                local function v138()
                    return v120.OnProfileImageUpdateEnd.wait();
                end;
                v33.Text = l_AppState_0.store:getState().XboxUser.gamertag;
                local l_v35_2 = v35;
                local l_v36_2 = v36;
                local v141 = nil;
                if v138 then
                    v141 = v141 or 0.75;
                    v73 = v73 + 1;
                    local l_v73_3 = v73;
                    local l_v141_0 = v141;
                    spawn(function()
                        local v144 = nil;
                        if v72 then
                            v72:Cleanup();
                        end;
                        if type(v138) == "function" then
                            local v145 = l_LoadingWidget_0({
                                Parent = l_v35_2, 
                                ZIndex = 3
                            }, {
                                function()
                                    v144 = v138();
                                end
                            });
                            v72 = v145;
                            v145:AwaitFinished();
                            v145:Cleanup();
                        elseif not (not (type(v138) == "table") or not v138.Image) then
                            v144 = v138;
                        end;
                        if not ((not (l_v73_3 == v73) or not v144) or not l_v35_2) and v144.Image ~= l_v35_2.Image then
                            local v146 = false;
                            if l_v35_2.Image == "" then
                                v146 = l_v36_2.Image == "";
                            end;
                            if not v146 then
                                l_v36_2.Image = l_v35_2.Image;
                            else
                                l_v141_0 = 0;
                            end;
                            l_Utility_0.PropertyTweener(l_v36_2, "ImageTransparency", if not v146 then l_v35_2.ImageTransparency else 0, 1, l_v141_0, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 1, l_v141_0, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 1, l_v141_0, l_Utility_0.EaseInOutQuad, true);
                            l_v35_2.ImageTransparency = 1;
                            l_v35_2.Image = v144.Image;
                            l_Utility_0.PropertyTweener(l_v35_2, "ImageTransparency", l_v35_2.ImageTransparency, 0, v141, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 0.2, v141, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 0.2, v141, l_Utility_0.EaseInOutQuad, true);
                        end;
                    end);
                    return ;
                else
                    return ;
                end;
            end));
        end;
    end;
    local function v180()
        local function v150()
            v52:RemoveAllItems();
            v50:RemoveAllItems();
            for v148, _ in pairs(v28) do
                v28[v148] = nil;
            end;
            v28 = {};
        end;
        local function v155(v151)
            v150();
            if v151 then
                for _, v153 in pairs(v151) do
                    local v154 = l_AvatarTile_0(v153);
                    v28[v154:GetGuiObject()] = v154;
                    if not v153:IsOwned() then
                        v52:AddItem(v154:GetGuiObject());
                        v102(v154);
                    else
                        v50:AddItem(v154:GetGuiObject());
                        v71();
                    end;
                    if v27 then
                        v62();
                        v154:Show();
                    end;
                end;
            end;
        end;
        if not v122 then
            if not l_PackageData_0:HasCachedData() then
                v47.Visible = false;
                local l_Size_0 = v47.Size;
                v122 = l_LoadingWidget_0({
                    Parent = v31, 
                    Position = v47.Position + UDim2.new(l_Size_0.X.Scale / 2, l_Size_0.X.Offset / 2, l_Size_0.Y.Scale / 2, l_Size_0.Y.Offset / 2)
                }, {
                    function()
                        v120 = l_PackageData_0:GetCachedData();
                        if not (not v120 or not v120.Packages) then
                            v155(v120.Packages.Data);
                        end;
                    end
                });
                spawn(function()
                    v48.Visible = false;
                    local function v157()
                        if v122 then
                            v122:AwaitFinished();
                        end;
                        if not v120 or not v120.ProfileImage then
                            return ;
                        else
                            return v120.ProfileImage.Data;
                        end;
                    end;
                    v33.Text = l_AppState_0.store:getState().XboxUser.gamertag;
                    local l_v35_3 = v35;
                    local l_v36_3 = v36;
                    local v160 = nil;
                    if v157 then
                        v160 = v160 or 0.75;
                        v73 = v73 + 1;
                        local l_v73_4 = v73;
                        local l_v160_0 = v160;
                        do
                            local l_v160_1, l_l_v160_0_0 = v160, l_v160_0;
                            spawn(function()
                                local v165 = nil;
                                if v72 then
                                    v72:Cleanup();
                                end;
                                if type(v157) == "function" then
                                    local v166 = l_LoadingWidget_0({
                                        Parent = l_v35_3, 
                                        ZIndex = 3
                                    }, {
                                        function()
                                            v165 = v157();
                                        end
                                    });
                                    v72 = v166;
                                    v166:AwaitFinished();
                                    v166:Cleanup();
                                elseif not (not (type(v157) == "table") or not v157.Image) then
                                    v165 = v157;
                                end;
                                if not ((not (l_v73_4 == v73) or not v165) or not l_v35_3) and v165.Image ~= l_v35_3.Image then
                                    local v167 = false;
                                    if l_v35_3.Image == "" then
                                        v167 = l_v36_3.Image == "";
                                    end;
                                    if not v167 then
                                        l_v36_3.Image = l_v35_3.Image;
                                    else
                                        l_l_v160_0_0 = 0;
                                    end;
                                    l_Utility_0.PropertyTweener(l_v36_3, "ImageTransparency", if not v167 then l_v35_3.ImageTransparency else 0, 1, l_l_v160_0_0, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 1, l_l_v160_0_0, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 1, l_l_v160_0_0, l_Utility_0.EaseInOutQuad, true);
                                    l_v35_3.ImageTransparency = 1;
                                    l_v35_3.Image = v165.Image;
                                    l_Utility_0.PropertyTweener(l_v35_3, "ImageTransparency", l_v35_3.ImageTransparency, 0, l_v160_1, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 0.2, l_v160_1, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 0.2, l_v160_1, l_Utility_0.EaseInOutQuad, true);
                                end;
                            end);
                        end;
                    else
                        --[[ close >= 3 ]]
                    end;
                    v122:AwaitFinished();
                    v122:Cleanup();
                    v122 = nil;
                    v47.Visible = true;
                    v125();
                    if not v120 then
                        v48.Visible = true;
                    end;
                    if v27 then
                        v147();
                    end;
                    if not (not v26 or not v27) and l_GuiService_0.SelectedCoreObject == nil then
                        l_GuiService_0.SelectedCoreObject = v25:GetDefaultSelectableObject();
                    end;
                    if not (v25.TransitionTweens ~= nil) or #v25.TransitionTweens == 0 then
                        v25.TransitionTweens = l_ScreenManager_0:FadeInSitu(v47);
                    end;
                end);
            else
                local v168 = not not v120 and v120.Version or nil;
                v120 = l_PackageData_0:GetCachedData();
                if not v168 or v168 ~= v120.Version then
                    v47.Visible = false;
                    local l_Data_0 = v120.ProfileImage.Data;
                    v33.Text = l_AppState_0.store:getState().XboxUser.gamertag;
                    local l_v35_4 = v35;
                    local l_v36_4 = v36;
                    local v172 = nil;
                    if l_Data_0 then
                        v172 = v172 or 0.75;
                        v73 = v73 + 1;
                        local l_v73_5 = v73;
                        local l_v172_0 = v172;
                        do
                            local l_v172_1, l_l_v172_0_0 = v172, l_v172_0;
                            spawn(function()
                                local v177 = nil;
                                if v72 then
                                    v72:Cleanup();
                                end;
                                if type(l_Data_0) == "function" then
                                    local v178 = l_LoadingWidget_0({
                                        Parent = l_v35_4, 
                                        ZIndex = 3
                                    }, {
                                        function()
                                            v177 = l_Data_0();
                                        end
                                    });
                                    v72 = v178;
                                    v178:AwaitFinished();
                                    v178:Cleanup();
                                elseif not (not (type(l_Data_0) == "table") or not l_Data_0.Image) then
                                    v177 = l_Data_0;
                                end;
                                if not ((not (l_v73_5 == v73) or not v177) or not l_v35_4) and v177.Image ~= l_v35_4.Image then
                                    local v179 = false;
                                    if l_v35_4.Image == "" then
                                        v179 = l_v36_4.Image == "";
                                    end;
                                    if not v179 then
                                        l_v36_4.Image = l_v35_4.Image;
                                    else
                                        l_l_v172_0_0 = 0;
                                    end;
                                    l_Utility_0.PropertyTweener(l_v36_4, "ImageTransparency", if not v179 then l_v35_4.ImageTransparency else 0, 1, l_l_v172_0_0, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 1, l_l_v172_0_0, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 1, l_l_v172_0_0, l_Utility_0.EaseInOutQuad, true);
                                    l_v35_4.ImageTransparency = 1;
                                    l_v35_4.Image = v177.Image;
                                    l_Utility_0.PropertyTweener(l_v35_4, "ImageTransparency", l_v35_4.ImageTransparency, 0, l_v172_1, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 0.2, l_v172_1, l_Utility_0.EaseInOutQuad, true);
                                    l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 0.2, l_v172_1, l_Utility_0.EaseInOutQuad, true);
                                end;
                            end);
                        end;
                    else
                        --[[ close >= 6 ]]
                    end;
                    v155(v120.Packages.Data);
                    v47.Visible = true;
                    v125();
                    v147();
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v180();
    v25.GetName = function(_)
        return l_LocalizedStrings_0:LocalizedString("AvatarWord");
    end;
    v25.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("AvatarPaneId")
        };
    end;
    v25.IsFocused = function(_)
        return v26;
    end;
    local v184 = false;
    v25.OnSelectAction = function(_)
        if not v184 then
            v184 = true;
            local l_SelectedCoreObject_3 = l_GuiService_0.SelectedCoreObject;
            if not ((not l_SelectedCoreObject_3 or not v28[l_SelectedCoreObject_3]) or not v28[l_SelectedCoreObject_3]:Select()) then
                l_SoundManager_0:Play("ButtonPress");
            end;
            v184 = false;
            return ;
        else
            return ;
        end;
    end;
    v25.OpenEquippedPackage = function(_)
        if not (not v27 or not v26) then
            for _, v189 in pairs(v28) do
                local l_v189_PackageInfo_0 = v189:GetPackageInfo();
                if not (not l_v189_PackageInfo_0 or not l_v189_PackageInfo_0:IsWearing()) then
                    v189:OnClick();
                end;
            end;
        end;
    end;
    local v191 = false;
    local v192 = nil;
    local function v196(_, v194, _)
        if v194 == Enum.UserInputState.Begin then
            v191 = true;
            v192 = l_GuiService_0.SelectedCoreObject;
            return ;
        else
            if not (not (v194 == Enum.UserInputState.End) or not v191) then
                if v192 and v192 == l_GuiService_0.SelectedCoreObject then
                    v25:OnSelectAction();
                end;
                v191 = false;
                v192 = nil;
            end;
            return ;
        end;
    end;
    if v20.isUserEnrolled() then
        v46 = function()
            l_LuaContext_0:UnbindAction("X");
        end;
        v43 = function(v197, v198)
            if not v197 or v198 then
                v46();
                return ;
            else
                l_LuaContext_0:BindAction("X", Enum.KeyCode.ButtonX, l_LocalizedStrings_0:LocalizedString("EquipWord"), v196);
                return ;
            end;
        end;
    end;
    local v199 = nil;
    v25.Show = function(v200)
        v27 = true;
        l_Utility_0.DisconnectEvent(v199);
        v199 = v34:GetPropertyChangedSignal("AbsoluteSize"):connect(function()
            v35.Size = l_Utility_0.CalculateFill(v35, l_ThumbnailLoader_0.AvatarSizes.Size352x352);
            v35.AnchorPoint = Vector2.new(0.5, 0.5);
            v35.Position = UDim2.new(0.5, 0, 0.5, 0);
        end);
        v35.Size = l_Utility_0.CalculateFill(v35, l_ThumbnailLoader_0.AvatarSizes.Size352x352);
        v35.AnchorPoint = Vector2.new(0.5, 0.5);
        v35.Position = UDim2.new(0.5, 0, 0.5, 0);
        local v201 = tick();
        l_RunService_0:BindToRenderStep("UpdateAvatarGlow", Enum.RenderPriority.Camera.Value, function()
            local v202 = tick();
            local v203 = v202 - v201;
            v37.Rotation = v37.Rotation + (v203 * 2) * 6;
            v38.Rotation = v38.Rotation + (v203 * -0.5) * 6;
            v201 = v202;
        end);
        if v120 then
            v147();
            local l_Data_1 = v120.ProfileImage.Data;
            v33.Text = l_AppState_0.store:getState().XboxUser.gamertag;
            local l_v35_5 = v35;
            local l_v36_5 = v36;
            local v207 = nil;
            if l_Data_1 then
                v207 = v207 or 0.75;
                v73 = v73 + 1;
                local l_v73_6 = v73;
                local l_v207_0 = v207;
                local l_l_v73_6_0 = l_v73_6 --[[ copy: 6 -> 8 ]];
                do
                    local l_v207_1, l_l_v207_0_0 = v207, l_v207_0;
                    spawn(function()
                        local v213 = nil;
                        if v72 then
                            v72:Cleanup();
                        end;
                        if type(l_Data_1) == "function" then
                            local v214 = l_LoadingWidget_0({
                                Parent = l_v35_5, 
                                ZIndex = 3
                            }, {
                                function()
                                    v213 = l_Data_1();
                                end
                            });
                            v72 = v214;
                            v214:AwaitFinished();
                            v214:Cleanup();
                        elseif not (not (type(l_Data_1) == "table") or not l_Data_1.Image) then
                            v213 = l_Data_1;
                        end;
                        if not ((not (l_l_v73_6_0 == v73) or not v213) or not l_v35_5) and v213.Image ~= l_v35_5.Image then
                            local v215 = false;
                            if l_v35_5.Image == "" then
                                v215 = l_v36_5.Image == "";
                            end;
                            if not v215 then
                                l_v36_5.Image = l_v35_5.Image;
                            else
                                l_l_v207_0_0 = 0;
                            end;
                            l_Utility_0.PropertyTweener(l_v36_5, "ImageTransparency", if not v215 then l_v35_5.ImageTransparency else 0, 1, l_l_v207_0_0, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 1, l_l_v207_0_0, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 1, l_l_v207_0_0, l_Utility_0.EaseInOutQuad, true);
                            l_v35_5.ImageTransparency = 1;
                            l_v35_5.Image = v213.Image;
                            l_Utility_0.PropertyTweener(l_v35_5, "ImageTransparency", l_v35_5.ImageTransparency, 0, l_v207_1, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v37, "ImageTransparency", v37.ImageTransparency, 0.2, l_v207_1, l_Utility_0.EaseInOutQuad, true);
                            l_Utility_0.PropertyTweener(v38, "ImageTransparency", v38.ImageTransparency, 0.2, l_v207_1, l_Utility_0.EaseInOutQuad, true);
                        end;
                    end);
                end;
            else
                --[[ close >= 5 ]]
            end;
        end;
        v180();
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.HardwareBundleGranted, "AvatarPaneRefreshForBundle");
        l_EventHub_0:addEventListener(l_EventHub_0.Notifications.HardwareBundleGranted, "AvatarPaneRefreshForBundle", function(v216)
            if not v216 then
                l_ScreenManager_0:OpenScreen(v5({
                    Title = "Unable to apply bundle code", 
                    Msg = "We were unable to apply your bundle code to your Roblox account. Please wait a bit or try relaunching the application."
                }), false);
                return ;
            else
                v180();
                return ;
            end;
        end);
        for _, v218 in pairs(v28) do
            v218:Show();
            v102(v218);
            local v219 = v218 and v218:GetPackageInfo();
            if v219 then
                v97(v218, v219:IsOwned());
            end;
        end;
        if not v20.isUserEnrolled() then
            v40:BindAction(v196, Enum.KeyCode.ButtonX);
        end;
        v200.TransitionTweens = l_ScreenManager_0:DefaultFadeIn(v31);
        v50:SortItems(function(v220, v221)
            local v222 = (v220 and v28[v220]) and v28[v220]:GetPackageInfo();
            local v223 = (v221 and v28[v221]) and v28[v221]:GetPackageInfo();
            local v224 = v222 and v222:IsWearing();
            local v225 = v223 and v223:IsWearing();
            local v226 = v222 and v222:GetName();
            local v227 = v223 and v223:GetName();
            if not v224 then
                if not v225 then
                    if not v226 or not v227 then
                        return v222 ~= nil;
                    else
                        return v226 < v227;
                    end;
                else
                    return false;
                end;
            else
                return true;
            end;
        end);
        v31.Parent = l_v24_0;
        v31.Visible = true;
        l_ScreenManager_0:PlayDefaultOpenSound();
        if v21() > 0 then
            if not v23() then
                l_Analytics_0.reportNavigationLoaded(v25:GetName());
            else
                l_Analytics_0.reportNavigationLoaded(l_Analytics_0.TabNames("AvatarId"));
            end;
        end;
    end;
    v25.GetId = function(_)
        return l_Analytics_0.TabNames("AvatarId");
    end;
    v25.Hide = function(v229)
        v27 = false;
        v31.Visible = false;
        v125();
        v199 = l_Utility_0.DisconnectEvent(v199);
        l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.HardwareBundleGranted, "AvatarPaneRefreshForBundle");
        l_RunService_0:UnbindFromRenderStep("UpdateAvatarGlow");
        v46();
        for _, v231 in pairs(v28) do
            v231:Hide();
            if v98[v231] then
                v98[v231]:disconnect();
                v98[v231] = nil;
            end;
        end;
        l_ScreenManager_0:DefaultCancelFade(v229.TransitionTweens);
        v229.TransitionTweens = nil;
        l_SelectedCoreObject_1 = nil;
        v229.SavedSelectObject = nil;
    end;
    v25.Focus = function(v232)
        if (not v22() or not v20.isUserEnrolled()) or not v26 then
            v26 = true;
            l_Utility_0.DisconnectEvent(v29);
            v29 = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):connect(function()
                local l_SelectedCoreObject_4 = l_GuiService_0.SelectedCoreObject;
                if v28[l_SelectedCoreObject_1] then
                    v28[l_SelectedCoreObject_1]:RemoveFocus();
                end;
                if v28[l_SelectedCoreObject_4] then
                    v28[l_SelectedCoreObject_4]:Focus();
                    l_SelectedCoreObject_1 = l_SelectedCoreObject_4;
                end;
                v115();
            end);
            if not v232.SavedSelectObject or not v232.SavedSelectObject:IsDescendantOf(v31) then
                local l_v232_DefaultSelectableObject_0 = v232:GetDefaultSelectableObject();
                if l_v232_DefaultSelectableObject_0 then
                    l_GuiService_0.SelectedCoreObject = l_v232_DefaultSelectableObject_0;
                end;
                return ;
            else
                l_GuiService_0.SelectedCoreObject = v232.SavedSelectObject;
                return ;
            end;
        else
            return ;
        end;
    end;
    v25.RemoveFocus = function(v235)
        v26 = false;
        if not (not v28 or not v28[l_SelectedCoreObject_1]) then
            v28[l_SelectedCoreObject_1]:RemoveFocus();
        end;
        v29 = l_Utility_0.DisconnectEvent(v29);
        local l_SelectedCoreObject_5 = l_GuiService_0.SelectedCoreObject;
        if v27 then
            if not l_SelectedCoreObject_5 or not l_SelectedCoreObject_5:IsDescendantOf(v31) then
                v235.SavedSelectObject = l_SelectedCoreObject_1;
            else
                v235.SavedSelectObject = l_GuiService_0.SelectedCoreObject;
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end;
        local l_SelectedCoreObject_6 = l_GuiService_0.SelectedCoreObject;
        if v28[l_SelectedCoreObject_1] then
            v28[l_SelectedCoreObject_1]:RemoveFocus();
        end;
        if v28[l_SelectedCoreObject_6] then
            v28[l_SelectedCoreObject_6]:Focus();
            l_SelectedCoreObject_1 = l_SelectedCoreObject_6;
        end;
        v115();
    end;
    v25.SetPosition = function(_, v239)
        v31.Position = v239;
    end;
    v25.SetParent = function(_, v241)
        l_v24_0 = v241;
        v31.Parent = v241;
    end;
    return v25;
end;
