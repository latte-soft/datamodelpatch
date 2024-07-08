local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.AppPage);
local v2 = require(l_Modules_0.LuaApp.Enum.Challenge.Type);
local v3 = require(l_Modules_0.LuaApp.Thunks.NavigateDown);
return function(v4, v5)
    return function(v6)
        local v7 = v4.challengeType == v2.Captcha;
        if v5 ~= nil then
            v7 = v5;
        end;
        v6:dispatch(v3({
            name = not not v7 and v1.ChallengeHybridOverlayPage or v1.ChallengeHybridWebView, 
            extraProps = v4
        }));
    end;
end;
