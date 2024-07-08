local l_HttpService_0 = game:GetService("HttpService");
local v1 = require(script.Parent.getLocalizedToastStringFromHttpError);
local l_Parent_0 = script:FindFirstAncestor("RobloxAppToastsRodux").Parent;
local l_mutedError_0 = require(l_Parent_0.Loggers).mutedError;
local v4 = require(l_Parent_0.ToastRodux);
local l_ToastType_0 = v4.Enums.ToastType;
local l_SetCurrentToastMessage_0 = v4.Actions.SetCurrentToastMessage;
local v7 = require(l_Parent_0.tutils);
local v8 = game:DefineFastFlag("LuaAppMutedSetNetworkingErrorToast", false);
local function v16(v9)
    local l_status_0, l_result_0 = pcall(l_HttpService_0.JSONDecode, l_HttpService_0, v9.Body);
    if l_status_0 then
        local l_errors_0 = l_result_0.errors;
        if not l_errors_0 then
            if v8 then
                l_mutedError_0("No errors given in err.Body, err = " .. v7.toString(v9));
            end;
        else
            for _, v14 in ipairs(l_errors_0) do
                local l_userFacingMessage_0 = v14.userFacingMessage;
                if l_userFacingMessage_0 ~= nil then
                    return l_userFacingMessage_0;
                end;
            end;
        end;
        return nil;
    else
        return nil;
    end;
end;
return function(v17)
    v17 = v17 or {};
    assert(v17, "not nil");
    return function(v18)
        local v19 = v16(v17);
        if not v19 then
            local v20 = v1(v17.HttpError, v17.StatusCode);
            if v20 ~= nil then
                v18:dispatch(l_SetCurrentToastMessage_0({
                    toastType = l_ToastType_0.NetworkingError, 
                    toastMessage = v20
                }));
            end;
            return ;
        else
            v18:dispatch(l_SetCurrentToastMessage_0({
                toastType = l_ToastType_0.InformationMessage, 
                toastMessage = v19, 
                isLocalized = true
            }));
            return ;
        end;
    end;
end;
