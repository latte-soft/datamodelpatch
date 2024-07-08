local l_CorePackages_0 = game:GetService("CorePackages");
local v1 = require(l_CorePackages_0.Packages.React);
local v2 = require(l_CorePackages_0.Packages.RoactNavigation);
local l_useNavigation_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).Hooks.useNavigation;
return function(v4)
    local v5 = l_useNavigation_0();
    v1.useEffect(function()
        local v6 = {};
        local function _(v7, v8)
            if v4[v8] then
                table.insert(v6, v5.addListener(v7, v4[v8]));
            end;
        end;
        local l_WillFocus_0 = v2.Events.WillFocus;
        if v4.onWillFocus then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onWillFocus));
        end;
        l_WillFocus_0 = v2.Events.WillBlur;
        if v4.onWillBlur then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onWillBlur));
        end;
        l_WillFocus_0 = v2.Events.DidFocus;
        if v4.onDidFocus then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onDidFocus));
        end;
        l_WillFocus_0 = v2.Events.DidBlur;
        if v4.onDidBlur then
            table.insert(v6, v5.addListener(l_WillFocus_0, v4.onDidBlur));
        end;
        return function()
            for _, v12 in v6, nil, nil do
                v12.remove();
            end;
        end;
    end, {
        v4.onWillFocus, 
        v4.onWillBlur, 
        v4.onDidFocus, 
        v4.onDidBlur
    });
end;
