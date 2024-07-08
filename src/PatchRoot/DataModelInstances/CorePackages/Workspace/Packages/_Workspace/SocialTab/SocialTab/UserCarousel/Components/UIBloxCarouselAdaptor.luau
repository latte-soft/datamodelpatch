local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialTab");
local v1 = require(l_script_FirstAncestor_0.dependencies);
local l_Roact_0 = v1.Roact;
local l_UIBlox_0 = v1.UIBlox;
local l_t_0 = v1.t;
local l_memoize_0 = v1.memoize;
local v6 = require(l_script_FirstAncestor_0.User);
local l_FreeFlowCarousel_0 = l_UIBlox_0.App.Container.Carousel.FreeFlowCarousel;
local v8 = require(script.Parent.AddFriendHint);
local v9 = l_Roact_0.PureComponent:extend("UIBloxCarouselAdaptor");
v9.defaultProps = {
    friends = {}, 
    friendThumbnailSize = 96, 
    LayoutOrder = 0, 
    wideMode = false, 
    tileHeight = 96
};
v9.validateProps = l_t_0.interface({
    createUserEntry = l_t_0.callback, 
    friends = l_t_0.array(v6.validateUser), 
    friendThumbnailSize = l_t_0.optional(l_t_0.number), 
    LayoutOrder = l_t_0.optional(l_t_0.number), 
    onFriendSelected = l_t_0.optional(l_t_0.callback), 
    wideMode = l_t_0.optional(l_t_0.boolean)
});
v9.init = function(v10)
    v10.identifier = function(v11)
        return v11.absolutePosition;
    end;
    v10.createUserEntry = function(v12)
        if not (v12.absolutePosition == 2) or not v12.addFriendHint then
            if v12.absolutePosition > 0 and v12.isPlaceHolder == true then
                return l_Roact_0.createElement("Frame", {
                    BackgroundTransparency = 1, 
                    Size = UDim2.new(0, v10.props.friendThumbnailSize, 1, 0)
                });
            else
                return v10.props.createUserEntry(v12);
            end;
        else
            return l_Roact_0.createElement(v8, {
                layoutOrder = 2, 
                maxHintHeight = v10.props.friendThumbnailSize
            });
        end;
    end;
    v10.formatFriends = l_memoize_0(function(v13)
        local v14 = {};
        table.insert(v14, {
            absolutePosition = 1
        });
        if #v13 == 0 then
            table.insert(v14, {
                absolutePosition = 2, 
                addFriendHint = true
            });
        end;
        for v15, v16 in ipairs(v13) do
            table.insert(v14, {
                layoutOrder = v15 + 1, 
                absolutePosition = v15 + 1, 
                user = v16
            });
        end;
        return v14;
    end);
end;
v9.render = function(v17)
    local v18 = not v17.props.wideMode and 24 or 48;
    return l_Roact_0.createElement("Frame", {
        LayoutOrder = v17.props.LayoutOrder, 
        BackgroundTransparency = 1, 
        Size = UDim2.new(1, v18, 0, v17.props.tileHeight + 18)
    }, {
        Padding = l_Roact_0.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, -v18), 
            PaddingTop = UDim.new(0, -38)
        }), 
        CarouselContent = l_Roact_0.createElement(l_FreeFlowCarousel_0, {
            identifier = v17.identifier, 
            itemList = v17.formatFriends(v17.props.friends), 
            renderItem = v17.createUserEntry, 
            itemSize = Vector2.new(v17.props.friendThumbnailSize, v17.props.tileHeight + 18), 
            carouselMargin = v18
        })
    });
end;
return v9;
