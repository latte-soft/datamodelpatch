local l_GuiService_0 = game:GetService("GuiService");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = game:GetService("CoreGui"):FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Utility_0 = require(l_Shell_0:FindFirstChild("Utility"));
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local v5 = require(l_CorePackages_0.Promise);
local v6 = require(l_Shell_0.Flags.GetFIntXboxPrimaryNavABLogging);
local v7 = require(l_Shell_0.Flags.GetFFlagXboxFixPrimaryNavABEvents);
return function()
    local v8 = {};
    local v9 = false;
    local v10 = nil;
    v8.tabs = {};
    v8.TabContextUpdateSignal = l_Utility_0.Signal();
    local v11 = nil;
    v8.SelectedTabChanged = l_Utility_0.Signal();
    v8.SelectedTabClicked = l_Utility_0.Signal();
    v8.SelectedTabIdxChanged = l_Utility_0.Signal();
    v8.configurationPromise = v5.new(function(v12, v13)
        v8.resolveConfiguration = function(_, v15)
            return v12(v15);
        end;
        v8.rejectConfiguration = function(_, v17)
            return v13(v17);
        end;
    end);
    v8.configureContext = function(_, v19)
        if not v9 then
            v10 = v19;
            v9 = true;
            v8:resolveConfiguration(v19);
            return ;
        else
            return print("TabDockContext has already been configured and cannot be reconfigured");
        end;
    end;
    v8.activateTab = function(_, v21, v22)
        local v23 = v8.tabs[v21];
        if v23 then
            v8:SetSelectedTab(v23, v22);
        end;
    end;
    v8.GetAnalyticsInfo = function(_)
        return {
            [l_Analytics_0.WidgetNames("WidgetId")] = l_Analytics_0.WidgetNames("TabDockId")
        };
    end;
    v8.FindFocusedTabByGuiObject = function(_, v26)
        if not (not v26 or not v26:IsDescendantOf(v10)) then
            for _, v28 in ipairs(v8.tabs) do
                local v29 = v28 and v28:GetGuiObject();
                if v29 and v29 == v26 then
                    return v28;
                end;
            end;
        end;
    end;
    v8.IsFocused = function(_)
        return v8:FindFocusedTabByGuiObject(l_GuiService_0.SelectedCoreObject) ~= nil;
    end;
    v8.SetSelectedTab = function(_, v32, v33)
        if v32 ~= v11 then
            if v11 then
                v11:SetSelected(false);
            end;
            v11 = v32;
            if v11 then
                v11:SetSelected(true, v33);
            end;
            if v6() > 0 then
                if not v7() then
                    l_Analytics_0.reportNavigation(v33, v32:GetName());
                else
                    l_Analytics_0.reportNavigation(v33, v32:GetId());
                end;
            end;
            v8.SelectedTabClicked:fire(v11);
            v8.SelectedTabChanged:fire(v11);
            v8.SelectedTabIdxChanged:fire(table.find(v8.tabs, v11));
        end;
    end;
    v8.Focus = function(_)
        if v11 then
            v11:SetSelected(true);
            local v35 = v11 and v11:GetGuiObject();
            if v35 then
                l_Utility_0.SetSelectedCoreObject(v35);
            end;
        end;
    end;
    v8.GetSelectedTab = function(_)
        return v11;
    end;
    v8.GetNextTab = function(_)
        if not v11 then
            return ;
        else
            local v38 = table.find(v8.tabs, v11);
            return v38 and v8.tabs[v38 + 1];
        end;
    end;
    v8.GetPreviousTab = function(_)
        if not v11 then
            return ;
        else
            local v40 = table.find(v8.tabs, v11);
            return v40 and v8.tabs[v40 - 1];
        end;
    end;
    v8.AddTabs = function(_, v42)
        v8.tabs = v42;
        v8.TabContextUpdateSignal:fire(v8.tabs);
        v8:SetSelectedTab(v8.tabs[1]);
    end;
    v8.ConnectEvents = function(_)
    end;
    v8.DisconnectEvents = function(_)
    end;
    return v8;
end;
