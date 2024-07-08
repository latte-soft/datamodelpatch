local l_Parent_0 = script:FindFirstAncestor("GameTile").Parent;
local v1 = require(l_Parent_0.React);
local v2 = require(l_Parent_0.Roact);
local l_Object_0 = require(l_Parent_0.LuauPolyfill).Object;
local l_FFlagLuaAppGameTileProps_0 = require(l_Parent_0.SharedFlags).FFlagLuaAppGameTileProps;
local v5 = {
    overlaySize = UDim2.new(1, 0, 1, 0), 
    overlayPosition = UDim2.new(0, 0, 0, 0), 
    overlayZIndex = 0
};
local function v10(v6)
    local v7 = l_Object_0.assign({}, v5, v6);
    local v8, v9 = v1.useState(false);
    return v2.createElement("Frame", {
        Size = if not l_FFlagLuaAppGameTileProps_0 then if v7.size then UDim2.new(0, v7.size.X, 0, v7.size.Y) else UDim2.fromScale(1, 1) else v7.size, 
        BackgroundTransparency = 1, 
        LayoutOrder = v7.layoutOrder, 
        [v2.Ref] = v7.gameTileRef, 
        [v2.Event.MouseEnter] = if not v7.overlay then nil else function()
            v9(true);
        end, 
        [v2.Event.MouseLeave] = if not v7.overlay then nil else function()
            v9(false);
        end
    }, l_Object_0.assign({
        OverlayContainer = if not v7.overlay then nil else v2.createElement("Frame", {
            Size = v7.overlaySize, 
            Position = v7.overlayPosition, 
            ZIndex = v7.overlayZIndex, 
            BackgroundTransparency = 1, 
            Visible = v8
        }, {
            Overlay = v2.createElement(v7.overlay)
        })
    }, v7.children));
end;
return v1.forwardRef(function(v11, v12)
    return v1.createElement(v10, l_Object_0.assign({}, v11, {
        gameTileRef = v12
    }));
end);
