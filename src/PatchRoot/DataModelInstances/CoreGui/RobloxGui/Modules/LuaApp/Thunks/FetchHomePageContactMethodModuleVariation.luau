local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Http.Requests.GetHomePageUpsellCardVariation);
local v2 = require(l_Modules_0.LuaApp.Actions.SetHomePageUpsellCardVariation);
return function(v3)
    return function(v4)
        return v1(v3):andThen(function(v5)
            if not v5 or not v5.responseBody then
                v4:dispatch(v2("", "", ""));
                return ;
            else
                local l_responseBody_0 = v5.responseBody;
                v4:dispatch(v2(l_responseBody_0.upsellCardType or "", l_responseBody_0.localizedTitleTextOverride or "", l_responseBody_0.localizedBodyTextOverride or ""));
                return ;
            end;
        end, function(_)
            v4:dispatch(v2("", "", ""));
        end);
    end;
end;
