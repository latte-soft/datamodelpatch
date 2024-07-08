local l_UserInputService_0 = game:GetService("UserInputService");
local v1 = {};
local function _()
    local v2 = v1[#v1];
    if not v2 then
        l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
        return ;
    else
        l_UserInputService_0.OverrideMouseIconBehavior = v2[2];
        return ;
    end;
end;
return {
    push = function(v4, v5)
        local v6 = true;
        if type(v4) ~= "userdata" then
            v6 = type(v4) == "string";
        end;
        assert(v6, "key");
        assert(typeof(v5) == "EnumItem", "behavior");
        assert(v5.EnumType == Enum.OverrideMouseIconBehavior, "behavior.EnumType");
        for v7, v8 in ipairs(v1) do
            if v8[1] == v4 then
                table.remove(v1, v7);
                break;
            end;
        end;
        table.insert(v1, {
            v4, 
            v5
        });
        local v9 = v1[#v1];
        if not v9 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            return ;
        else
            l_UserInputService_0.OverrideMouseIconBehavior = v9[2];
            return ;
        end;
    end, 
    pop = function(v10)
        local v11 = true;
        if type(v10) ~= "userdata" then
            v11 = type(v10) == "string";
        end;
        assert(v11, "key");
        local v12 = nil;
        for v13, v14 in ipairs(v1) do
            if v14[1] == v10 then
                v12 = v13;
                break;
            end;
        end;
        if v12 then
            table.remove(v1, v12);
        end;
        v11 = v1[#v1];
        if not v11 then
            l_UserInputService_0.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None;
            return ;
        else
            l_UserInputService_0.OverrideMouseIconBehavior = v11[2];
            return ;
        end;
    end
};
