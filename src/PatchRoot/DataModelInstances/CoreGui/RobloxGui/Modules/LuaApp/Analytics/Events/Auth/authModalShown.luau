local v0 = require(game:GetService("CorePackages").Logging);
return function(v1, v2, v3)
    local v4 = {};
    if v3 then
        if type(v3) ~= "string" then
            v0.warn("Failure logging authModalShown: Expected state to be a string but got " .. type(v3));
            return ;
        else
            v4.state = v3;
        end;
    end;
    v1:setRBXEventStream(v2, "authModalShown", v4);
end;
