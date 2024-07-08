local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.LuaApp.Enum.PaymentPlatform);
local v2 = require(l_Modules_0.LuaApp.Flags.GetFFlagEnablePalisadesPaymentsPlatform);
return function(v3, v4, v5)
    if v3 == Enum.Platform.XBoxOne then
        return v1.Xbox;
    elseif v3 == Enum.Platform.IOS then
        return v1.Apple;
    elseif not (v3 ~= Enum.Platform.Windows and v3 ~= Enum.Platform.OSX) or v3 == Enum.Platform.Linux then
        return v1.Web;
    elseif v3 == Enum.Platform.Android then
        if not v4 then
            if not v5 then
                return v1.Google;
            else
                return v1.Maquettes;
            end;
        else
            return v1.Amazon;
        end;
    elseif v3 == Enum.Platform.UWP then
        return v1.UWP;
    elseif v2() and v3 == Enum.Platform.PS4 then
        return v1.Palisades;
    else
        return v1.None;
    end;
end;
