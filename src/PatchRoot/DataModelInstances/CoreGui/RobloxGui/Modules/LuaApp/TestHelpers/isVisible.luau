return function(v0)
    if v0.Visible and v0.IsNotOccluded then
        local l_Parent_0 = v0.Parent;
        while l_Parent_0 ~= nil do
            if not l_Parent_0:IsA("LayerCollector") then
                if not l_Parent_0:IsA("GuiObject") or l_Parent_0.Visible then
                    l_Parent_0 = l_Parent_0.Parent;
                    if not (l_Parent_0 ~= game) then
                        break;
                    end;
                else
                    return false;
                end;
            elseif l_Parent_0.Enabled then
                local v2 = false;
                if l_Parent_0.Parent ~= nil then
                    v2 = l_Parent_0.Parent:IsA("BasePlayerGui") and l_Parent_0:IsDescendantOf(game);
                end;
                return v2;
            else
                return false;
            end;
        end;
        return l_Parent_0 ~= nil;
    else
        return false;
    end;
end;
