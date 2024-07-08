local v0 = require(script.Parent.Parent.Flags.GetFFlagEnablePerformPurchaseGCSHandling);
isGenericChallengeResponse = function(v1)
    if type(v1) ~= "string" then
        return false;
    else
        local v2 = v0();
        if v2 then
            v2 = false;
            if v1:match("rblx%-challenge%-response") ~= nil then
                v2 = false;
                if v1:match("rblx%-challenge%-id") ~= nil then
                    v2 = false;
                    if v1:match("rblx%-challenge%-metadata") ~= nil then
                        v2 = v1:match("rblx%-challenge%-type") ~= nil;
                    end;
                end;
            end;
        end;
        return v2;
    end;
end;
return isGenericChallengeResponse;
