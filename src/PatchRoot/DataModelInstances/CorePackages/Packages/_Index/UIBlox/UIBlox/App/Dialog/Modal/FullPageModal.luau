local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local l_Parent_3 = l_Parent_2.Parent;
local v4 = require(l_Parent_2.UIBloxConfig);
local v5 = require(l_Parent_3.Roact);
local v6 = require(l_Parent_3.t);
local l_FitFrameVertical_0 = require(l_Parent_3.FitFrame).FitFrameVertical;
local v8 = require(l_Parent_1.Button.ButtonStack);
local v9 = require(l_Parent_0.ModalTitle);
local v10 = require(l_Parent_0.ModalWindow);
local v11 = v5.PureComponent:extend("FullPageModal");
v11.validateProps = v6.strictInterface({
    screenSize = v6.Vector2, 
    [v5.Children] = v6.table, 
    position = v6.optional(v6.UDim2), 
    title = v6.optional(v6.string), 
    marginSize = v6.optional(v6.number), 
    buttonStackProps = v6.optional(v6.table), 
    footerContent = v6.optional(v6.callback), 
    onCloseClicked = v6.optional(v6.callback), 
    distanceFromTop = v6.optional(v6.number)
});
v11.defaultProps = {
    marginSize = 24, 
    distanceFromTop = 0
};
v11.init = function(v12)
    v12.state = {
        buttonFrameSize = Vector2.new(0, 0), 
        footerContentSize = Vector2.new(0, 0), 
        titleContainerSize = Vector2.new(0, v9:GetHeight())
    };
    v12.changeButtonFrameSize = function(v13)
        if v12.state.buttonFrameSize ~= v13.AbsoluteSize then
            v12:setState({
                buttonFrameSize = v13.AbsoluteSize
            });
        end;
    end;
    v12.changeFooterContentSize = function(v14)
        if v12.state.footerContentSize ~= v14.AbsoluteSize then
            v12:setState({
                footerContentSize = v14.AbsoluteSize
            });
        end;
    end;
    v12.changeTitleContainerSize = function(v15)
        if v12.state.titleContainerSize ~= v15.AbsoluteSize then
            v12:setState({
                titleContainerSize = v15.AbsoluteSize
            });
        end;
    end;
end;
v11.render = function(v16)
    return v5.createElement(v10, {
        isFullHeight = true, 
        screenSize = v16.props.screenSize, 
        position = v16.props.position, 
        distanceFromTop = v16.props.distanceFromTop
    }, {
        TitleContainer = v5.createElement(v9, {
            title = v16.props.title, 
            onCloseClicked = v16.props.onCloseClicked, 
            onTitleSizeChanged = v16.changeTitleContainerSize
        }), 
        Content = v5.createElement("Frame", {
            Size = UDim2.new(1, 0, 1, -v16.state.titleContainerSize.Y), 
            Position = UDim2.new(0, 0, 0, v16.state.titleContainerSize.Y), 
            BackgroundTransparency = 1
        }, {
            v5.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center
            }), 
            v5.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 0), 
                PaddingRight = UDim.new(0, 0), 
                PaddingBottom = UDim.new(0, 24)
            }); 
            MiddleContent = v5.createElement("Frame", {
                Size = UDim2.new(1, -2 * v16.props.marginSize, 1, -(v16.state.buttonFrameSize.Y + v16.state.footerContentSize.Y)), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                ZIndex = if not v4.addMiddleContentZIndex then nil else 2
            }, v16.props[v5.Children]), 
            Buttons = v16.props.buttonStackProps and v5.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                LayoutOrder = 2, 
                [v5.Change.AbsoluteSize] = v16.changeButtonFrameSize
            }, {
                Padding = v5.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }); 
                v5.createElement(v8, v16.props.buttonStackProps)
            }), 
            BottomFrame = if not v16.props.footerContent then nil else v5.createElement("Frame", {
                Size = UDim2.new(1, -2 * v16.props.marginSize, 0, 0), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                [v5.Change.AbsoluteSize] = v16.changeFooterContentSize
            }, {
                ContentPadding = v5.createElement("UIPadding", {
                    PaddingTop = UDim.new(0, 24)
                }), 
                ListLayout = v5.createElement("UIListLayout", {
                    HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                    SortOrder = Enum.SortOrder.LayoutOrder
                }), 
                FooterContent = v16.props.footerContent()
            })
        })
    });
end;
return v11;
