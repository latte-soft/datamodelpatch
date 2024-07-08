local l_script_FirstAncestor_0 = script:FindFirstAncestor("ExpChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_script_FirstAncestor_0.Timer);
local v5 = require(l_Parent_0.UIBlox);
local l_Images_0 = v5.App.ImageSet.Images;
local l_ImageSetLabel_0 = v5.Core.ImageSet.ImageSetLabel;
local l_Config_0 = v5.Config;
local v9 = require(l_script_FirstAncestor_0.Localization);
local l_GameSettings_0 = UserSettings().GameSettings;
local v11 = v2.Component:extend("ChatTranslationFTUX");
v11.defaultProps = {
    timer = v4.new(10)
};
local v12 = nil;
local v13 = nil;
if not l_Config_0.enableFontNameMapping then
    v12 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    v13 = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
else
    v12 = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Bold, Enum.FontStyle.Normal);
    v13 = Font.new("rbxasset://fonts/families/BuilderSans.json", Enum.FontWeight.Medium, Enum.FontStyle.Normal);
end;
local v14 = {
    dampingRatio = 1, 
    frequency = 2
};
if game:GetEngineFeature("TextChatServiceSettingsSaved") then
    l_GameSettings_0.ChatTranslationFTUXShown = true;
end;
v11.init = function(v15)
    local v16, v17 = v2.createBinding(1);
    v15.transparency = v16;
    v15.updateTransparency = v17;
    v15.transparencyMotor = v3.createSingleMotor(1);
    v15.transparencyMotor:onStep(v15.updateTransparency);
end;
v11.render = function(v18)
    return v2.createElement("Frame", {
        AutomaticSize = Enum.AutomaticSize.XY, 
        Position = UDim2.new(0, 10, 0, 20), 
        Size = UDim2.new(0.25, 0, 0, 0), 
        BackgroundTransparency = 1
    }, {
        BubbleTail = v2.createElement(l_ImageSetLabel_0, {
            Size = UDim2.new(0, 15, 0, 10), 
            BackgroundTransparency = 1, 
            ImageTransparency = v18.transparency, 
            ImageColor3 = Color3.new(0.5, 0.5, 0.5), 
            Image = l_Images_0["component_assets/triangleUp_16"], 
            Position = UDim2.new(0, 15, 0, -10), 
            ZIndex = 100
        }), 
        BubbleBody = v2.createElement("Frame", {
            Active = true, 
            BackgroundTransparency = v18.transparency, 
            BackgroundColor3 = Color3.new(0.5, 0.5, 0.5), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            ZIndex = 100, 
            Style = Enum.FrameStyle.Custom, 
            [v2.Event.TouchTap] = function()
                v18:fadeOut();
            end, 
            [v2.Event.InputEnded] = function(_, v20)
                if v20.UserInputType == Enum.UserInputType.MouseButton1 then
                    v18:fadeOut();
                end;
            end
        }, {
            RoundCorners = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            SizeConstraint = v2.createElement("UISizeConstraint", {
                MaxSize = Vector2.new(300, 400)
            }), 
            Padding = v2.createElement("UIPadding", {
                PaddingRight = UDim.new(0, 10), 
                PaddingTop = UDim.new(0, 10), 
                PaddingBottom = UDim.new(0, 10), 
                PaddingLeft = UDim.new(0, 10)
            }), 
            Layout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 10)
            }), 
            Title = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = if v18.props.FTUXTitle ~= "" then v18.props.FTUXTitle else "Chat translation is on for supported languages", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextTransparency = v18.transparency, 
                FontFace = v12, 
                TextSize = 16, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                ZIndex = 101, 
                LayoutOrder = 1
            }), 
            Body = v2.createElement("TextLabel", {
                AutomaticSize = Enum.AutomaticSize.Y, 
                Size = UDim2.new(1, 0, 0, 0), 
                Text = if v18.props.FTUXBody ~= "" then v18.props.FTUXBody else "Messages you send and receive will be translated automatically", 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                TextTransparency = v18.transparency, 
                FontFace = v13, 
                TextSize = 16, 
                TextWrapped = true, 
                BackgroundTransparency = 1, 
                TextColor3 = Color3.new(1, 1, 1), 
                ZIndex = 101, 
                LayoutOrder = 2
            })
        })
    });
end;
v11.fadeOut = function(v21)
    if not v21.isFadingOut then
        v21.isFadingOut = true;
        v21.transparencyMotor:setGoal((function(v22)
            return v3.spring(v22, v14);
        end)(1));
    end;
end;
v11.didMount = function(v23)
    v23.transparencyMotor:setGoal((function(v24)
        return v3.spring(v24, v14);
    end)(0));
    v23.props.timer:start():andThen(function()
        v23:fadeOut();
    end);
end;
v11.willUnmount = function(v25)
    v25.transparencyMotor:destroy();
end;
return v9.connect(function()
    return {
        FTUXTitle = "CoreScripts.TextChat.ChatTranslation.FTUX.TitleNew", 
        FTUXBody = "CoreScripts.TextChat.ChatTranslation.FTUX.BodyNew"
    };
end)(v11);
