local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetPhoneNumber);
local v3 = require(l_Modules_0.LuaApp.Http.Requests.GetVerifiedEmail);
local v4 = require(l_Modules_0.LuaApp.Thunks.Verification.OpenPhoneUpsellModal);
local v5 = require(l_Modules_0.LuaApp.Thunks.Authentication.Logout);
local v6 = require(l_Modules_0.LuaApp.EventStreamConstants);
return function(v7, v8)
    return function(v9)
        return v2(v7):andThen(function(v10)
            local l_phone_0 = v10.responseBody.phone;
            local l_countryCode_0 = v10.responseBody.countryCode;
            local l_prefix_0 = v10.responseBody.prefix;
            if not (l_phone_0 and l_phone_0 ~= "") then
                return v3(v7):andThen(function(v14)
                    local l_emailAddress_0 = v14.responseBody.emailAddress;
                    if not (l_emailAddress_0 and l_emailAddress_0 ~= "") then
                        v9:dispatch(v4({
                            onSuccess = function()
                                v9:dispatch(v5(v7, v8));
                            end, 
                            eventContext = v6.Context.VerificationUpsell, 
                            origin = v6.Origin.Logout, 
                            addPhoneTitleKey = "Feature.VerificationUpsell.Heading.FinishAccountSetup", 
                            addPhoneDescriptionKey = "Feature.VerificationUpsell.Description.LogoutAddPhoneTextV2", 
                            extraButtonTextKey = "Feature.VerificationUpsell.Action.Logout", 
                            onExtraButtonClick = function()
                                v9:dispatch(v5(v7, v8));
                            end
                        }));
                        return v1.reject();
                    else
                        return v1.resolve({
                            EmailAddress = l_emailAddress_0
                        });
                    end;
                end, function(_)
                    return v1.resolve();
                end);
            else
                return v1.resolve({
                    l_phone_0, 
                    l_countryCode_0, 
                    l_prefix_0
                });
            end;
        end, function(_)
            return v1.resolve();
        end);
    end;
end;
