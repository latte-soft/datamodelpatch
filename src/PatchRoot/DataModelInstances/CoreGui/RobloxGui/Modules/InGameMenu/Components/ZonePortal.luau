local v0 = require(game:GetService("CorePackages").InGameMenuDependencies);
local l_Roact_0 = v0.Roact;
local l_RoactRodux_0 = v0.RoactRodux;
local l_t_0 = v0.t;
local l_UIBlox_0 = v0.UIBlox;
local l_withSelectionCursorProvider_0 = l_UIBlox_0.App.SelectionImage.withSelectionCursorProvider;
local l_CursorKind_0 = l_UIBlox_0.App.SelectionImage.CursorKind;
local l_Parent_0 = script.Parent.Parent;
local v8 = require(l_Parent_0.Resources.Constants);
local v9 = require(l_Parent_0.Enums.Direction);
local v10 = require(l_Parent_0.Actions.SetCurrentZone);
local l_PortalSize_0 = v8.Zone.PortalSize;
local v12 = {
    [v9.Up] = {
        size = UDim2.new(1, 0, 0, l_PortalSize_0), 
        position = UDim2.new(0, 0, 0, 0)
    }, 
    [v9.Down] = {
        size = UDim2.new(1, 0, 0, l_PortalSize_0), 
        position = UDim2.new(0, 0, 1, -l_PortalSize_0)
    }, 
    [v9.Left] = {
        size = UDim2.new(0, l_PortalSize_0, 1, 0), 
        position = UDim2.new(0, 0, 0, 0)
    }, 
    [v9.Right] = {
        size = UDim2.new(0, l_PortalSize_0, 1, 0), 
        position = UDim2.new(1, -l_PortalSize_0, 0, 0)
    }
};
local v13 = l_Roact_0.PureComponent:extend("ZonePortal");
v13.validateProps = l_t_0.strictInterface({
    targetZone = l_t_0.number, 
    direction = v9.isEnumValue, 
    setCurrentZone = l_t_0.optional(l_t_0.callback)
});
v13.render = function(v14)
    local v15 = v12[v14.props.direction];
    return l_withSelectionCursorProvider_0(function(v16)
        return l_Roact_0.createElement("Frame", {
            Size = v15.size, 
            Position = v15.position, 
            BackgroundTransparency = 1, 
            Selectable = true, 
            ZIndex = 2147483647, 
            SelectionImageObject = v16(l_CursorKind_0.Invisible), 
            [l_Roact_0.Event.SelectionGained] = function()
                v14.props.setCurrentZone(v14.props.targetZone);
            end
        });
    end);
end;
return (l_RoactRodux_0.UNSTABLE_connect2(nil, function(v17)
    return {
        setCurrentZone = function(v18)
            return v17(v10(v18));
        end
    };
end)(v13));
