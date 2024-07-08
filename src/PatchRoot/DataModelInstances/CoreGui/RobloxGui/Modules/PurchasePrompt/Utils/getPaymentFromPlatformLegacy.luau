local v0 = require(script.Parent.Parent.Enums.PaymentPlatform);
return function(v1, v2, v3)
    if v1 == Enum.Platform.XBoxOne then
        return v0.Xbox;
    elseif v1 == Enum.Platform.IOS then
        if not v2 then
            return v0.Apple;
        else
            return v0.Midas;
        end;
    elseif not (v1 ~= Enum.Platform.Windows and v1 ~= Enum.Platform.OSX) or v1 == Enum.Platform.Linux then
        return v0.Web;
    elseif v1 == Enum.Platform.Android then
        if not v2 then
            if not v3 then
                return v0.Google;
            else
                return v0.Amazon;
            end;
        else
            return v0.Midas;
        end;
    elseif v1 == Enum.Platform.UWP then
        return v0.UWP;
    else
        return v0.None;
    end;
end;
