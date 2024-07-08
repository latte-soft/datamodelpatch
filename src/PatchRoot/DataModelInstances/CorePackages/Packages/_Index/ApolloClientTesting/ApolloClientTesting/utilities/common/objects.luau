return {
    isNonNullObject = function(v0)
        local v1 = false;
        if v0 ~= nil then
            v1 = type(v0) == "table";
        end;
        return v1;
    end
};
