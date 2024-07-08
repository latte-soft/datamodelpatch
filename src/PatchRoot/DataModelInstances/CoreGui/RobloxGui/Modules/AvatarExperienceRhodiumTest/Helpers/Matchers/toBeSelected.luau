local l_GuiService_0 = game:GetService("GuiService");
local function _(v1)
    if not v1 then
        return "nil";
    else
        return (v1:GetFullName());
    end;
end;
return function(_, v4)
    if typeof(v4) == "table" then
        v4 = v4:getRbxInstance();
    end;
    local l_SelectedCoreObject_0 = l_GuiService_0.SelectedCoreObject;
    local v6 = false;
    while l_SelectedCoreObject_0 ~= nil do
        if l_SelectedCoreObject_0 == v4 then
            v6 = true;
            break;
        else
            l_SelectedCoreObject_0 = l_SelectedCoreObject_0.Parent;
        end;
    end;
    local l_v4_0 = v4;
    local v8 = not l_v4_0 and "nil" or l_v4_0:GetFullName();
    local l_SelectedCoreObject_1 = l_GuiService_0.SelectedCoreObject;
    l_v4_0 = not l_SelectedCoreObject_1 and "nil" or l_SelectedCoreObject_1:GetFullName();
    return {
        pass = v6, 
        message = function()
            if not v6 then
                return string.format("Expected `%s` to be selected but actual selection was `%s`", v8, l_v4_0);
            else
                return string.format("Expected `%s` not to be selected but its descendant `%s` was", v8, l_v4_0);
            end;
        end
    };
end;
