local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = l_Parent_0.Parent.Parent;
local l_Parent_2 = l_Parent_1.Parent;
local v3 = require(l_Parent_2.Roact);
local v4 = require(l_Parent_2.Cryo);
local v5 = require(l_Parent_2.t);
local v6 = require(l_Parent_1.UIBloxConfig);
local v7 = require(l_Parent_1.App.ImageSet.Images);
local v8 = require(l_Parent_0.BaseTile.Tile);
local v9 = require(l_Parent_1.Core.Style.withStyle);
local v10 = v3.PureComponent:extend("SaveTile");
v10.validateProps = v5.strictInterface({
    hasRoundedCorners = v5.optional(v5.boolean), 
    onActivated = v5.optional(v5.callback), 
    isDisabled = v5.optional(v5.boolean), 
    thumbnail = v5.optional(v5.union(v5.string, v5.table)), 
    thumbnailSize = v5.optional(v5.UDim2), 
    thumbnailColor = v5.optional(v5.Color3), 
    thumbnailTransparency = v5.optional(v5.number), 
    NextSelectionLeft = v5.optional(v5.table), 
    NextSelectionRight = v5.optional(v5.table), 
    NextSelectionUp = v5.optional(v5.table), 
    NextSelectionDown = v5.optional(v5.table), 
    thumbnailRef = v5.optional(v5.table)
});
v10.defaultProps = {
    hasRoundedCorners = true, 
    thumbnail = v7["icons/actions/edit/add"], 
    thumbnailSize = UDim2.new(0, 36, 0, 36), 
    thumbnailTransparency = 0
};
v10.renderWithStyleProvider = function(v11, v12)
    return v3.createElement(v8, {
        hasRoundedCorners = v11.props.hasRoundedCorners, 
        name = "", 
        onActivated = v11.props.onActivated, 
        isDisabled = v11.props.isDisabled, 
        thumbnail = v11.props.thumbnail, 
        thumbnailSize = v11.props.thumbnailSize, 
        thumbnailColor = v11.props.thumbnailColor or v12.Theme.IconDefault.Color, 
        thumbnailTransparency = v11.props.thumbnailTransparency, 
        NextSelectionLeft = v11.props.NextSelectionLeft, 
        NextSelectionRight = v11.props.NextSelectionRight, 
        NextSelectionUp = v11.props.NextSelectionUp, 
        NextSelectionDown = v11.props.NextSelectionDown, 
        [v3.Ref] = v11.props.thumbnailRef
    });
end;
v10.render = function(v13)
    if not v6.useNewThemeColorPalettes then
        return v3.createElement(v8, {
            hasRoundedCorners = v13.props.hasRoundedCorners, 
            name = "", 
            onActivated = v13.props.onActivated, 
            isDisabled = v13.props.isDisabled, 
            thumbnail = v13.props.thumbnail, 
            thumbnailSize = v13.props.thumbnailSize, 
            thumbnailTransparency = v13.props.thumbnailTransparency, 
            NextSelectionLeft = v13.props.NextSelectionLeft, 
            NextSelectionRight = v13.props.NextSelectionRight, 
            NextSelectionUp = v13.props.NextSelectionUp, 
            NextSelectionDown = v13.props.NextSelectionDown, 
            [v3.Ref] = v13.props.thumbnailRef
        });
    else
        return v9(function(v14)
            return v13:renderWithStyleProvider(v14);
        end);
    end;
end;
return v3.forwardRef(function(v15, v16)
    return v3.createElement(v10, v4.Dictionary.join(v15, {
        thumbnailRef = v16
    }));
end);
