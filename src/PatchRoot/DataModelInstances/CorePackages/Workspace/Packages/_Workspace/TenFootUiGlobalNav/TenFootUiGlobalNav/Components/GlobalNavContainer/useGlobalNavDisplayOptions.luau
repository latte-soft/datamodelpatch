local l_Parent_0 = script:FindFirstAncestor("TenFootUiGlobalNav").Parent;
local v1 = require(l_Parent_0.React);
local l_GlobalNavDisplayOption_0 = require(l_Parent_0.TenFootUiCommon).TenFootUiRNTypes.GlobalNavDisplayOption;
return function(v3, v4)
    local v5, v6 = v1.useState(l_GlobalNavDisplayOption_0.ShowAll);
    v1.useEffect(function()
        local v7 = v4(v3);
        if not v7 or not v7.globalNavDisplayOption then
            v6(l_GlobalNavDisplayOption_0.ShowAll);
            return ;
        else
            v6(v7.globalNavDisplayOption);
            return ;
        end;
    end, {
        v3, 
        v4
    });
    return v5;
end;
