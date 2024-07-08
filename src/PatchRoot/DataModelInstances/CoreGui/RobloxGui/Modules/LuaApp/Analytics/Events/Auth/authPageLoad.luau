local v0 = require(game:GetService("CorePackages").Logging);
return function(v1, v2, v3, v4)
    local v5 = {};
    if v3 then
        if type(v3) ~= "string" then
            v0.warn("Failure logging authPageLoad: Expected state to be a string but got " .. type(v3));
            return ;
        else
            v5.state = v3;
        end;
    end;
    if v4 ~= nil then
        if type(v4) ~= "boolean" then
            v0.warn("Failure logging authPageLoad: Expected isAltAttempt to be a boolean but got " .. type(v4));
            return ;
        else
            v5.is_alt_attempt = v4;
        end;
    end;
    v1:setRBXEventStream(v2, "authPageload", v5);
end;
