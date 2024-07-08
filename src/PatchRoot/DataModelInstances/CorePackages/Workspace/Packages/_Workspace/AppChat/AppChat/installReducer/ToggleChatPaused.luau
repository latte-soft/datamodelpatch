local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local v1 = require(l_script_FirstAncestor_0.Parent.Rodux);
local v2 = require(l_script_FirstAncestor_0.Actions.ToggleChatPaused);
if not game:DefineFastFlag("LuaAppChatTabBarVisibilityFix", false) then
    return v1.createReducer(true, {
        [v2.name] = function(_, v4)
            return v4.value;
        end
    });
else
    return v1.createReducer(false, {});
end;
