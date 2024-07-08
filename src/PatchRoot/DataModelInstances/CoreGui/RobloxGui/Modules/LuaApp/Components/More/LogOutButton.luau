local v0 = require(game:GetService("CorePackages").Roact);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_Modules_0.LuaApp.ArgCheck);
local v3 = require(l_Modules_0.LuaApp.withLocalization);
local v4 = require(l_Modules_0.LuaApp.Components.SecondaryButtonRetheme);
local _ = require(l_Modules_0.LuaApp.Hooks.useAppPolicy);
return function(v6)
    local l_onActivated_0 = v6.onActivated;
    v2.isType(l_onActivated_0, "function", "onActivated");
    return v3({
        logOutText = "Application.Logout.Action.Logout"
    })(function(v8)
        return v0.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0.5, 0, 0, 0), 
            Size = UDim2.new(1, 0, 1, 0)
        }, {
            UIPadding = v0.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 24), 
                PaddingRight = UDim.new(0, 24)
            }), 
            UISizeConstraint = v0.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(688, math.huge)
            }), 
            LogOutButtonFrame = v0.createElement("Frame", {
                AnchorPoint = Vector2.new(0.5, 0), 
                BackgroundTransparency = 1, 
                Position = UDim2.new(0.5, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0)
            }, {
                LogOutButton = v0.createElement(v4, {
                    Size = UDim2.new(1, 0, 1, 0), 
                    Text = v8.logOutText, 
                    isLoading = false, 
                    isDisabled = false, 
                    onActivated = l_onActivated_0
                })
            })
        });
    end);
end;
