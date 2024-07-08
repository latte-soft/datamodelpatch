return {
    config = function(v0)
        v0 = v0 or {};
        local v1 = v0.state or {};
        return {
            dispatch = v0.dispatch or function(v2, v3)
                if type(v3) == "function" then
                    v3(v2);
                end;
            end, 
            getState = function()
                return v1;
            end, 
            setState = function(_, v5)
                v1 = v5;
            end
        };
    end
};
