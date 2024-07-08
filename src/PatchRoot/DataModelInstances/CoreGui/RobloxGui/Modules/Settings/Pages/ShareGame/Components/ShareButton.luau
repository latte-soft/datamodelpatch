local v0 = require(game:GetService("CorePackages").Roact);
local l_RobloxGui_0 = game:GetService("CoreGui"):WaitForChild("RobloxGui");
local v2 = require(l_RobloxGui_0.Modules.Settings.Theme);
local v3 = require(l_RobloxGui_0.Modules.Settings.Flags.GetFFlagInviteFriendsDesignUpdates);
local v4 = v2.font(Enum.Font.SourceSansSemibold, "Semibold");
local v5 = v2.textSize(19);
local v6 = Color3.fromRGB(222, 225, 227);
local v7 = Color3.fromRGB(255, 255, 255);
local v8 = v0.PureComponent:extend("ShareButton");
v8.init = function(v9)
    v9.state = {
        isHovering = false
    };
end;
v8.render = function(v10)
    local l_size_0 = v10.props.size;
    local l_layoutOrder_0 = v10.props.layoutOrder;
    local l_onShare_0 = v10.props.onShare;
    local l_isEnabled_0 = v10.props.isEnabled;
    local l_text_0 = v10.props.text;
    local v16 = {};
    if not v3() or not v2.UIBloxThemeEnabled then
        v16.UICorner = v0.createElement("UICorner", {
            CornerRadius = UDim.new(0, 4)
        });
    else
        v16.Border = v0.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = if not not v10.state.isHovering and l_isEnabled_0 then v6 else v7, 
            Thickness = v2.DefaultStokeThickness, 
            Transparency = not l_isEnabled_0 and 0.5 or 0
        });
        v16.UICorner = v0.createElement("UICorner", {
            CornerRadius = v2.DefaultCornerRadius
        });
    end;
    return v0.createElement("TextButton", {
        LayoutOrder = l_layoutOrder_0, 
        Size = l_size_0, 
        Text = l_text_0, 
        TextSize = v5, 
        Font = v4, 
        AutoButtonColor = false, 
        BackgroundColor3 = if not not v10.state.isHovering and l_isEnabled_0 then v6 else v7, 
        BorderSizePixel = not v3() and 0 or nil, 
        Transparency = not l_isEnabled_0 and 0.5 or 0, 
        [v0.Event.Activated] = function()
            if l_isEnabled_0 then
                l_onShare_0();
            end;
        end, 
        [v0.Event.InputBegan] = function()
            v10:setState({
                isHovering = true
            });
        end, 
        [v0.Event.InputEnded] = function()
            v10:setState({
                isHovering = false
            });
        end
    }, v16);
end;
return v8;
