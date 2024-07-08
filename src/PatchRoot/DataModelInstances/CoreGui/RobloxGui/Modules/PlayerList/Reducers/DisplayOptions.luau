local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_VRService_0 = game:GetService("VRService");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = l_CoreGui_0:WaitForChild("RobloxGui");
local v5 = require(l_CorePackages_0.Rodux);
local v6 = require(l_CorePackages_0.Cryo);
local l_Actions_0 = script.Parent.Parent.Actions;
local v8 = require(l_Actions_0.SetPlayerListVisibility);
local v9 = require(l_Actions_0.SetPlayerListEnabled);
local v10 = require(l_Actions_0.SetTempHideKey);
local v11 = require(l_Actions_0.SetPerformanceStatsVisible);
local v12 = require(l_Actions_0.SetSmallTouchDevice);
local v13 = require(l_Actions_0.SetTenFootInterface);
local v14 = require(l_Actions_0.SetInspectMenuEnabled);
local v15 = require(l_Actions_0.SetIsUsingGamepad);
local v16 = require(l_Actions_0.SetHasPermissionToVoiceChat);
local v17 = require(l_Actions_0.SetMinimized);
local v18 = require(l_Actions_0.SetSubjectToChinaPolicies);
local v19 = require(l_RobloxGui_0.Modules.Flags.FFlagMobilePlayerList);
local v20 = {
    isMinimized = false, 
    setVisible = true, 
    isVisible = true, 
    isSmallTouchDevice = false, 
    performanceStatsVisible = false, 
    vrEnabled = l_VRService_0.VREnabled, 
    inspectMenuEnabled = l_GuiService_0:GetInspectMenuEnabled(), 
    playerlistCoreGuiEnabled = true, 
    isTenFootInterface = false, 
    isUsingGamepad = false, 
    hasPermissionToVoiceChat = false, 
    tempHideKeys = {}, 
    subjectToChinaPolicies = true
};
local function _(v21)
    v21.isVisible = v21.setVisible;
    if not v19 then
        if not v21.isTenFootInterface then
            v21.isVisible = v21.isVisible and not v21.isSmallTouchDevice;
        end;
    elseif not v21.isTenFootInterface then
        v21.isVisible = v21.isVisible;
    end;
    v21.isVisible = v21.isVisible and v6.isEmpty(v21.tempHideKeys);
    return v21;
end;
return (v5.createReducer(v20, {
    [v8.name] = function(v23, v24)
        local v25 = v6.Dictionary.join(v23, {
            setVisible = v24.isVisible
        });
        v25.isVisible = v25.setVisible;
        if not v19 then
            if not v25.isTenFootInterface then
                v25.isVisible = v25.isVisible and not v25.isSmallTouchDevice;
            end;
        elseif not v25.isTenFootInterface then
            v25.isVisible = v25.isVisible;
        end;
        v25.isVisible = v25.isVisible and v6.isEmpty(v25.tempHideKeys);
        return v25;
    end, 
    [v9.name] = function(v26, v27)
        local v28 = v6.Dictionary.join(v26, {
            playerlistCoreGuiEnabled = v27.isEnabled
        });
        v28.isVisible = v28.setVisible;
        if not v19 then
            if not v28.isTenFootInterface then
                v28.isVisible = v28.isVisible and not v28.isSmallTouchDevice;
            end;
        elseif not v28.isTenFootInterface then
            v28.isVisible = v28.isVisible;
        end;
        v28.isVisible = v28.isVisible and v6.isEmpty(v28.tempHideKeys);
        return v28;
    end, 
    [v10.name] = function(v29, v30)
        local l_tempHideValue_0 = v30.tempHideValue;
        if l_tempHideValue_0 == nil then
            l_tempHideValue_0 = v6.None;
        end;
        local v32 = v6.Dictionary.join(v29, {
            tempHideKeys = v6.Dictionary.join(v29.tempHideKeys, {
                [v30.tempHideKey] = l_tempHideValue_0
            })
        });
        v32.isVisible = v32.setVisible;
        if not v19 then
            if not v32.isTenFootInterface then
                v32.isVisible = v32.isVisible and not v32.isSmallTouchDevice;
            end;
        elseif not v32.isTenFootInterface then
            v32.isVisible = v32.isVisible;
        end;
        v32.isVisible = v32.isVisible and v6.isEmpty(v32.tempHideKeys);
        return v32;
    end, 
    [v11.name] = function(v33, v34)
        return v6.Dictionary.join(v33, {
            performanceStatsVisible = v34.isVisible
        });
    end, 
    [v12.name] = function(v35, v36)
        local v37 = v6.Dictionary.join(v35, {
            isSmallTouchDevice = v36.isSmallTouchDevice
        });
        v37.isVisible = v37.setVisible;
        if not v19 then
            if not v37.isTenFootInterface then
                v37.isVisible = v37.isVisible and not v37.isSmallTouchDevice;
            end;
        elseif not v37.isTenFootInterface then
            v37.isVisible = v37.isVisible;
        end;
        v37.isVisible = v37.isVisible and v6.isEmpty(v37.tempHideKeys);
        return v37;
    end, 
    [v13.name] = function(v38, v39)
        local l_setVisible_0 = v38.setVisible;
        if v39.isTenFootInterface then
            l_setVisible_0 = false;
        end;
        local v41 = v6.Dictionary.join(v38, {
            isTenFootInterface = v39.isTenFootInterface, 
            setVisible = l_setVisible_0
        });
        v41.isVisible = v41.setVisible;
        if not v19 then
            if not v41.isTenFootInterface then
                v41.isVisible = v41.isVisible and not v41.isSmallTouchDevice;
            end;
        elseif not v41.isTenFootInterface then
            v41.isVisible = v41.isVisible;
        end;
        v41.isVisible = v41.isVisible and v6.isEmpty(v41.tempHideKeys);
        return v41;
    end, 
    [v14.name] = function(v42, v43)
        return v6.Dictionary.join(v42, {
            inspectMenuEnabled = v43.enabled
        });
    end, 
    [v15.name] = function(v44, v45)
        return v6.Dictionary.join(v44, {
            isUsingGamepad = v45.isUsingGamepad
        });
    end, 
    [v16.name] = function(v46, v47)
        return v6.Dictionary.join(v46, {
            hasPermissionToVoiceChat = v47.hasPermissionToVoiceChat
        });
    end, 
    [v17.name] = function(v48, v49)
        return v6.Dictionary.join(v48, {
            isMinimized = v49.isMinimized
        });
    end, 
    [v18.name] = function(v50, v51)
        return v6.Dictionary.join(v50, {
            subjectToChinaPolicies = v51.subjectToChinaPolicies
        });
    end
}));
