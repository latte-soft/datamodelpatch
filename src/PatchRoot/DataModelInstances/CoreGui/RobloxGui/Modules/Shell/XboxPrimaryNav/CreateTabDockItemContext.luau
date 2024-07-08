local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Shell_0 = l_CoreGui_0:FindFirstChild("RobloxGui"):FindFirstChild("Modules"):FindFirstChild("Shell");
local l_Analytics_0 = require(l_Shell_0:FindFirstChild("Analytics"));
local l_SoundManager_0 = require(l_Shell_0:FindFirstChild("SoundManager"));
local v5 = require(l_CorePackages_0.Promise);
return function(v6, v7, v8)
    local v9 = {};
    local v10 = false;
    local v11 = nil;
    v9.isConfigured = false;
    v9.name = v6;
    v9.configurationPromise = v5.new(function(v12, v13)
        v9.resolveConfiguration = function(_, v15)
            return v12(v15);
        end;
        v9.rejectConfiguration = function(_, v17)
            return v13(v17);
        end;
    end);
    v9.configureContext = function(_, v19)
        if not v9.isConfigured then
            v11 = v19;
            v9.isConfigured = true;
            v9:resolveConfiguration(v19);
            return ;
        else
            return print("TabDockItemContext has already been configured and cannot be reconfigured");
        end;
    end;
    local function v23(v20, v21)
        if v20 and type(v20.GetAnalyticsInfo) == "function" then
            local l_v20_AnalyticsInfo_0 = v20:GetAnalyticsInfo();
            if not (not (type(l_v20_AnalyticsInfo_0) == "table") or not l_v20_AnalyticsInfo_0[l_Analytics_0.WidgetNames("WidgetId")]) then
                l_v20_AnalyticsInfo_0.Status = v21;
                l_Analytics_0.SetRBXEventStream("Widget", l_v20_AnalyticsInfo_0);
            end;
        end;
    end;
    local function _()
        if v9.isConfigured == false then
            return ;
        else
            if v10 then
                v23(v7, "Select");
            end;
            return ;
        end;
    end;
    v9.GetContentItem = function(_)
        return v7;
    end;
    v9.GetGuiObject = function(_)
        return v11;
    end;
    v9.SetSelected = function(_, v28)
        if v9.isConfigured and v10 ~= v28 then
            v10 = v28;
            if v9.isConfigured == false then
                return ;
            elseif v10 then
                v23(v7, "Select");
            end;
        end;
    end;
    v9.GetSelected = function(_)
        return v10;
    end;
    v9.GetId = function(_)
        return v8;
    end;
    v9.GetName = function(_)
        return v6;
    end;
    v9.GetSize = function(_)
        return v11.Size;
    end;
    v9.OnClick = function(_)
        if v9.isConfigured then
            l_SoundManager_0:Play("ButtonPress");
        end;
    end;
    if not (v9.isConfigured == false or not v10) then
        v23(v7, "Select");
    end;
    return v9;
end;
