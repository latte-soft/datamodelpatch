return function(_, v1, v2)
    local l_v1_0 = v1;
    local v4 = false;
    while l_v1_0 ~= nil do
        if l_v1_0 == v2 then
            v4 = true;
            break;
        else
            l_v1_0 = l_v1_0.Parent;
        end;
    end;
    return {
        pass = v4, 
        message = function()
            return string.format("Expected `%s` %sto be a descendant of `%s`", v1:GetFullName(), not v4 and "" or "not ", v2:GetFullName());
        end
    };
end;
