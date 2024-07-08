return {
    maybe = function(v0)
        local _, v2, v3 = xpcall(function()
            return v0(), true;
        end, function()
        end);
        if not v3 then
            return nil;
        else
            return v2;
        end;
    end
};
