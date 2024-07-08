local l_Parent_0 = script.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.t);
local v5 = require(l_Parent_1.Button.ButtonStack);
local l_FitFrameVertical_0 = require(l_Parent_2.FitFrame).FitFrameVertical;
local v7 = require(l_Parent_0.ModalTitle);
local v8 = require(l_Parent_0.ModalWindow);
local v9 = v3.PureComponent:extend("PartialPageModal");
v9.validateProps = v4.strictInterface({
    screenSize = v4.Vector2, 
    [v3.Children] = v4.table, 
    position = v4.optional(v4.UDim2), 
    anchorPoint = v4.optional(v4.Vector2), 
    title = v4.optional(v4.string), 
    titleBackgroundImageProps = v4.optional(v4.strictInterface({
        image = v4.string, 
        imageHeight = v4.number, 
        text = v4.optional(v4.string)
    })), 
    bottomPadding = v4.optional(v4.number), 
    marginSize = v4.optional(v4.number), 
    buttonStackProps = v4.optional(v5.validateProps), 
    footerContent = v4.optional(v4.callback), 
    onCloseClicked = v4.optional(v4.callback), 
    contentPadding = v4.optional(v4.UDim)
});
v9.defaultProps = {
    marginSize = 24
};
v9.getMiddleContentWidth = function(_, v11, v12)
    return v8:getWidth(v11) - 2 * (v12 or 24);
end;
v9.render = function(v13)
    local l_screenSize_0 = v13.props.screenSize;
    local v15 = v13.props.bottomPadding or 24;
    if not v8:isFullWidth(l_screenSize_0.X) then
        v15 = 24;
    end;
    return v3.createElement(v8, {
        isFullHeight = false, 
        screenSize = l_screenSize_0, 
        position = v13.props.position, 
        anchorPoint = v13.props.anchorPoint
    }, {
        TitleContainer = v3.createElement(v7, {
            title = v13.props.title, 
            titleBackgroundImageProps = v13.props.titleBackgroundImageProps, 
            onCloseClicked = v13.props.onCloseClicked
        }), 
        Content = v3.createElement(l_FitFrameVertical_0, {
            Position = UDim2.new(0, 0, 0, v7.TITLE_HEIGHT), 
            width = UDim.new(1, 0), 
            margin = {
                top = 0, 
                bottom = v15, 
                left = 0, 
                right = 0
            }, 
            HorizontalAlignment = Enum.HorizontalAlignment.Center, 
            BackgroundTransparency = 1, 
            contentPadding = v13.props.contentPadding, 
            LayoutOrder = 1
        }, {
            MiddlContent = v3.createElement(l_FitFrameVertical_0, {
                width = UDim.new(1, -2 * v13.props.marginSize), 
                BackgroundTransparency = 1
            }, v13.props[v3.Children]), 
            Buttons = v13.props.buttonStackProps and v3.createElement(l_FitFrameVertical_0, {
                BackgroundTransparency = 1, 
                width = UDim.new(1, 0), 
                LayoutOrder = 2
            }, {
                Padding = v3.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 24), 
                    PaddingRight = UDim.new(0, 24)
                }); 
                v3.createElement(v5, v13.props.buttonStackProps)
            }), 
            BottomFrame = if not v13.props.footerContent then nil else v3.createElement("Frame", {
                Size = UDim2.new(1, 0, 0, 0), 
                LayoutOrder = 3, 
                BackgroundTransparency = 1, 
                AutomaticSize = Enum.AutomaticSize.Y
            }, {
                FooterContent = v13.props.footerContent()
            })
        })
    });
end;
return v9;
