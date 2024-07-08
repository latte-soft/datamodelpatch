local v0 = require(game:GetService("CorePackages").Logging);
return function(v1, v2, v3, v4, v5, v6)
    local v7 = {};
    if v3 then
        if type(v3) ~= "string" then
            v0.warn("Failure logging authFormInteraction: Expected field to be a string but got " .. type(v3));
            return ;
        else
            v7.field = v3;
        end;
    end;
    if v4 then
        if type(v4) ~= "string" then
            v0.warn("Failure logging authFormInteraction: Expected state to be a string but got " .. type(v4));
            return ;
        else
            v7.state = v4;
        end;
    end;
    if v5 then
        if type(v5) ~= "string" then
            v0.warn("Failure logging authFormInteraction: Expected origin to be a string but got " .. type(v5));
            return ;
        else
            v7.origin = v5;
        end;
    end;
    if v6 then
        if type(v6) ~= "string" then
            v0.warn("Failure logging authFormInteraction: Expected entered to be a string but got " .. type(v6));
            return ;
        else
            v7.entered = v6;
        end;
    end;
    v1:setRBXEventStream(v2, "authFormInteraction", v7);
end;
