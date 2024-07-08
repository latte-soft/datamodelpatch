local l_CorePackages_0 = game:GetService("CorePackages");
local l_GuiService_0 = game:GetService("GuiService");
local l_Parent_0 = script.Parent.Parent;
local v3 = require(l_CorePackages_0.Roact);
local v4 = require(l_CorePackages_0.RoactRodux);
local v5 = require(l_Parent_0.Components.InitialView);
local v6 = require(l_Parent_0.Components.AssetDetails);
local v7 = require(l_Parent_0.Components.CloseButton);
local v8 = require(l_Parent_0.Components.Overlay);
local v9 = require(l_Parent_0.Components.NoInventoryNotice);
local v10 = require(l_Parent_0.Colors);
local v11 = require(l_Parent_0.Constants);
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v13 = require(l_Modules_0.Settings.Theme);
local v14 = require(l_Modules_0.TopBar.Constants);
local l_ScreenSideOffset_0 = v14.ScreenSideOffset;
local v16 = require(l_Parent_0.Components.InspectAndBuyContext);
local v17 = require(l_Parent_0.Flags.FFlagAttributionInInspectAndBuy);
local v18 = v3.PureComponent:extend("Container");
v18.init = function(v19)
    v19.frameRef = v3.createRef();
    v19.lastSavedSelectedCoreGui = nil;
end;
v18.didMount = function(v20)
    local l_gamepadEnabled_0 = v20.props.gamepadEnabled;
    v20.selectedCoreObjectChangedSignal = l_GuiService_0:GetPropertyChangedSignal("SelectedCoreObject"):Connect(function()
        if not (not v20.props.visible or not l_GuiService_0.SelectedCoreObject) then
            v20.lastSavedSelectedCoreGui = l_GuiService_0.SelectedCoreObject;
        end;
    end);
    if l_gamepadEnabled_0 then
        l_GuiService_0:AddSelectionParent("InspectMenu", v20.frameRef.current);
    end;
end;
v18.didUpdate = function(v22, v23)
    local l_visible_0 = v22.props.visible;
    local l_gamepadEnabled_1 = v22.props.gamepadEnabled;
    if (not l_visible_0 or not l_gamepadEnabled_1) or not v22.frameRef.current then
        if not (not (not l_gamepadEnabled_1 and v23.gamepadEnabled) and l_visible_0) then
            l_GuiService_0:RemoveSelectionGroup("InspectMenu");
        end;
    else
        l_GuiService_0:RemoveSelectionGroup("InspectMenu");
        l_GuiService_0:AddSelectionParent("InspectMenu", v22.frameRef.current);
        if v22.lastSavedSelectedCoreGui then
            l_GuiService_0.SelectedCoreObject = v22.lastSavedSelectedCoreGui;
        end;
    end;
    if not (not l_visible_0 or v23.visible) then
        l_GuiService_0.SelectedCoreObject = v22.lastSavedSelectedCoreGui;
    end;
end;
v18.willUnmount = function(v26)
    v26.selectedCoreObjectChangedSignal:disconnect();
    l_GuiService_0:RemoveSelectionGroup("InspectMenu");
    l_GuiService_0.SelectedCoreObject = nil;
end;
v18.render = function(v27)
    local l_view_0 = v27.props.view;
    local l_localPlayerModel_0 = v27.props.localPlayerModel;
    local l_visible_1 = v27.props.visible;
    local v31 = v13.UseInspectAndBuyPanel();
    local v32 = not v13.UIBloxThemeEnabled and 46 or v14.TopBarHeight;
    return v3.createElement(v16.Consumer, {
        render = function(v33)
            local v34 = v33[l_view_0];
            return v3.createElement("ImageButton", {
                Size = UDim2.new(1, not v31 and 0 or l_ScreenSideOffset_0 * -2, 1, if not v31 then v32 else v13.DefaultCornerRadius.Offset), 
                Position = UDim2.new(0, not v31 and 0 or l_ScreenSideOffset_0, 0, if not v31 then -v32 else 0), 
                BackgroundColor3 = v34.ContainerBackgroundColor, 
                BackgroundTransparency = v34.ContainerBackgroundTransparency, 
                Visible = l_visible_1, 
                Selectable = false, 
                AutoButtonColor = false, 
                AutoLocalize = false, 
                [v3.Event.Activated] = function()
                    if l_view_0 == v11.View.Wide then
                        l_GuiService_0:CloseInspectMenu();
                    end;
                end
            }, {
                UICorner = if not v31 then nil else v3.createElement("UICorner", {
                    CornerRadius = v13.DefaultCornerRadius
                }), 
                Overlay = if not v17 then nil else v3.createElement(v8), 
                MainContainer = v3.createElement("ImageButton", {
                    AnchorPoint = v34.ContainerAnchorPoint, 
                    Size = v34.ContainerSize, 
                    Position = v34.ContainerPosition, 
                    BackgroundColor3 = v10.Carbon, 
                    BorderSizePixel = 0, 
                    Active = true, 
                    AutoButtonColor = false, 
                    Selectable = false, 
                    [v3.Ref] = v27.frameRef
                }, {
                    AspectRatioConstraint = v34.UseContainerAspectRatio and v3.createElement("UIAspectRatioConstraint", {
                        AspectRatio = v34.ContainerAspectRatio
                    }), 
                    CloseButton = v3.createElement(v7), 
                    InitialView = v3.createElement(v5), 
                    AssetDetails = v3.createElement(v6, {
                        localPlayerModel = l_localPlayerModel_0
                    }), 
                    NoInventoryNotice = v3.createElement(v9)
                })
            });
        end
    });
end;
return v4.UNSTABLE_connect2(function(v35, _)
    return {
        view = v35.view, 
        visible = v35.visible, 
        gamepadEnabled = v35.gamepadEnabled
    };
end)(v18);
