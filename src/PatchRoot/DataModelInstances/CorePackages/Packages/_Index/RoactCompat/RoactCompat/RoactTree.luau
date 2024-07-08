local l_Parent_0 = script.Parent.Parent;
local l_inspect_0 = require(l_Parent_0.LuauPolyfill).util.inspect;
local v2 = require(l_Parent_0.ReactRoblox);
local v3 = require(script.Parent.warnOnce);
return {
    mount = function(v4, v5, v6)
        if not (not _G.__DEV__ or not _G.__COMPAT_WARNINGS__) then
            v3("mount", "Please use the createRoot API in ReactRoblox");
        end;
        if v5 ~= nil and typeof(v5) ~= "Instance" then
            error(string.format("Cannot mount element (`%s`) into a parent that is not a Roblox Instance (got type `%s`) \n%s", not v4 and "<unknown>" or tostring(v4.type), typeof(v5), (function()
                if v5 ~= nil then
                    return l_inspect_0(v5);
                else
                    return "";
                end;
            end)()));
        end;
        local v7 = nil;
        v7 = if not _G.__ROACT_17_COMPAT_LEGACY_ROOT__ then v2.createRoot(Instance.new("Folder")) else v2.createLegacyRoot(Instance.new("Folder"));
        if v5 == nil then
            local l_Folder_0 = Instance.new("Folder");
            l_Folder_0.Name = "Target";
            v5 = l_Folder_0;
        end;
        if v6 == nil then
            v6 = not _G.__ROACT_17_COMPAT_LEGACY_ROOT__ and "ReactRoot" or "ReactLegacyRoot";
        end;
        if not _G.__ROACT_17_INLINE_ACT__ then
            v7:render(v2.createPortal({
                [v6] = v4
            }, v5));
        else
            v2.act(function()
                v7:render(v2.createPortal({
                    [v6] = v4
                }, v5));
            end);
        end;
        return {
            root = v7, 
            parent = v5, 
            key = v6
        };
    end, 
    update = function(v9, v10)
        if not (not _G.__DEV__ or not _G.__COMPAT_WARNINGS__) then
            v3("update", "Please use the createRoot API in ReactRoblox");
        end;
        local l_key_0 = v9.key;
        local l_parent_0 = v9.parent;
        if not _G.__ROACT_17_INLINE_ACT__ then
            v9.root:render(v2.createPortal({
                [l_key_0] = v10
            }, l_parent_0));
            return v9;
        else
            v2.act(function()
                v9.root:render(v2.createPortal({
                    [l_key_0] = v10
                }, l_parent_0));
            end);
            return v9;
        end;
    end, 
    unmount = function(v13)
        if not (not _G.__DEV__ or not _G.__COMPAT_WARNINGS__) then
            v3("unmount", "Please use the createRoot API in ReactRoblox");
        end;
        if not _G.__ROACT_17_INLINE_ACT__ then
            v13.root:unmount();
            return ;
        else
            v2.act(function()
                v13.root:unmount();
            end);
            return ;
        end;
    end
};
