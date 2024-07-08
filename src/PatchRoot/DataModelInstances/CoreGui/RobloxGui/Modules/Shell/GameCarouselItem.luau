local l_CoreGui_0 = game:GetService("CoreGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_LocalizedStrings_0 = require(l_Shell_0:FindFirstChild("LocalizedStrings"));
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_LoadingWidget_0 = require(l_Shell_0:FindFirstChild("LoadingWidget"));
local l_CarouselView_0 = require(l_Shell_0:FindFirstChild("CarouselView"));
local l_CarouselController_0 = require(l_Shell_0:FindFirstChild("CarouselController"));
local l_EventHub_0 = require(l_Shell_0:FindFirstChild("EventHub"));
local l_LuaContext_0 = require(l_Shell_0.XboxPrimaryNav:FindFirstChild("ContextBarContext")).LuaContext;
local v11 = require(l_Shell_0.Experiment.XboxPrimaryNavIXPTest);
local v12 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
return function(v13, v14, v15, v16, v17)
    local v18 = {};
    local v19 = v14 .. " ImageButton";
    local v20 = nil;
    local v21 = l_CarouselView_0();
    local v22 = true;
    local v23 = false;
    local v24 = false;
    local v25 = nil;
    local v26 = false;
    local v27 = l_Utility_0.Create("ImageLabel")({
        Name = "NoSelectionObject", 
        BackgroundTransparency = 1
    });
    local v28 = l_Utility_0.Create("ImageButton")({
        Name = v19, 
        Size = v13, 
        Position = UDim2.new(0, 0, 0, 0), 
        BorderSizePixel = 0, 
        BackgroundTransparency = 1, 
        ClipsDescendants = false, 
        AutoButtonColor = false, 
        SelectionImageObject = v27, 
        Selectable = false
    });
    local v29 = l_Utility_0.Create("ImageLabel")({
        Name = v14 .. " SelectionHolder", 
        BackgroundTransparency = 1, 
        Size = UDim2.new(0, 400, 1, 0), 
        Position = UDim2.new(0, 50, 0, 50), 
        SelectionImageObject = v27, 
        Selectable = true, 
        Parent = v28
    });
    v29.NextSelectionLeft = v29;
    v29.NextSelectionRight = v29;
    local v30 = l_Utility_0.Create("TextLabel")({
        Name = "NameLabel", 
        Text = l_LocalizedStrings_0:LocalizedString("LoadingWord"), 
        Size = UDim2.new(0, 0, 0, 0), 
        Position = UDim2.new(0, 112, 0, 22), 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextColor3 = l_GlobalSettings_0.WhiteTextColor, 
        Font = l_GlobalSettings_0.RegularFont, 
        FontSize = Enum.FontSize.Size36, 
        BackgroundTransparency = 1, 
        Selectable = false, 
        Parent = v28
    });
    local function v36(v31, v32, v33)
        local v34 = 0;
        if v25 then
            v34 = l_Utility_0.Clamp(0, 1, v25:GetTransparency());
            v25:Cleanup();
        end;
        v30.Text = l_LocalizedStrings_0:LocalizedString("LoadingWord");
        v29.Selectable = true;
        spawn(function()
            local v35 = l_LoadingWidget_0({
                Parent = v33, 
                Position = UDim2.new(0.5, 110, 0.5, 50), 
                ImageTransparency = v34
            }, {
                function()
                    v31:InitializeAsync(v15());
                    v31:Connect();
                    v31.NewItemSelected:connect(v16);
                    if (v18 and v20 == v31) and v21 == v32 then
                        v22 = v31:HasResults();
                        v17(v18);
                        if not v22 then
                            v29.Selectable = true;
                            v30.Text = "";
                            return ;
                        else
                            v29.Selectable = false;
                            v30.Text = v14;
                            if v18:IsSelected() then
                                v18:RemoveFocus();
                                v18:Focus();
                                return ;
                            end;
                        end;
                    elseif v32 then
                        v32:SetParent(nil);
                    end;
                end
            });
            if v25 then
                v25:SetParent(nil);
            end;
            v25 = v35;
            v35:AwaitFinished();
            v35:Cleanup();
        end);
    end;
    v18.Init = function(_, v38)
        v21:SetTransparency(not not v38 and v38 or 0);
        v21:SetSize(UDim2.new(0, 1700, 0, 232));
        v21:SetPosition(UDim2.new(0, 110, 0, 50));
        v21:SetPadding(20);
        v21:SetItemSizePercentOfContainer(0.86);
        v21:SetSelectionImageObject(l_Utility_0.Create("ImageLabel")({
            BackgroundTransparency = 1
        }));
        v21:SetParent(v28);
        if v20 then
            v20:Disconnect();
        end;
        if not v20 then
            v20 = l_CarouselController_0(v21, true);
        else
            local l_v20_IndexData_0, v40, v41 = v20:GetIndexData();
            v20 = l_CarouselController_0(v21, true, l_v20_IndexData_0, v40, v41);
        end;
        v20:SetLoadBuffer(15);
        v36(v20, v21, v28);
    end;
    v18.Refresh = function(_)
        if v21 then
            if v18:IsSelected() then
                v29.Selectable = true;
                l_Utility_0.SetSelectedCoreObject(v29);
                v16(nil);
            end;
            v21:RemoveFocus();
            v21:RemoveAllItems();
            v21:SetParent(nil);
            local l_v21_Transparency_0 = v21:GetTransparency();
            v21 = l_CarouselView_0();
            v18:Init(l_v21_Transparency_0);
        end;
    end;
    v18.HasResults = function(_)
        return v22;
    end;
    v18.GetContainer = function(_)
        return v28;
    end;
    v18.ContainsItem = function(_, v47)
        return v21:ContainsItem(v47);
    end;
    v18.GetCarouselView = function(_)
        return v21;
    end;
    v18.GetSortName = function(_)
        return v14;
    end;
    v18.GetNameText = function(_)
        return v30.Text;
    end;
    v18.SetNameText = function(_, v52)
        v30.Text = v52;
    end;
    local v53 = l_Utility_0.Create("ImageLabel")({
        Name = "LockOverlay", 
        Size = UDim2.new(0, 400, 1, 0), 
        Position = UDim2.new(0, 50, 0, 50), 
        BackgroundTransparency = 1, 
        Selectable = true, 
        SelectionImageObject = l_Utility_0.Create("ImageLabel")({
            BackgroundTransparency = 1
        }), 
        ZIndex = 3
    });
    v53.NextSelectionRight = v53;
    v53.NextSelectionLeft = v53;
    v18.Lock = function(_)
        v24 = true;
        v53.Parent = v28;
        if v18:IsSelected() then
            v18:RemoveFocus();
            v18:Focus();
        end;
        v21:SetSelectable(false);
        v21:SetClipsDescendants(true);
    end;
    v18.Unlock = function(_)
        v24 = false;
        v21:SetSelectable(true);
        v21:SetClipsDescendants(false);
        if v18:IsSelected() then
            v18:RemoveFocus();
            v18:Focus();
        end;
        v53.Parent = nil;
    end;
    v18.IsLocked = function(_)
        return v24;
    end;
    v18.SetLockInPUP = function(_, v58)
        v23 = v58;
    end;
    v18.GetLockInPUP = function(_)
        return v23;
    end;
    v18.Focus = function(_)
        if not v26 then
            v26 = true;
            if v18 then
                if not v24 then
                    v21:Focus();
                    if v29.Selectable or not v21:GetAvailableItem() then
                        l_Utility_0.SetSelectedCoreObject(v29);
                        v16(nil);
                    else
                        l_Utility_0.SetSelectedCoreObject(v21:GetAvailableItem());
                        return ;
                    end;
                else
                    if v20 then
                        v16(not not v20:GetFrontGameData() and v20:GetFrontGameData().placeId or nil, true);
                    end;
                    l_Utility_0.SetSelectedCoreObject(v53);
                    return ;
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v18.RemoveFocus = function(_)
        if v26 then
            v21:RemoveFocus();
            v26 = false;
            return ;
        else
            return ;
        end;
    end;
    if v11.isUserEnrolled() then
        local v62 = false;
        do
            local l_v62_0 = v62;
            local function v67(_, v65, _)
                if v65 == Enum.UserInputState.Begin then
                    l_v62_0 = true;
                    return ;
                else
                    if not (not (v65 == Enum.UserInputState.End) or not l_v62_0) then
                        if v12() > 0 then
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameGenre, v14, v15(), "ButtonX");
                            return ;
                        else
                            l_EventHub_0:dispatchEvent(l_EventHub_0.Notifications.OpenGameGenre, v14, v15());
                        end;
                    end;
                    return ;
                end;
            end;
            local l_v67_0 = v67 --[[ copy: 21 -> 23 ]];
            local function v69()
                if not v26 then
                    v26 = true;
                    l_LuaContext_0:UnbindAction("X");
                    if v18 then
                        if not v24 then
                            spawn(function()
                                l_LuaContext_0:BindAction("X", Enum.KeyCode.ButtonX, l_LocalizedStrings_0:LocStringUA("Feature.GamePage.ActionSeeAll"), l_v67_0);
                            end);
                            v21:Focus();
                            if v29.Selectable or not v21:GetAvailableItem() then
                                l_Utility_0.SetSelectedCoreObject(v29);
                                v16(nil);
                                l_LuaContext_0:UnbindAction("X");
                            else
                                l_Utility_0.SetSelectedCoreObject(v21:GetAvailableItem());
                                return ;
                            end;
                        else
                            if v20 then
                                v16(not not v20:GetFrontGameData() and v20:GetFrontGameData().placeId or nil, true);
                            end;
                            l_Utility_0.SetSelectedCoreObject(v53);
                            return ;
                        end;
                    end;
                    return ;
                else
                    return ;
                end;
            end;
            local l_v69_0 = v69 --[[ copy: 22 -> 24 ]];
            v18.Focus = function(_)
                l_v69_0();
            end;
            v18.RemoveFocus = function(_)
                if v26 then
                    v21:RemoveFocus();
                    l_LuaContext_0:UnbindAction("X");
                    v26 = false;
                    return ;
                else
                    return ;
                end;
            end;
            l_EventHub_0:removeEventListener(l_EventHub_0.Notifications.SetGamesHints, "GamesPaneSetGamesHints" .. v14);
            l_EventHub_0:addEventListener(l_EventHub_0.Notifications.SetGamesHints, "GamesPaneSetGamesHints" .. v14, function()
                if not (not (((l_GuiService_0.SelectedCoreObject and l_GuiService_0.SelectedCoreObject.Parent) and l_GuiService_0.SelectedCoreObject.Parent.Parent).Name == v19) or v18:IsLocked()) then
                    l_LuaContext_0:UnbindAction("X");
                    l_LuaContext_0:BindAction("X", Enum.KeyCode.ButtonX, l_LocalizedStrings_0:LocStringUA("Feature.GamePage.ActionSeeAll"), l_v67_0);
                end;
            end);
        end;
    end;
    local v73 = 0;
    local v74 = {};
    local function v78(v75, v76, v77)
        if not v77 and v75 == v73 then
            return ;
        else
            if not v76 then
                v76 = 0.2;
            else
                v73 = l_Utility_0.Clamp(0, 1, v73);
                if not v77 and v75 == v73 then
                    return ;
                end;
            end;
            l_Utility_0.CancelTweens(v74);
            table.insert(v74, l_Utility_0.PropertyTweener(v30, "TextTransparency", v73, v75, v76, l_Utility_0.EaseOutQuad, true));
            v73 = v75;
            return ;
        end;
    end;
    v18.SetTransparency = function(_, v80, v81, v82, v83)
        v78(v81, v82, v83);
        v21:SetTransparency(v80, v82, v83);
        if v25 then
            v25:SetTransparency(l_Utility_0.Clamp(0, 1, v80));
        end;
    end;
    v18.Destroy = function(_)
        v28:Destroy();
        v18 = nil;
    end;
    v18.IsSelected = function(_)
        if not l_GuiService_0.SelectedCoreObject then
            return false;
        else
            local v86 = true;
            if l_GuiService_0.SelectedCoreObject ~= v29 then
                v86 = v21:ContainsItem(l_GuiService_0.SelectedCoreObject) or l_GuiService_0.SelectedCoreObject == v53;
            end;
            return v86;
        end;
    end;
    return v18;
end;
