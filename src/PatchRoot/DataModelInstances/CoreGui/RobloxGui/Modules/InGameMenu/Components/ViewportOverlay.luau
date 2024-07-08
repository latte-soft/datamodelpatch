local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_UIBlox_0 = v0.UIBlox;
local l_t_0 = v0.t;
local l_withStyle_0 = l_UIBlox_0.Core.Style.withStyle;
local l_Parent_0 = script.Parent.Parent;
local v7 = require(l_Parent_0.Resources.Constants);
local v8 = require(l_Parent_0.GlobalConfig);
local v9 = require(l_Parent_0.Thunks.CloseMenu);
local v10 = Vector2.new(0, 0);
local v11 = l_t_0.strictInterface({
    currentPage = l_t_0.string, 
    open = l_t_0.boolean, 
    onActivated = l_t_0.callback, 
    occupiedWidth = l_t_0.number, 
    screenSize = l_t_0.Vector2
});
return l_RoactRodux_0.UNSTABLE_connect2(function(v12, _)
    return {
        currentPage = v12.menuPage, 
        open = v12.isMenuOpen, 
        occupiedWidth = 464, 
        screenSize = v12.screenSize
    };
end, function(v14)
    return {
        onActivated = function()
            v14(v9);
        end
    };
end)(function(v15)
    if v8.propValidation then
        assert(v11(v15));
    end;
    if v15.screenSize == v10 then
        return nil;
    else
        local v16 = v15.currentPage == v7.InitalPageKey;
        return l_withStyle_0(function(v17)
            return l_Roact_0.createElement("Frame", {
                BackgroundColor3 = v17.Theme.Overlay.Color, 
                BackgroundTransparency = v17.Theme.Overlay.Transparency, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Visible = not v16 and v15.open, 
                ZIndex = 0
            }, {
                InputCapturer = l_Roact_0.createElement("TextButton", {
                    AnchorPoint = Vector2.new(1, 0), 
                    BackgroundTransparency = 1, 
                    Position = UDim2.new(1, 0, 0, 0), 
                    Size = UDim2.new(1, -v15.occupiedWidth, 1, 0), 
                    Text = "", 
                    [l_Roact_0.Event.Activated] = v15.onActivated
                })
            });
        end);
    end;
end);
