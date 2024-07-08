local l_Parent_0 = script:FindFirstAncestor("AppChat").Parent;
local v1 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v3 = require(l_Parent_0.Otter);
local v4 = require(l_Parent_0.UIBlox);
local l_Images_0 = v4.App.ImageSet.Images;
local l_ImageSetLabel_0 = v4.Core.ImageSet.ImageSetLabel;
local v7 = v1.PureComponent:extend("UserTypingIndicator");
local v8 = {
    dampingRatio = 1.5, 
    frequency = 1.6
};
v7.defaultProps = {
    AnchorPoint = Vector2.new(0, 0), 
    LayoutOrder = 1, 
    Position = UDim2.new(0, 0, 0, 0), 
    ZIndex = 1, 
    usersTyping = {}, 
    oneUserTyping = "PLACEHOLDER {DISPLAY_NAME} is typing...", 
    twoUsersTyping = "PLACEHOLDER {DISPLAY_NAME_1} and {DISPLAY_NAME_2} are typing...", 
    severalUsersTyping = "PLACEHOLDER Several users are typing...", 
    maxCharacterLength = 160, 
    height = 40
};
v7.init = function(v9)
    v9.getDisplayText = function()
        if v9.props.usersTyping then
            if #v9.props.usersTyping == 1 then
                return v9.props.oneUserTyping;
            elseif #v9.props.usersTyping == 2 then
                return v9.props.twoUsersTyping;
            elseif #v9.props.usersTyping > 2 then
                return v9.props.severalUsersTyping;
            end;
        end;
        return "";
    end;
    local v10, v11 = v1.createBinding(1);
    v9.motor = v3.createSingleMotor(1);
    v9.motor:start();
    v9.motor:onStep(v11);
    v9.animationProgress = v10;
    v9.updateAnimationGoal = function()
        v9.motor:setGoal(v3.spring(#v9.props.usersTyping > 0 and 0 or 1, v8));
    end;
    v9.updateAnimationGoal();
end;
v7.didUpdate = function(v12, v13, _)
    if #v13.usersTyping ~= #v12.props.usersTyping then
        v12.updateAnimationGoal();
    end;
end;
v7.render = function(v15)
    return l_withStyle_0(function(v16)
        local l_Font_0 = v16.Font;
        return v1.createElement("Frame", {
            AnchorPoint = v15.props.AnchorPoint, 
            BackgroundTransparency = 1, 
            LayoutOrder = v15.props.LayoutOrder, 
            Position = v15.props.Position, 
            Size = UDim2.new(1, 0, 0, v15.props.height), 
            ZIndex = v15.props.ZIndex
        }, {
            Layout = v1.createElement("UIListLayout", {
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            Padding = v1.createElement("UIPadding", {
                PaddingTop = UDim.new(0, 4), 
                PaddingBottom = UDim.new(0, 4)
            }), 
            ImageContainer = v1.createElement(l_ImageSetLabel_0, {
                Size = UDim2.new(0.9, 0, 1, 0), 
                BackgroundColor3 = v16.Theme.NavigationBar.Color, 
                BorderColor3 = v16.Theme.Divider.Color, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(8, 8, 9, 9), 
                Image = l_Images_0["component_assets/circle_17"], 
                ImageColor3 = v16.Theme.BackgroundUIDefault.Color, 
                ImageTransparency = v15.animationProgress:map(function(v18)
                    return v18;
                end), 
                Position = v15.animationProgress:map(function(v19)
                    return UDim2.new(0, 0, v19, 0);
                end)
            }, {
                Layout = v1.createElement("UIListLayout", {
                    VerticalAlignment = Enum.VerticalAlignment.Center, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    FillDirection = Enum.FillDirection.Horizontal, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 12), 
                    PaddingTop = UDim.new(0, 4), 
                    PaddingBottom = UDim.new(0, 4), 
                    PaddingRight = UDim.new(0, 12)
                }), 
                TextLabel = v1.createElement("TextLabel", {
                    Text = v15.getDisplayText(), 
                    TextSize = l_Font_0.BaseSize * l_Font_0.Footer.RelativeSize, 
                    Font = l_Font_0.Footer.Font, 
                    TextColor3 = v16.Theme.TextMuted.Color, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    BackgroundTransparency = 1, 
                    TextTransparency = v15.animationProgress:map(function(v20)
                        return v20;
                    end)
                })
            })
        });
    end);
end;
v7.willUnmount = function(v21)
    if v21.motor then
        v21.motor:destroy();
    end;
end;
return v7;
