local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_0.ImageSet.Images);
local v6 = require(l_Parent_0.ImageSet.Enum.IconSize);
local v7 = require(l_Parent_0.Container.getPageMargin);
local v8 = require(l_Parent_1.Core.Style.withStyle);
local v9 = require(l_Parent_1.App.Button.IconButton);
local v10 = require(l_Parent_1.Core.Text.GenericTextLabel.GenericTextLabel);
local v11 = require(l_Parent_1.Core.Text.GetTextSize);
local v12 = require(l_Parent_1.Core.Bar.ThreeSectionBar);
local v13 = v3.PureComponent:extend("HeaderBar");
v13.renderLeft = {
    backButton = function(v14)
        return function(_)
            return v3.createElement(v9, {
                size = UDim2.fromOffset(0, 0), 
                iconSize = v6.Medium, 
                icon = v5["icons/navigation/pushBack"], 
                onActivated = v14
            });
        end;
    end
};
v13.validateProps = v4.strictInterface({
    title = v4.optional(v4.string), 
    margin = v4.optional(v4.number), 
    contentPaddingRight = v4.optional(v4.UDim), 
    barHeight = v4.optional(v4.number), 
    renderRight = v4.optional(v4.callback), 
    renderLeft = v4.optional(v4.callback), 
    renderCenter = v4.optional(v4.callback), 
    backgroundTransparency = v4.optional(v4.number), 
    onHeaderActivated = v4.optional(v4.callback), 
    memoKey = v4.optional(v4.number), 
    isSecondary = v4.optional(v4.boolean), 
    shouldHideSecondaryLeftItem = v4.optional(v4.boolean)
});
v13.defaultProps = {
    barHeight = 48, 
    title = "", 
    isSecondary = false
};
v13.init = function(v16)
    v16.state = {
        margin = 0
    };
    v16.onResize = function(v17)
        v16:setState({
            margin = v7(v17.AbsoluteSize.X)
        });
    end;
    v16.ref = v3.createRef();
end;
v13.render = function(v18)
    return v8(function(v19)
        local l_Theme_0 = v19.Theme;
        local l_Font_0 = v19.Font;
        local l_renderLeft_0 = v18.props.renderLeft;
        local v23 = true;
        if l_renderLeft_0 ~= nil then
            v23 = l_renderLeft_0 == v3.None;
        end;
        local l_renderCenter_0 = v18.props.renderCenter;
        local l_renderRight_0 = v18.props.renderRight;
        local l_huge_0 = math.huge;
        if v23 and string.len(v18.props.title) > 0 then
            l_renderLeft_0 = function(v27)
                return v3.createFragment({
                    Text = v3.createElement(v10, {
                        fluidSizing = true, 
                        Text = v18.props.title, 
                        TextTruncate = Enum.TextTruncate.AtEnd, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        fontStyle = l_Font_0.Title, 
                        colorStyle = l_Theme_0.TextEmphasis
                    }, v27[v3.Children])
                });
            end;
        end;
        if not ((not v18.props.isSecondary or v23) or v18.props.shouldHideSecondaryLeftItem) and string.len(v18.props.title) > 0 then
            local l_Header2_0 = l_Font_0.Header2;
            local v29 = l_Header2_0.RelativeSize * l_Font_0.BaseSize;
            local l_v29_0 = v29 --[[ copy: 9 -> 10 ]];
            local l_l_Header2_0_0 = l_Header2_0 --[[ copy: 8 -> 11 ]];
            l_renderLeft_0 = function()
                return v3.createFragment({
                    Text = v3.createElement("Frame", {
                        Size = UDim2.new(1, 0, 0, l_v29_0), 
                        BackgroundTransparency = 1, 
                        Transparency = 1
                    }, {
                        Layout = v3.createElement("UIListLayout", {
                            SortOrder = Enum.SortOrder.LayoutOrder, 
                            FillDirection = Enum.FillDirection.Horizontal, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Padding = UDim.new(0, 12)
                        }), 
                        renderLeft = v18.props.renderLeft(v18.props), 
                        Divider = v3.createElement("Frame", {
                            BackgroundColor3 = l_Theme_0.Divider.Color, 
                            BackgroundTransparency = l_Theme_0.Divider.Transparency, 
                            BorderSizePixel = 0, 
                            Size = UDim2.new(0, 1, 1, 0), 
                            LayoutOrder = 1
                        }), 
                        TextLabel = v3.createElement(v10, {
                            ClipsDescendants = true, 
                            Text = v18.props.title, 
                            TextTruncate = Enum.TextTruncate.AtEnd, 
                            TextWrapped = false, 
                            TextXAlignment = Enum.TextXAlignment.Left, 
                            fontStyle = l_l_Header2_0_0, 
                            colorStyle = l_Theme_0.TextEmphasis, 
                            LayoutOrder = 2
                        })
                    })
                });
            end;
        end;
        if not ((not l_renderLeft_0 or not l_renderCenter_0) or not l_renderRight_0) then
            l_huge_0 = 0;
        end;
        if not ((l_renderCenter_0 or v23) or v18.props.isSecondary) then
            local l_Header1_0 = l_Font_0.Header1;
            local v33 = l_Header1_0.RelativeSize * l_Font_0.BaseSize;
            l_renderCenter_0 = function()
                return v3.createElement(v10, {
                    ClipsDescendants = true, 
                    Size = UDim2.new(1, 0, 0, v33), 
                    Text = v18.props.title, 
                    TextTruncate = Enum.TextTruncate.AtEnd, 
                    TextWrapped = false, 
                    fontStyle = l_Header1_0, 
                    colorStyle = l_Theme_0.TextEmphasis
                });
            end;
            l_huge_0 = v11(v18.props.title, v33, l_Header1_0.Font, Vector2.new(1000, 1000)).X;
        end;
        return v3.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, v18.props.barHeight), 
            [v3.Change.AbsoluteSize] = v18.onResize
        }, {
            HeaderClickArea = not not v18.props.onHeaderActivated and v3.createElement("TextButton", {
                AutoButtonColor = false, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 1, 0), 
                Selectable = false, 
                [v3.Event.Activated] = v18.props.onHeaderActivated, 
                ZIndex = 0
            }) or nil, 
            ThreeSectionBar = v3.createElement(v12, {
                BackgroundTransparency = v18.props.backgroundTransparency or l_Theme_0.BackgroundDefault.Transparency, 
                BackgroundColor3 = l_Theme_0.BackgroundDefault.Color, 
                barHeight = v18.props.barHeight, 
                marginLeft = v18.props.margin or v18.state.margin, 
                marginRight = v18.props.margin or v18.state.margin, 
                renderLeft = l_renderLeft_0, 
                renderCenter = l_renderCenter_0, 
                estimatedCenterWidth = l_huge_0, 
                contentPaddingRight = v18.props.contentPaddingRight or UDim.new(0, not v23 and 12 or 0), 
                renderRight = l_renderRight_0
            })
        });
    end);
end;
v13.didMount = function(v34)
    if v34.ref.current then
        v34.onResize(v34.ref.current);
    end;
end;
return v13;
