local l_Parent_0 = script:FindFirstAncestor("Style").Parent;
local v1 = require(l_Parent_0.ArgCheck);
local v2 = require(l_Parent_0.Cryo);
local v3 = require(l_Parent_0.React);
local v4 = require(l_Parent_0.RobloxAppHooks);
local _ = require(l_Parent_0.RobloxAppEnums);
local l_useUiModeInfo_0 = v4.useUiModeInfo;
local l_Context_0 = require(l_Parent_0.UIBlox).Style.Context;
local v8 = require(script.Parent.DesignTokenContext);
return function(v9)
    local v10 = v3.useContext(l_Context_0);
    local v11 = v9.uiModeInfo or l_useUiModeInfo_0();
    local l_tokenMappers_0 = v9.tokenMappers;
    local v13 = v2.Dictionary.keys(l_tokenMappers_0);
    local l_Tokens_0 = v10.style.Tokens;
    v1.assert(l_Tokens_0, "Design Tokens not found, ensure AppStyleProvider has been configured correctly.");
    if not l_Tokens_0.LuaApps then
        l_Tokens_0 = v2.Dictionary.join(l_Tokens_0, {
            LuaApps = {}
        });
    end;
    l_Tokens_0 = v2.List.foldLeft(v13, function(v15, v16)
        local v17 = table.clone(v15.LuaApps);
        v17[v16] = l_tokenMappers_0[v16](v11, l_Tokens_0);
        return v2.Dictionary.join(v15, {
            LuaApps = v17
        });
    end, l_Tokens_0);
    return v3.createElement(v8.Provider, {
        value = l_Tokens_0
    }, v9.children);
end;
