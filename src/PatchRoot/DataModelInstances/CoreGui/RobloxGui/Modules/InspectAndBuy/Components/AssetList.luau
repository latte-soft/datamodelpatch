local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.Cryo);
local v5 = require(l_CorePackages_0.RoactRodux);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_Parent_0.Components.AssetCard);
local v8 = require(l_Parent_0.Components.InspectAndBuyContext);
local l_ShimmerPanel_0 = v6.App.Loading.ShimmerPanel;
local v10 = require(l_Parent_0.Actions.SetAssetFromBundleInfo);
local v11 = v3.PureComponent:extend("AssetList");
local v12 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
v11.calculateCanvasSize = function(v13, v14, v15, v16)
    local l_current_0 = v13.gridFrameRef.current;
    local l_view_0 = v13.props.view;
    local v19 = nil;
    v19 = v13.props.views[l_view_0];
    if l_current_0 then
        l_current_0.Parent.CanvasSize = UDim2.new(1, 0, 0, math.ceil(v15 / v14) * (v16 + 10) + (v19.TopSizeY + 15));
    end;
end;
v11.init = function(v20)
    local l_view_1 = v20.props.view;
    local v22 = nil;
    v22 = v20.props.views[l_view_1];
    v20.gridFrameRef = v3.createRef();
    v20.state = {
        assetCardSizeX = v22.AssetCardMaxSizeX, 
        assetCardSizeY = v22.AssetCardMaxSizeY
    };
end;
v11.render = function(v23)
    local l_view_2 = v23.props.view;
    local v25 = nil;
    v25 = v23.props.views[l_view_2];
    local l_assets_0 = v23.props.assets;
    local l_MaxAssetCardsPerRow_0 = v25.MaxAssetCardsPerRow;
    local l_assetCardSizeX_0 = v23.state.assetCardSizeX;
    local l_assetCardSizeY_0 = v23.state.assetCardSizeY;
    local v30 = {};
    local v31 = 0;
    v30.UIGridLayout = v3.createElement("UIGridLayout", {
        CellPadding = UDim2.new(0, 10, 0, 10), 
        CellSize = UDim2.new(0, l_assetCardSizeX_0, 0, l_assetCardSizeY_0), 
        SortOrder = Enum.SortOrder.LayoutOrder, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        FillDirectionMaxCells = l_MaxAssetCardsPerRow_0
    });
    for _, v33 in pairs(l_assets_0) do
        v31 = v31 + 1;
        v30[v33.assetId] = v3.createElement(v7, {
            assetInfo = v33, 
            assetCardSizeX = l_assetCardSizeX_0
        });
    end;
    if v31 == 0 then
        for v34 = 1, 30 do
            v30[v34] = v3.createElement(l_ShimmerPanel_0, {
                Size = UDim2.new(1, 0, 0, l_assetCardSizeX_0)
            });
        end;
    end;
    v23:calculateCanvasSize(l_MaxAssetCardsPerRow_0, v31, l_assetCardSizeY_0);
    return v3.createElement("Frame", {
        Size = UDim2.new(1, -(2 * v25.BorderPaddingSize), 1, 0), 
        BackgroundTransparency = 1, 
        BorderSizePixel = 0, 
        LayoutOrder = 3, 
        [v3.Ref] = v23.gridFrameRef, 
        [v3.Change.AbsoluteSize] = function(_)
            spawn(function()
                v23:resize();
            end);
        end
    }, v30);
end;
v11.didMount = function(v36)
    v36:resize();
    v36.mounted = true;
end;
v11.updateAssetsFromBundles = function(v37)
    if v12() then
        local l_bundles_0 = v37.props.bundles;
        local l_assetBundles_0 = v37.props.assetBundles;
        local l_assets_1 = v37.props.assets;
        local v41 = v4.Dictionary.keys(l_assets_1);
        if l_bundles_0 and not v4.isEmpty(l_bundles_0) then
            local v42 = 1;
            for _, v44 in pairs(l_bundles_0) do
                local l_assetIds_0 = v44.assetIds;
                for v46 = 1, #l_assetIds_0 do
                    local v47 = tostring(l_assetIds_0[v46]);
                    if table.find(v41, v47) then
                        local v48 = l_assetBundles_0[v47] or {};
                        if not (#v48 ~= 1) or not (not (v42 == 1 and #v48 > 1) or not l_assets_1[v47]) and l_assets_1[v47].parentBundleId == nil then
                            v37.props.dispatchSetAssetFromBundleInfo(v47, v44);
                        end;
                    end;
                end;
                v42 = v42 + 1;
            end;
            return ;
        else
            return ;
        end;
    else
        return ;
    end;
end;
v11.didUpdate = function(v49, v50)
    if v49.props.view ~= v50.view then
        v49:resize();
    end;
    if not (((not v49.mounted or not v49.props.gamepadEnabled) or v49.props.detailsInformation.viewingDetails) or not v49.props.visible) then
        l_GuiService_0.SelectedCoreObject = v49.gridFrameRef.current:FindFirstChildWhichIsA("GuiObject");
    end;
    if v12() and (not (v49.props.assetBundles == v50.assetBundles) or v49.props.bundles ~= v50.bundles) then
        v49:updateAssetsFromBundles();
    end;
end;
v11.willUnmount = function(v51)
    v51.mounted = false;
end;
v11.resize = function(v52)
    local l_current_1 = v52.gridFrameRef.current;
    local l_view_3 = v52.props.view;
    local v55 = nil;
    v55 = v52.props.views[l_view_3];
    if l_current_1 then
        local l_MaxAssetCardsPerRow_1 = v55.MaxAssetCardsPerRow;
        local v57 = math.floor((l_current_1.AbsoluteSize.X - 10 * (l_MaxAssetCardsPerRow_1 - 1)) / l_MaxAssetCardsPerRow_1);
        local v58 = math.min(v57, v55.AssetCardMaxSizeX);
        local v59 = math.min(v57 / 0.68, v55.AssetCardMaxSizeY);
        if not (v52.state.assetCardSizeX == v58) or v52.state.assetCardSizeY ~= v59 then
            v52:setState({
                assetCardSizeX = v58, 
                assetCardSizeY = v59
            });
        end;
    end;
end;
local function v62(v60)
    return v3.createElement(v8.Consumer, {
        render = function(v61)
            return v3.createElement(v11, (v4.Dictionary.join(v60, {
                views = v61
            })));
        end
    });
end;
if not v12() then
    return v5.UNSTABLE_connect2(function(v63, _)
        return {
            view = v63.view, 
            visible = v63.visible, 
            assets = v63.assets, 
            detailsInformation = v63.detailsInformation, 
            gamepadEnabled = v63.gamepadEnabled
        };
    end)(v62);
else
    return v5.connect(function(v65, _)
        return {
            view = v65.view, 
            visible = v65.visible, 
            assets = v65.assets, 
            bundles = v65.bundles, 
            assetBundles = v65.assetBundles, 
            detailsInformation = v65.detailsInformation, 
            gamepadEnabled = v65.gamepadEnabled
        };
    end, function(v67)
        return {
            dispatchSetAssetFromBundleInfo = function(v68, v69)
                v67(v10(v68, v69));
            end
        };
    end)(v62);
end;
