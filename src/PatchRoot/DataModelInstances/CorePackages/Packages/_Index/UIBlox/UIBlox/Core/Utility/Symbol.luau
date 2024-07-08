return {
    named = function(v0)
        assert(type(v0) == "string", "Symbols must be created using a string name");
        local v1 = newproxy(true);
        local v2 = ("Symbol(%s)"):format(v0);
        getmetatable(v1).__tostring = function()
            return v2;
        end;
        return v1;
    end, 
    unnamed = function()
        local v3 = newproxy(true);
        getmetatable(v3).__tostring = function()
            return "Unnamed Symbol";
        end;
        return v3;
    end
};
