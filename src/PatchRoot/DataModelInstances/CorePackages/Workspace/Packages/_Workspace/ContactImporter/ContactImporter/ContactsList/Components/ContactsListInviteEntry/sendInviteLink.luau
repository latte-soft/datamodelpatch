local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactImporter");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_useDispatch_0 = v1.useDispatch;
local l_NetworkingShareLinks_0 = v1.NetworkingShareLinks;
local l_RoduxShareLinks_0 = v1.RoduxShareLinks;
local v5 = require(l_script_FirstAncestor_0.Common.TextKeys);
local l_useLocalization_0 = v1.useLocalization;
local l_RoduxContacts_0 = v1.RoduxContacts;
local l_React_0 = v1.React;
local l_Promise_0 = v1.Promise;
local v10 = require(l_script_FirstAncestor_0.Analytics.useAnalytics);
local v11 = require(l_script_FirstAncestor_0.Analytics.Enums.EventNames);
local l_getFFlagLuaNativeUtilEnableSMSHandling_0 = v1.getFFlagLuaNativeUtilEnableSMSHandling;
local function _(v13)
    return function(v14)
        if not l_getFFlagLuaNativeUtilEnableSMSHandling_0() then
            return v13.smsProtocol:supportsSMS():andThen(function(v15)
                if not v15 then
                    return l_Promise_0.reject();
                else
                    return v13.smsProtocol:sendSMS({
                        address = v13.address, 
                        message = v14
                    });
                end;
            end);
        else
            return v13.nativeUtilProtocol:supportsSMS():andThen(function(v16)
                if not v16 then
                    return l_Promise_0.reject();
                else
                    return v13.nativeUtilProtocol:sendSMS({
                        address = v13.address, 
                        message = v14
                    });
                end;
            end);
        end;
    end;
end;
return function(v18)
    local v19 = l_useDispatch_0();
    local v20, v21 = l_React_0.useState(false);
    local function v22()
        v21(false);
    end;
    local v23 = v10();
    local v24 = nil;
    local function v25()
        v23.fireAnalyticsEvent(v11.InviteContact, {
            offNetworkFriendRequestLinkId = v24
        });
        v21(false);
    end;
    local v26 = l_useLocalization_0({
        rootMessage = v5.SMS_DEFAULT_MESSAGE
    });
    local function _(v27)
        return function(v28)
            local l_shortUrl_0 = v28.responseBody.shortUrl;
            v24 = v28.responseBody.linkId;
            return l_shortUrl_0 .. "\n\n" .. v27.rootMessage;
        end;
    end;
    return {
        sendInvite = function()
            v21(true);
            local v31 = v19(l_NetworkingShareLinks_0.GenerateLink.API({
                linkType = l_RoduxShareLinks_0.Enums.LinkType.FriendInvite.rawValue()
            }));
            local l_v26_0 = v26;
            local l_l_v26_0_0 = l_v26_0 --[[ copy: 3 -> 4 ]];
            v31 = v31:andThen(function(v34)
                local l_shortUrl_1 = v34.responseBody.shortUrl;
                v24 = v34.responseBody.linkId;
                return l_shortUrl_1 .. "\n\n" .. l_l_v26_0_0.rootMessage;
            end);
            l_v26_0 = v18;
            return v31:andThen(function(v36)
                if not l_getFFlagLuaNativeUtilEnableSMSHandling_0() then
                    return l_v26_0.smsProtocol:supportsSMS():andThen(function(v37)
                        if not v37 then
                            return l_Promise_0.reject();
                        else
                            return l_v26_0.smsProtocol:sendSMS({
                                address = l_v26_0.address, 
                                message = v36
                            });
                        end;
                    end);
                else
                    return l_v26_0.nativeUtilProtocol:supportsSMS():andThen(function(v38)
                        if not v38 then
                            return l_Promise_0.reject();
                        else
                            return l_v26_0.nativeUtilProtocol:sendSMS({
                                address = l_v26_0.address, 
                                message = v36
                            });
                        end;
                    end);
                end;
            end):andThen(v19(l_RoduxContacts_0.Actions.RequestSent({
                id = v18.deviceContactId
            }))):andThen(v25):catch(v22);
        end, 
        isLoading = v20
    };
end;
