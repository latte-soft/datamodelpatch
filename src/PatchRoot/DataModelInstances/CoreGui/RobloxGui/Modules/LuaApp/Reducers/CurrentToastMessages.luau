local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Cryo);
local v3 = require(l_CorePackages_0.Rodux);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCurrentToastMessage);
local v5 = require(l_Modules_0.LuaApp.Actions.RemoveCurrentToastMessage);
local v6 = require(l_Modules_0.LuaApp.Actions.RemoveAllToastMessages);
local v7 = {
    enqueuedToastMessages = {}, 
    currentToastMessage = nil
};
local function _(v8, v9)
    local v10 = false;
    if v8.toastMessage == v9.toastMessage then
        v10 = false;
        if v8.toastSubMessage == v9.toastSubMessage then
            v10 = false;
            if v8.toastType == v9.toastType then
                v10 = false;
                if v8.universeId == v9.universeId then
                    v10 = v8.isLocalized == v9.isLocalized;
                end;
            end;
        end;
    end;
    return v10;
end;
local function v19(v12, v13)
    local l_currentToastMessage_0 = v12.currentToastMessage;
    local v15 = false;
    if l_currentToastMessage_0.toastMessage == v13.toastMessage then
        v15 = false;
        if l_currentToastMessage_0.toastSubMessage == v13.toastSubMessage then
            v15 = false;
            if l_currentToastMessage_0.toastType == v13.toastType then
                v15 = false;
                if l_currentToastMessage_0.universeId == v13.universeId then
                    v15 = l_currentToastMessage_0.isLocalized == v13.isLocalized;
                end;
            end;
        end;
    end;
    if not v15 then
        for _, v17 in ipairs(v12.enqueuedToastMessages) do
            local v18 = false;
            if v17.toastMessage == v13.toastMessage then
                v18 = false;
                if v17.toastSubMessage == v13.toastSubMessage then
                    v18 = false;
                    if v17.toastType == v13.toastType then
                        v18 = false;
                        if v17.universeId == v13.universeId then
                            v18 = v17.isLocalized == v13.isLocalized;
                        end;
                    end;
                end;
            end;
            if v18 then
                return true;
            end;
        end;
        return false;
    else
        return true;
    end;
end;
local v20 = 0;
return v3.createReducer(v7, {
    [v4.name] = function(v21, v22)
        local v23 = {
            enqueuedToastMessages = {}
        };
        local v24 = v2.Dictionary.join(v22.toastMessage, {
            sequenceNumber = v20
        });
        v20 = v20 + 1;
        if v21.currentToastMessage then
            if not v19(v21, v24) then
                v23.currentToastMessage = v21.currentToastMessage;
                v23.enqueuedToastMessages = v2.List.join(v21.enqueuedToastMessages, {
                    v24
                });
                return v23;
            else
                return v21;
            end;
        else
            v23.currentToastMessage = v24;
            return v23;
        end;
    end, 
    [v5.name] = function(v25, _)
        local v27 = {
            enqueuedToastMessages = {}
        };
        if #v25.enqueuedToastMessages > 0 then
            v27.currentToastMessage = v25.enqueuedToastMessages[1];
            v27.enqueuedToastMessages = v2.List.removeIndex(v25.enqueuedToastMessages, 1);
        end;
        return v27;
    end, 
    [v6.name] = function(_, _)
        return {
            enqueuedToastMessages = {}
        };
    end
});
