local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v1 = require(l_Modules_0.Common.Roact);
local v2 = require(l_Modules_0.Shell.GlobalSettings);
local v3 = require(l_Modules_0.Shell.Components.ContextActionEvent);
local v4 = v1.PureComponent:extend("BaseScreen");
v4.init = function(v5)
    v5.onBack = function(_, v7, _)
        if v7 == Enum.UserInputState.Begin then
            v5._seenPressed = true;
            return ;
        else
            if not (not (v7 == Enum.UserInputState.End) or not v5._seenPressed) then
                v5.props.onUnmount();
            end;
            return ;
        end;
    end;
    v5.onCreate = function(_)
    end;
end;
v4.render = function(v10)
    local l_BackPageTitle_0 = v10.props.BackPageTitle;
    local v12 = v10.props.OnCreate or v10.onCreate;
    return v1.createElement("Frame", {
        [v1.Ref] = function(v13)
            v12(v13);
        end, 
        Size = UDim2.new(1, 0, 1, 0), 
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        BackgroundTransparency = 1
    }, {
        backImage = v1.createElement("ImageButton", {
            Size = UDim2.new(0, 48, 0, 48), 
            BackgroundTransparency = 1, 
            Image = "rbxasset://textures/ui/Shell/Icons/BackIcon@1080.png", 
            Selectable = false, 
            [v1.Event.Activated] = v10.onBack
        }), 
        BackPageTitleLabel = v1.createElement("TextLabel", {
            Size = UDim2.new(0, 0, 0, 48), 
            Position = UDim2.new(0, 56, 0, 24), 
            AnchorPoint = Vector2.new(0, 0.5), 
            BackgroundTransparency = 1, 
            Font = v2.RegularFont, 
            FontSize = v2.ButtonSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextColor3 = v2.WhiteTextColor, 
            Text = l_BackPageTitle_0
        }), 
        BackConnector = v1.createElement(v3, {
            name = "GoBackTo" .. l_BackPageTitle_0, 
            callback = v10.onBack, 
            binds = {
                Enum.KeyCode.ButtonB
            }
        }), 
        view = v1.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -50), 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 50)
        }, {
            v10.props.Content
        })
    });
end;
return v4;
