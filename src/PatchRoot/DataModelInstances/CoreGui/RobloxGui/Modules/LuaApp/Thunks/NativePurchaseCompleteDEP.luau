local l_CoreGui_0 = game:GetService("CoreGui");
local l_Players_0 = game:GetService("Players");
local v2 = require(l_CoreGui_0.RobloxGui.Modules.LuaApp.Actions.SetUserMembershipType);
return function(v3, v4)
    return function(v5)
        local v6 = v5:getState();
        if v4 then
            for _, v8 in pairs(v6.IAPProducts.Subscriptions) do
                if v8.mobileProductId == v3 then
                    v5:dispatch(v2(tostring(l_Players_0.LocalPlayer.UserId), Enum.MembershipType.Premium));
                    return ;
                end;
            end;
        end;
    end;
end;
