local v0 = require(script:FindFirstAncestor("RoduxFriends").Parent.llama);
return function(v1, v2)
    if v1 then
        if v0.List.find(v1, v2) then
            return v1;
        else
            return v0.List.join(v1, {
                v2
            });
        end;
    else
        return {
            v2
        };
    end;
end;
