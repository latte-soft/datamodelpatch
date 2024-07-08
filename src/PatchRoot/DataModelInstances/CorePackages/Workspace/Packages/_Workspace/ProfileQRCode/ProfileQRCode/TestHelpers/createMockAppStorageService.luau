return function(v0)
    return {
        GetItem = function(_, _)
            if not v0 then
                return "true";
            else
                return v0;
            end;
        end, 
        SetItem = function(_, _, _)
        end, 
        Flush = function(_)
        end
    };
end;
