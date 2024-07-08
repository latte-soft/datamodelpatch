local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local l_AppPage_0 = require(l_Parent_0.RobloxAppEnums).AppPage;
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
return function()
    return l_useSelector_0(function(v3)
        if v3.Navigation then
            local l_history_0 = v3.Navigation.history;
            if l_history_0 then
                local v5 = l_history_0[#l_history_0];
                return (v5[#v5] and v5[#v5].name) == l_AppPage_0.Chat;
            else
                return false;
            end;
        else
            return true;
        end;
    end);
end;
