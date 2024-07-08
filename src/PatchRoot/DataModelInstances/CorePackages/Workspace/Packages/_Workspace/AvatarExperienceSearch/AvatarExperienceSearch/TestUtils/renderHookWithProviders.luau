local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.React);
local v3 = require(l_Parent_0.ReactRoblox);
local l_act_0 = v3.act;
local v5 = require(l_script_FirstAncestor_0.TestUtils.makeTestRoot);
return function(v6, v7)
    local v8 = nil;
    local function v9()
        v8 = v6(v7);
        return nil;
    end;
    local function v10()
        return v2.createElement(v5({}), {}, v2.createElement(v9, {}));
    end;
    local v11 = v3.createRoot((Instance.new("Frame")));
    l_act_0(function()
        v11:render(v10());
    end);
    return {
        getResult = function()
            return v8;
        end, 
        cleanup = function()
            v11:unmount();
        end
    };
end;
