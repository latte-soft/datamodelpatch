local v0 = require(script:FindFirstAncestor("SocialTestHelpers").dependencies);
local l_ReactRoblox_0 = v0.ReactRoblox;
local l_act_0 = l_ReactRoblox_0.act;
local l_Dash_0 = v0.Dash;
local v4 = require(script.Parent.createTreeWithProviders);
return function(v5, v6)
    local v7 = nil;
    local function v9(v8)
        v7 = {
            v5(v8)
        };
        return nil;
    end;
    local function v13(v10, v11)
        local v12 = l_Dash_0.join(v6 or {}, v11 or {});
        v12.props = l_Dash_0.join(v12.props or {}, v10 or {});
        return (v4(v9, v12));
    end;
    local v14 = l_ReactRoblox_0.createRoot((Instance.new("Frame")));
    l_act_0(function()
        v14:render((v13({})));
    end);
    return {
        result = if not v7 then nil else v7[1], 
        getResult = function()
            if not v7 then
                return nil;
            else
                return v7[1];
            end;
        end, 
        getResults = function()
            return unpack(v7);
        end, 
        rerender = function(v15, v16)
            l_act_0(function()
                v14:render((v13(v15, v16)));
            end);
        end, 
        cleanup = function()
            v14:unmount();
        end
    };
end;
