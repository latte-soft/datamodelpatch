local v0 = require(game:GetService("CorePackages").Packages.React);
return function(v1)
    local v2, v3 = v0.useState(v1:getIsLarge());
    v0.useEffect(function()
        local v4 = v1:connect(function()
            v3(v1:getIsLarge());
        end);
        if v2 ~= v1:getIsLarge() then
            v3(v1:getIsLarge());
        end;
        return function()
            v4:disconnect();
        end;
    end, {
        v1
    });
    return v2;
end;
