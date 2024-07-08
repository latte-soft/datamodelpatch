local l_script_FirstAncestor_0 = script:FindFirstAncestor("AuthCommon");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local l_CentralOverlayType_0 = require(l_Parent_0.RobloxAppEnums).CentralOverlayType;
local l_SetCentralOverlay_0 = require(l_Parent_0.CentralOverlay).Actions.SetCentralOverlay;
local v4 = require(l_script_FirstAncestor_0.Http.Requests.PostEnterLoginCode);
local v5 = require(l_script_FirstAncestor_0.Http.Requests.PostConfirmLoginCode);
local v6 = require(l_script_FirstAncestor_0.Http.Requests.PostCreateLoginCode);
local v7 = require(l_script_FirstAncestor_0.Http.Requests.PostLoginCodeStatus);
local v8 = require(l_script_FirstAncestor_0.Http.Requests.PostCancelLoginCode);
local l_GetFFlagEnableCrossDeviceLoginUsingQRCodes_0 = require(l_Parent_0.SharedFlags).GetFFlagEnableCrossDeviceLoginUsingQRCodes;
return {
    EnterCode = function(v10, v11)
        return function(_)
            return v4(v10, v11):andThen(function(v13)
                if not (v13 and v13.responseBody) then
                    return nil;
                else
                    return {
                        DeviceInfo = string.format("%s\n%s", v13.responseBody.deviceInfo or "", v13.responseBody.location or "")
                    };
                end;
            end);
        end;
    end, 
    FetchDeviceCode = function(v14)
        return function(_)
            return v6(v14):andThen(function(v16)
                local v17 = v16 and v16.responseBody;
                if not v17 then
                    return nil;
                else
                    return {
                        DeviceCode = v17.code, 
                        PrivateKey = v17.privateKey, 
                        QrCodePath = if not l_GetFFlagEnableCrossDeviceLoginUsingQRCodes_0() then nil else v17.imagePath
                    };
                end;
            end);
        end;
    end, 
    GetLoginStatus = function(v18, v19, v20)
        return function(_)
            return v7(v18, v19, v20):andThen(function(v22)
                local v23 = v22 and v22.responseBody;
                if not v23 then
                    return nil;
                else
                    return {
                        Status = v23.status, 
                        AccountName = v23.accountName, 
                        AccountPictureUrl = v23.accountPictureUrl, 
                        ExpirationTime = v23.expirationTime
                    };
                end;
            end);
        end;
    end, 
    OpenLoginCodePrompt = function(v24)
        return function(v25)
            v25:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.CrossDeviceCodePrompt, v24));
        end;
    end, 
    ConfirmDeviceAccess = function(v26, v27)
        return function(_)
            return v5(v26, v27);
        end;
    end, 
    CancelLoginCode = function(v29, v30)
        return function(_)
            return v8(v29, v30);
        end;
    end, 
    OpenConfirmationOverlay = function(v32, v33, v34, v35)
        return function(v36)
            v36:dispatch(l_SetCentralOverlay_0(l_CentralOverlayType_0.CrossDeviceLoginConfirmation, {
                loginSuccess = v32, 
                closeCallback = v33, 
                retryCallback = v34, 
                deviceString = v35
            }));
        end;
    end
};
