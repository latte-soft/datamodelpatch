local l_CorePackages_0 = game:GetService("CorePackages");
local l_TextService_0 = game:GetService("TextService");
local v2 = require(l_CorePackages_0.Roact);
local v3 = require(l_CorePackages_0.RoactRodux);
local l_AppFonts_0 = require(l_CorePackages_0.Workspace.Packages.Style).AppFonts;
local l_Parent_0 = script.Parent.Parent;
local v6 = require(l_Parent_0.Colors);
local v7 = require(l_Parent_0.UtilityFunctions);
local v8 = require(l_Parent_0.Flags.FFlagAssetDetailsUseAutomaticCanvasSize);
local v9 = require(l_Parent_0.Flags.GetFFlagIBEnableNewDataCollectionForCollectibleSystem);
local v10 = require(l_Parent_0.Flags.GetFFlagIBEnableLimitedBundle);
local v11 = v2.PureComponent:extend("DetailsDescription");
v11.setText = function(v12)
    local v13 = v12.props.assetInfo or {};
    local v14 = v13.bundlesAssetIsIn and #v13.bundlesAssetIsIn == 1;
    if v9() then
        v14 = v13.parentBundleId ~= nil;
    end;
    local v15 = v14 and not v13.isForSale;
    if v10() then
        v15 = v14;
    end;
    local v16 = v12.props.bundleInfo or {};
    if not v15 then
        if v13 then
            v12.description = v13.description or "";
        end;
    else
        local v17 = v7.getBundleId(v13);
        if v16[v17] then
            v12.description = v16[v17].description or "";
            return ;
        end;
    end;
end;
v11.init = function(v18)
    v18.description = "";
    v18.descriptionRef = v2.createRef();
end;
v11.render = function(v19)
    v19:setText();
    return v2.createElement("TextLabel", {
        BackgroundTransparency = 1, 
        LayoutOrder = 4, 
        Size = UDim2.new(1, -20, 0, (v19:calculateSize())), 
        Text = v19.description or "", 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Top, 
        TextSize = 16, 
        TextWrapped = true, 
        Font = l_AppFonts_0.default:getDefault(), 
        TextColor3 = v6.White, 
        [v2.Ref] = v19.descriptionRef
    });
end;
v11.calculateSize = function(v20)
    if not v20.descriptionRef.current or not v20.props.assetInfo then
        return ;
    else
        local l_Y_0 = l_TextService_0:GetTextSize(v20.description, 16, l_AppFonts_0.default:getDefault(), Vector2.new(v20.descriptionRef.current.AbsoluteSize.X, 5000)).Y;
        if not v8 then
            v20.descriptionRef.current.Parent.CanvasSize = UDim2.new(1, 0, 0, 451 + l_Y_0);
        end;
        return l_Y_0;
    end;
end;
return v3.UNSTABLE_connect2(function(v22, _)
    return {
        view = v22.view, 
        assetInfo = v22.assets[v22.detailsInformation.assetId], 
        detailsInformation = v22.detailsInformation, 
        bundleInfo = v22.bundles
    };
end)(v11);
