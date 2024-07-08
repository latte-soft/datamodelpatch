local l_RunService_0 = game:GetService("RunService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Roact);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.Packages.t);
local v7 = require(l_CorePackages_0.UIBlox);
local l_withStyle_0 = v7.Style.withStyle;
local l_Images_0 = v7.App.ImageSet.Images;
local l_ImageSetLabel_0 = v7.Core.ImageSet.ImageSetLabel;
local v11 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Constants);
local v12 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetOrder);
local v13 = require(l_Modules_0.AvatarExperience.Common.Actions.SetOrderForTryOns);
local v14 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Actions.SetCurrentSort);
local v15 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.LayeredClothingSortUtils);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local v17 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Services.Analytics);
local v18 = require(l_Modules_0.AvatarExperience.LayeredClothingSort.Thunks.SendRefinementAnalytics);
local v19 = l_Images_0["icons/navigation/cycleUp"];
local v20 = l_Images_0["icons/navigation/cycleDown"];
local v21 = v4.PureComponent:extend("LCSortArrowNav");
v21.validateProps = v6.strictInterface({
    Visible = v6.union(v6.boolean, v6.table), 
    index = v6.number, 
    asset = v6.table, 
    currentSort = v6.table, 
    equippedAssets = v6.table, 
    tryOnItems = v6.table, 
    setOrder = v6.callback, 
    setOrderForTryOns = v6.callback, 
    setCurrentSort = v6.callback, 
    sendAnalytics = v6.callback, 
    analytics = v6.table
});
v21.moveTile = function(v22, v23)
    local v24 = {};
    for v25, v26 in v22.props.currentSort, nil, nil do
        if v25 ~= v22.props.index then
            table.insert(v24, v26);
        end;
    end;
    table.insert(v24, v22.props.index + v23, {
        id = v22.props.asset.id, 
        typeId = v22.props.asset.typeId
    });
    local v27, v28 = v15.formatForSetOrderWithTryOns(v24, v22.props.equippedAssets, v22.props.tryOnItems);
    v22.props.setOrder(v27);
    v22.props.setOrderForTryOns(v28);
    v22.props.setCurrentSort(v24);
    v22.props.sendAnalytics(v22.props.analytics.avatarRefineAutosaved);
end;
v21.init = function(v29)
    v29.animLoopConn = nil;
    v29.animOutConn = nil;
    v29.animInConn = nil;
    v29.animating = false;
    local v30, v31 = v4.createBinding(UDim2.fromOffset(0, 4));
    v29.upArrowPos = v30;
    v29.updateUpArrowPos = v31;
    v30, v31 = v4.createBinding(UDim2.fromScale(0, 0));
    v29.downArrowPos = v30;
    v29.updateDownArrowPos = v31;
    v29.onUpActivated = function()
        v29:moveTile(-1);
    end;
    v29.onDownActivated = function()
        v29:moveTile(1);
    end;
end;
v21.animateOut = function(v32)
    local v33 = 4;
    local v34 = 0;
    v32.animOutConn = l_RunService_0.RenderStepped:connect(function(v35)
        v33 = v33 - v35 * 14;
        v34 = v34 + v35 * 14;
        local v36 = math.max(v33, 0);
        local v37 = math.min(v34, 4);
        v32.updateUpArrowPos(UDim2.new(0, 0, 0, v36));
        v32.updateDownArrowPos(UDim2.new(0, 0, 0, v37));
        if v36 == 0 then
            v32.animOutConn:Disconnect();
            v32.animOutConn = nil;
            v32:animateIn();
        end;
    end);
end;
v21.animateIn = function(v38)
    local v39 = 0;
    local v40 = 4;
    v38.animInConn = l_RunService_0.RenderStepped:connect(function(v41)
        v39 = v39 + v41 * 14;
        v40 = v40 - v41 * 14;
        local v42 = math.min(v39, 4);
        local v43 = math.max(v40, 0);
        v38.updateUpArrowPos(UDim2.new(0, 0, 0, v42));
        v38.updateDownArrowPos(UDim2.new(0, 0, 0, v43));
        if v42 == 4 then
            v38.animInConn:Disconnect();
            v38.animInConn = nil;
            v38.timeOfLastAnimation = tick();
            v38.animating = false;
        end;
    end);
end;
v21.render = function(v44)
    return l_withStyle_0(function(v45)
        local l_Theme_0 = v45.Theme;
        return v4.createFragment({
            UpArrowButton = v4.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                Visible = v44.props.Visible and v44.props.index ~= 1, 
                Size = UDim2.fromOffset(v11.Tile.ArrowSize.X.Offset, v11.Tile.ArrowSize.Y.Offset + 4), 
                AnchorPoint = Vector2.new(0.5, 1), 
                Position = UDim2.fromScale(0.5, 0), 
                [v4.Event.Activated] = v44.onUpActivated
            }, {
                UpArrowIcon = v4.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = v11.Tile.ArrowSize, 
                    Position = v44.upArrowPos, 
                    Image = v19, 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            }), 
            DownArrowButton = v4.createElement("TextButton", {
                Text = "", 
                BackgroundTransparency = 1, 
                Visible = v44.props.Visible and v44.props.index ~= #v44.props.currentSort, 
                Size = UDim2.fromOffset(v11.Tile.ArrowSize.X.Offset, v11.Tile.ArrowSize.Y.Offset + 4), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, v11.Tile.SelectedSize), 
                [v4.Event.Activated] = v44.onDownActivated
            }, {
                DownArrowIcon = v4.createElement(l_ImageSetLabel_0, {
                    BackgroundTransparency = 1, 
                    Size = v11.Tile.ArrowSize, 
                    Position = v44.downArrowPos, 
                    Image = v20, 
                    ImageColor3 = l_Theme_0.IconEmphasis.Color
                })
            })
        });
    end);
end;
v21.didMount = function(v47)
    v47.timeOfLastAnimation = tick();
    v47.animLoopConn = l_RunService_0.RenderStepped:connect(function(_)
        if not (not (tick() - v47.timeOfLastAnimation >= 1) or v47.animating) then
            v47.animating = true;
            v47:animateOut();
        end;
    end);
end;
v21.willUnmount = function(v49)
    if v49.animLoopConn then
        v49.animLoopConn:Disconnect();
        v49.animLoopConn = nil;
    end;
    if v49.animOutConn then
        v49.animOutConn:Disconnect();
        v49.animOutConn = nil;
    end;
    if v49.animInConn then
        v49.animInConn:Disconnect();
        v49.animInConn = nil;
    end;
end;
return (v5.connect(function(v50, _)
    return {
        currentSort = v50.AvatarExperience.LayeredClothingSort.CurrentSort.OrderedList, 
        equippedAssets = v50.AvatarExperience.AvatarEditor.Character.EquippedAssets, 
        tryOnItems = v50.AvatarExperience.AvatarScene.OutfitTryOn.TryOnItems
    };
end, function(v52)
    return {
        setOrder = function(v53)
            v52(v12(v53));
        end, 
        setOrderForTryOns = function(v54)
            v52(v13(v54));
        end, 
        setCurrentSort = function(v55)
            v52(v14(v55));
        end, 
        sendAnalytics = function(v56)
            v52(v18(v56));
        end
    };
end)((l_RoactServices_0.connect({
    analytics = v17
})(v21))));
