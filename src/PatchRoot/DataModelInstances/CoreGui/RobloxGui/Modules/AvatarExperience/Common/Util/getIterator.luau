return function(v0)
    local v1 = 1;
    return {
        getNext = function()
            local v2 = v0[v1];
            v1 = v1 + 1;
            return v2;
        end
    };
end;
