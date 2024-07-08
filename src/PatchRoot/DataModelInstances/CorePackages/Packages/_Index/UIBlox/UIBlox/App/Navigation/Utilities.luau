local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local _ = require(l_Parent_1.Enums.InputType);
local v3 = require(l_Parent_1.Parent.Cryo);
local _ = require(l_Parent_0.ShortcutBar.Types);
local v5 = {};
local _ = function(v6)
    return function(v7, _)
        local l_icon_0 = v7.icon;
        if typeof(l_icon_0) ~= "string" and not l_icon_0.Image then
            if not l_icon_0[v6] then
                return ;
            else
                return v3.Dictionary.join(v7, {
                    icon = l_icon_0[v6]
                });
            end;
        else
            return ;
        end;
    end;
end;
v5.filterItems = function(v11, v12)
    local v17 = v3.List.filter(v11, function(v13, _)
        local l_icon_1 = v13.icon;
        local v16 = true;
        if typeof(l_icon_1) ~= "string" then
            v16 = l_icon_1.Image;
        end;
        return v16;
    end);
    if v12 then
        assert(v12, "Assert inputType not nil at this point to silence type checker");
        return (v3.List.join(v17, v3.List.filterMap(v11, function(v18, _)
            local l_icon_2 = v18.icon;
            if typeof(l_icon_2) ~= "string" and not l_icon_2.Image then
                if not l_icon_2[v12] then
                    return ;
                else
                    return v3.Dictionary.join(v18, {
                        icon = l_icon_2[v12]
                    });
                end;
            else
                return ;
            end;
        end)));
    else
        return v17;
    end;
end;
return v5;
