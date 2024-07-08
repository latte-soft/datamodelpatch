local l_GuiService_0 = game:GetService("GuiService");
local l_ContextActionService_0 = game:GetService("ContextActionService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_GlobalSettings_0 = require(l_Shell_0:FindFirstChild("GlobalSettings"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v7 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v8 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function(v9, v10)
    local v11 = {};
    local v12 = {};
    local v13 = nil;
    local v14 = {};
    v11.SelectedTabChanged = l_Utility_0.Signal();
    v11.SelectedTabClicked = l_Utility_0.Signal();
    v11.TabItemClickedConn = nil;
    local v15 = nil;
    local v16 = l_Utility_0.Create("ImageButton")({
        Size = UDim2.new(1, 0, 0, 36), 
        Position = v9, 
        BackgroundTransparency = 1, 
        Name = "TabContainer"
    });
    local v17 = l_Utility_0.Create("ImageLabel")({
        Name = "SelectionBorderObject", 
        Size = UDim2.new(1, 0, 0, 4), 
        Position = UDim2.new(0, 0, 1, 5), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_GlobalSettings_0.TabUnderlineColor, 
        BackgroundTransparency = 0
    });
    local v18 = l_Utility_0.Create("ImageButton")({
        Size = UDim2.new(1, 0, 0, 36), 
        BackgroundTransparency = 1, 
        Name = "DownSelector", 
        Selectable = false, 
        Parent = v16
    });
    v18.SelectionGained:connect(function()
        if v13 then
            l_Utility_0.SetSelectedCoreObject(v13:GetGuiObject());
            v11.SelectedTabClicked:fire(v13);
        end;
    end);
    local function v29(v19)
        if v19 == "SelectedCoreObject" then
            if l_GuiService_0.SelectedCoreObject == v16 then
                local l_v11_SelectedTab_0 = v11:GetSelectedTab();
                local v21 = l_v11_SelectedTab_0 and l_v11_SelectedTab_0:GetGuiObject();
                if v21 then
                    l_Utility_0.SetSelectedCoreObject(v21);
                end;
            end;
            local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
            local l_v11_FocusedTabByGuiObject_0 = v11:FindFocusedTabByGuiObject(l_SelectedCoreObject_0);
            if v13 and l_SelectedCoreObject_0 ~= v13:GetGuiObject() then
                v13:OnClickRelease();
            end;
            if not l_v11_FocusedTabByGuiObject_0 then
                l_ContextActionService_0:UnbindCoreAction("OnClickSelectedTab");
            else
                v11:SetSelectedTab(l_v11_FocusedTabByGuiObject_0);
                for _, v25 in pairs(l_UserInputService_0:GetGamepadState(Enum.UserInputType.Gamepad1)) do
                    if not (not (v25.KeyCode == Enum.KeyCode.ButtonA and v25.UserInputState == Enum.UserInputState.Begin) or not v13) then
                        v13:OnClick();
                    end;
                end;
                l_ContextActionService_0:UnbindCoreAction("OnClickSelectedTab");
                l_ContextActionService_0:BindCoreAction("OnClickSelectedTab", function(_, v27, _)
                    if v27 == Enum.UserInputState.Begin then
                        if v13 then
                            v13:OnClick();
                            return ;
                        end;
                    elseif v27 == Enum.UserInputState.End then
                        if v13 then
                            v13:OnClickRelease();
                        end;
                        v11.SelectedTabClicked:fire(v13);
                    end;
                end, false, Enum.KeyCode.ButtonA);
                return ;
            end;
        end;
    end;
    v11.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("TabDockId")
        };
    end;
    v11.FindFocusedTabByGuiObject = function(_, v32)
        if not (not v32 or not v32:IsDescendantOf(v16)) then
            for _, v34 in pairs(v12) do
                local v35 = v34 and v34:GetGuiObject();
                if v35 and v35 == v32 then
                    return v34;
                end;
            end;
        end;
    end;
    v11.IsFocused = function(v36)
        return v36:FindFocusedTabByGuiObject(l_GuiService_0.SelectedCoreObject) ~= nil;
    end;
    v11.SetSelectedTab = function(v37, v38)
        if v38 ~= v13 then
            if v13 then
                v13:SetSelected(false);
                v13:OnClickRelease();
            end;
            v13 = v38;
            if v13 then
                v13:SetSelected(true);
                if v37:IsFocused() then
                    local v39 = v13 and v13:GetGuiObject();
                    if v39 then
                        l_Utility_0.SetSelectedCoreObject(v39);
                    end;
                end;
            end;
            v11.SelectedTabChanged:fire(v13);
        end;
    end;
    if v7() > 0 then
        v11._SetSelectedTab = v11.SetSelectedTab;
        v11.SetSelectedTab = function(_, v41, v42)
            v11:_SetSelectedTab(v41);
            if v41 then
                if not v8() then
                    l_Analytics_0.reportNavigation(v42, v41:GetName());
                else
                    l_Analytics_0.reportNavigation(v42, v41:GetId());
                    return ;
                end;
            end;
        end;
    end;
    v11.Focus = function(v43)
        v43:Show();
        if v13 then
            v13:SetSelected(true);
            local v44 = v13 and v13:GetGuiObject();
            if v44 then
                l_Utility_0.SetSelectedCoreObject(v44);
            end;
        end;
    end;
    v11.GetSelectedTab = function(_)
        return v13;
    end;
    local v46 = 0;
    v11.ArrangeTabs = function(_)
        v46 = v46 + 1;
        local l_v46_0 = v46;
        local v49 = 0;
        for v50, v51 in pairs(v12) do
            local l_Offset_0 = v51:GetSize().X.Offset;
            local l_TabItemSpacing_0 = l_GlobalSettings_0.TabItemSpacing;
            if v50 == 1 then
                l_TabItemSpacing_0 = 0;
            end;
            if l_v46_0 == v46 then
                v51:SetPosition(UDim2.new(0, v49 + l_TabItemSpacing_0, 0, 0));
                local l_v51_GuiObject_0 = v51:GetGuiObject();
                if l_v51_GuiObject_0 then
                    local v55 = v12[v50 - 1] and v12[v50 - 1]:GetGuiObject();
                    local v56 = v12[v50 + 1] and v12[v50 + 1]:GetGuiObject();
                    l_v51_GuiObject_0.NextSelectionLeft = v55 or l_v51_GuiObject_0;
                    l_v51_GuiObject_0.NextSelectionRight = v56 or l_v51_GuiObject_0;
                end;
                v49 = (v49 + l_TabItemSpacing_0) + l_Offset_0;
            else
                return ;
            end;
        end;
    end;
    v11.FindTabIndex = function(_, v58)
        for v59, v60 in pairs(v12) do
            if v58 == v60 then
                return v59;
            end;
        end;
    end;
    v11.ContainsTab = function(v61, v62)
        return v61:FindTabIndex(v62) ~= nil;
    end;
    v11.GetTab = function(_, v64)
        return v12[v64];
    end;
    v11.GetNextTab = function(_)
        if not v13 then
            return ;
        else
            local l_v11_TabIndex_0 = v11:FindTabIndex(v13);
            return l_v11_TabIndex_0 and v12[l_v11_TabIndex_0 + 1];
        end;
    end;
    v11.GetPreviousTab = function(_)
        if not v13 then
            return ;
        else
            local l_v11_TabIndex_1 = v11:FindTabIndex(v13);
            return l_v11_TabIndex_1 and v12[l_v11_TabIndex_1 - 1];
        end;
    end;
    v11.AddTab = function(v69, v70)
        if not v69:FindTabIndex(v70) then
            local v71 = v70 and v70:GetGuiObject();
            if v71 then
                v71.SelectionImageObject = v17;
                v71.NextSelectionDown = v18;
            end;
            table.insert(v12, v70);
            v70:SetParent(v16);
            l_Utility_0.DisconnectEvent(v14[v70]);
            v14[v70] = v70.SizeChanged:connect(function()
                v69:ArrangeTabs();
            end);
            v69:ArrangeTabs();
            return v70;
        else
            l_Utility_0.DebugLog("Not adding tab:", v70:GetName(), "because that tab already exists.");
            return ;
        end;
    end;
    v11.RemoveTab = function(v72, v73)
        local l_v72_TabIndex_0 = v72:FindTabIndex(v73);
        if not l_v72_TabIndex_0 then
            return false;
        else
            table.remove(v12, l_v72_TabIndex_0);
            if v73 == v13 then
                v11:SetSelectedTab(nil);
            end;
            v73:SetParent(nil);
            l_Utility_0.DisconnectEvent(v14[v73]);
            v72:ArrangeTabs();
            return true;
        end;
    end;
    v11.SetParent = function(_, v76)
        v16.Parent = v76;
    end;
    v11.ConnectEvents = function(_)
        v29("SelectedCoreObject");
        v15 = l_GuiService_0.Changed:connect(v29);
    end;
    v11.DisconnectEvents = function(_)
        if v15 then
            v15:disconnect();
            v15 = nil;
        end;
    end;
    local l_TabDockTweenDuration_0 = l_GlobalSettings_0.TabDockTweenDuration;
    local function v80(v81, v82, v83, v84, v85)
        if v81 == nil then
            return ;
        else
            if not (not (v81:IsA("TextLabel") or v81:IsA("TextBox")) and not v81:IsA("TextButton")) then
                table.insert(v82, l_Utility_0.PropertyTweener(v81, "TextTransparency", v83, v84, v85, l_Utility_0.EaseOutQuad));
            end;
            for _, v87 in pairs(v81:GetChildren()) do
                v80(v87, v82, v83, v84, v85);
            end;
            return ;
        end;
    end;
    local v88 = {};
    local v89 = false;
    v11.Hide = function(_)
        if v89 then
            v89 = false;
            l_Utility_0.CancelTweens(v88);
            table.insert(v88, (l_Utility_0.PropertyTweener(v16, "Position", v9, v10, l_TabDockTweenDuration_0, l_Utility_0.SCurveUDim2)));
            v80(v16, v88, 0, 1, l_TabDockTweenDuration_0);
            return ;
        else
            return ;
        end;
    end;
    v11.Show = function(_)
        if not v89 then
            v89 = true;
            l_Utility_0.CancelTweens(v88);
            table.insert(v88, (l_Utility_0.PropertyTweener(v16, "Position", v10, v9, l_TabDockTweenDuration_0, l_Utility_0.SCurveUDim2)));
            v80(v16, v88, 1, 0, l_TabDockTweenDuration_0);
            return ;
        else
            return ;
        end;
    end;
    return v11;
end;
