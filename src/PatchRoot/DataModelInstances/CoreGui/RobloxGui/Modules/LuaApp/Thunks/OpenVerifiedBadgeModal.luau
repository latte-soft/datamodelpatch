local _ = game:GetService("CorePackages");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Modules");
local v2 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateDown);
local v3 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateFromWebView);
local v4 = require(l_script_FirstAncestor_0.LuaApp.Thunks.NavigateBack);
local v5 = require(l_script_FirstAncestor_0.LuaApp.AppPage);
return function()
    return function(v6)
        local function v7()
            v6:dispatch(v4());
        end;
        v6:dispatch(v2({
            name = v5.VerifiedBadgeModal, 
            extraProps = {
                onConfirm = function()
                    v6:dispatch(v3({
                        name = v5.GenericWebPage, 
                        detail = "https://en.help.roblox.com/hc/en-us/articles/7997207259156", 
                        extraProps = {
                            onClose = v7
                        }
                    }));
                end, 
                onClose = v7
            }
        }));
    end;
end;
