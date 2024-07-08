local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Promise);
local v2 = require(l_Modules_0.LuaApp.Http.Requests.GetVerifiedEmail);
local v3 = require(l_Modules_0.LuaApp.Enum.OverlayType);
local v4 = require(l_Modules_0.LuaApp.Actions.SetCentralOverlay);
local v5 = require(game:GetService("CorePackages").Cryo);
return function(v6, v7, v8)
    return function(v9)
        return v2(v6):andThen(function(v10)
            local l_verified_0 = v10.responseBody.verified;
            local l_emailAddress_0 = v10.responseBody.emailAddress;
            local v13 = l_emailAddress_0 and l_emailAddress_0 ~= "";
            local l_l_verified_0_0 = l_verified_0;
            if v7 then
                l_l_verified_0_0 = l_l_verified_0_0 or v13;
            end;
            if not l_l_verified_0_0 then
                local v15 = {
                    emailAddress = l_emailAddress_0
                };
                if v8 then
                    v15 = v5.Dictionary.join(v15, v8);
                end;
                v9:dispatch(v4(v3.EmailVerificationUpsellOverlay, v15));
                return v1.reject();
            else
                return v1.resolve({
                    EmailAddress = l_emailAddress_0
                });
            end;
        end, function(_)
            return v1.resolve();
        end);
    end;
end;
