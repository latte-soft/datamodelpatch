local l_CorePackages_0 = game:GetService("CorePackages");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_GuiService_0 = game:GetService("GuiService");
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local l_Signal_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).Signal;
local v5 = {
    Unavailable = 0, 
    Loading = 1, 
    Available = 2, 
    Pinned = 3
};
local v6 = {};
v6.__index = v6;
v6.new = function(v7)
    return (setmetatable({
        _state = v7 or v5.Unavailable, 
        _changeSignal = l_Signal_0.new()
    }, v6));
end;
v6.connect = function(v8, v9)
    return v8._changeSignal:connect(v9);
end;
v6.set = function(v10, v11)
    if v10._state ~= v11 then
        v10._state = v11;
        v10._changeSignal:fire(v11);
    end;
end;
v6.get = function(v12)
    return v12._state;
end;
v6.available = function(v13)
    v13:set(v5.Available);
end;
v6.loading = function(v14)
    v14:set(v5.Loading);
end;
v6.unavailable = function(v15)
    v15:set(v5.Unavailable);
end;
v6.pinned = function(v16)
    v16:set(v5.Pinned);
end;
local v17 = {};
v17.__index = v17;
v17.new = function(v18)
    return (setmetatable({
        _value = {
            type = "empty", 
            value = nil
        }, 
        _changeSignal = l_Signal_0.new(), 
        _excludeFromTotalCounts = v18 or false
    }, v17));
end;
v17.setExcludeFromTotalCounts = function(v19, v20)
    v19._excludeFromTotalCounts = v20;
end;
v17.excludeFromTotalCounts = function(v21)
    return v21._excludeFromTotalCounts;
end;
v17.connect = function(v22, v23)
    return v22._changeSignal:connect(v23);
end;
v17.get = function(v24)
    return v24._value;
end;
v17.clear = function(v25)
    if v25._value and v25._value.type ~= "empty" then
        v25._value = {
            type = "empty", 
            value = nil
        };
        v25._changeSignal:fire(v25._value);
    end;
end;
v17.fireCount = function(v26, v27)
    local v28 = {
        type = "count", 
        value = v27
    };
    if v26._value ~= v28 then
        v26._value = v28;
        v26._changeSignal:fire(v26._value);
    end;
end;
local v29 = {};
v29.__index = v29;
v29.new = function(v30)
    return (setmetatable({
        _value = v30, 
        _changeSignal = l_Signal_0.new()
    }, v29));
end;
v29.get = function(v31)
    return v31._value;
end;
v29.setMomentary = function(v32, v33, v34, v35)
    if v32._value ~= v33 then
        v32._value = v33;
        v32._changeSignal:fire(v33);
    end;
    local l__momentaryClearThread_0 = v32._momentaryClearThread;
    if l__momentaryClearThread_0 then
        task.cancel(l__momentaryClearThread_0);
    end;
    v32._momentaryClearThread = task.delay(v34, function()
        v32._momentaryClearThread = nil;
        v32.set(v32, v35);
    end);
end;
v29.set = function(v37, v38)
    local l__momentaryClearThread_1 = v37._momentaryClearThread;
    if l__momentaryClearThread_1 then
        task.cancel(l__momentaryClearThread_1);
        v37._momentaryClearThread = nil;
    end;
    if v37._value ~= v38 then
        v37._value = v38;
        v37._changeSignal:fire(v38);
    end;
end;
v29.signal = function(v40)
    return v40._changeSignal;
end;
v29.connect = function(v41, v42, v43)
    local v44 = v41._changeSignal:connect(v42);
    if v43 == true then
        v42(v41._value);
    end;
    return v44;
end;
local v45 = {};
v45.__index = v45;
v45.new = function(v46, v47, v48)
    if not v46 then
        error("No signal provided to MappedSignal");
    end;
    if not v47 then
        error("No fetchMapFunction provided to MappedSignal");
    end;
    return (setmetatable({
        _signal = v46, 
        _fetchMapFunction = v47, 
        _eventReceiver = v48
    }, v45));
end;
v45.connect = function(v49, v50)
    if v49._signal then
        return v49._signal:connect(function(...)
            if v49._eventReceiver then
                v49._eventReceiver(...);
            end;
            v50(v49._fetchMapFunction());
        end);
    else
        warn("MappedSignal: Missing signal");
        return function()
        end;
    end;
end;
v45.get = function(v51)
    return v51._fetchMapFunction();
end;
setCoreGuiAvailability = function(v52, v53, v54)
    local v56 = l_StarterGui_0.CoreGuiChangedSignal:Connect(function()
        local l_l_StarterGui_0_CoreGuiEnabled_0 = l_StarterGui_0:GetCoreGuiEnabled(v53);
        if not v54 then
            if not l_l_StarterGui_0_CoreGuiEnabled_0 then
                v52.availability:unavailable();
                return ;
            else
                v52.availability:available();
                return ;
            end;
        else
            v54(l_l_StarterGui_0_CoreGuiEnabled_0);
            return ;
        end;
    end);
    local l_l_StarterGui_0_CoreGuiEnabled_1 = l_StarterGui_0:GetCoreGuiEnabled(v53);
    if not v54 then
        if not l_l_StarterGui_0_CoreGuiEnabled_1 then
            v52.availability:unavailable();
            return v56;
        else
            v52.availability:available();
            return v56;
        end;
    else
        v54(l_l_StarterGui_0_CoreGuiEnabled_1);
        return v56;
    end;
end;
dismissRobloxMenuAndRun = function(v58)
    local v59 = require(l_RobloxGui_0.Modules.Settings.SettingsHub);
    if not l_GuiService_0.MenuIsOpen then
        v58(false);
        return ;
    else
        local v60 = tick() + 3;
        local v61 = nil;
        v61 = l_GuiService_0.MenuClosed:Connect(function()
            if v61 then
                v61:Disconnect();
                v61 = nil;
            end;
            if tick() < v60 then
                v58(true);
            end;
        end);
        v59:SetVisibility(false);
        return ;
    end;
end;
isTakingScreenshot = function()
    return require(l_RobloxGui_0.Modules.Settings.SettingsHub).GetTakingScreenshot();
end;
return {
    MappedSignal = v45, 
    AvailabilitySignal = v6, 
    AvailabilitySignalState = v5, 
    NotifySignal = v17, 
    ObservableValue = v29, 
    setCoreGuiAvailability = setCoreGuiAvailability, 
    dismissRobloxMenuAndRun = dismissRobloxMenuAndRun, 
    isTakingScreenshot = isTakingScreenshot
};
