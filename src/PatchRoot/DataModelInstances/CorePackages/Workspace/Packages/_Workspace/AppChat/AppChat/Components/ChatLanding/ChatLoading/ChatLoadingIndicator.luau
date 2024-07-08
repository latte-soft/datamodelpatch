local l_script_FirstAncestor_0 = script:FindFirstAncestor("AppChat");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.Roact);
local l_withStyle_0 = require(l_Parent_0.UIBlox).Style.withStyle;
local v4 = require(script.Parent.LoadingAvatar);
local v5 = require(script.Parent.TextPlaceholders);
local v6 = require(l_script_FirstAncestor_0.Flags.getFFlagEnableNewAppChatLoadingIndicator);
local v7 = v2.PureComponent:extend("ChatLoadingIndicator");
v7.defaultProps = {
    cellHeight = if not v6() then nil else 64, 
    avatarCellWidth = 60
};
v7.init = function(v8)
    v8.singleConversationPlaceholder = function(v9, v10)
        return l_withStyle_0(function(v11)
            return v2.createElement("Frame", {
                LayoutOrder = v9, 
                Size = UDim2.new(1, 0, 0, v8.props.cellHeight), 
                BackgroundTransparency = v11.Theme.BackgroundDefault.Transparency, 
                BackgroundColor3 = v11.Theme.BackgroundDefault.Color, 
                BorderSizePixel = 0
            }, {
                UIList = v2.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, not v6() and 20 or 0), 
                    PaddingTop = UDim.new(0, 4)
                }), 
                Content = v2.createElement("Frame", {
                    LayoutOrder = 1, 
                    Size = UDim2.new(1, 0, 1, -1), 
                    BackgroundTransparency = 1
                }, {
                    UIList = v2.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        FillDirection = Enum.FillDirection.Horizontal
                    }), 
                    avatar = v2.createElement(v4, {
                        avatarImage = v8.props.avatarImage, 
                        cellWidth = if not v6() then nil else v8.props.avatarCellWidth, 
                        cellHeight = if not v6() then nil else v8.props.cellHeight, 
                        LayoutOrder = 1
                    }), 
                    textPlaceholders = v2.createElement(v5, {
                        avatarCellWidth = if not v6() then nil else v8.props.avatarCellWidth, 
                        LayoutOrder = 2
                    })
                }), 
                bottomLineContainer = not v10 and v2.createElement("Frame", {
                    LayoutOrder = 2, 
                    Size = UDim2.new(1, 0, 0, 1), 
                    BackgroundTransparency = 1, 
                    ZIndex = 2, 
                    ClipsDescendants = true
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, not v6() and 6 or v8.props.avatarCellWidth)
                    }), 
                    bottomLine = v2.createElement("Frame", {
                        BackgroundColor3 = v11.Theme.Divider.Color, 
                        Transparency = v11.Theme.Divider.Transparency, 
                        Size = UDim2.new(1, 0, 1, 0), 
                        BorderSizePixel = 0
                    })
                })
            });
        end);
    end;
    v8.allConversationPlaceholdersList = function()
        local v12 = {
            UIList = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        table.insert(v12, v8.singleConversationPlaceholder(1, false));
        table.insert(v12, v8.singleConversationPlaceholder(2, false));
        table.insert(v12, v8.singleConversationPlaceholder(3, true));
        return v12;
    end;
end;
v7.render = function(v13)
    return l_withStyle_0(function(v14)
        return v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, 0), 
            BackgroundColor3 = v14.Theme.BackgroundDefault.Color, 
            BackgroundTransparency = v14.Theme.BackgroundDefault.Transparency, 
            BorderSizePixel = 0
        }, v13.allConversationPlaceholdersList());
    end);
end;
return v7;
