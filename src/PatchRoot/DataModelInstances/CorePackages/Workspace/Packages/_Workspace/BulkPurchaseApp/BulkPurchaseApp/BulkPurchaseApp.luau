local l_GuiService_0 = game:GetService("GuiService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("BulkPurchaseApp");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v3 = require(l_Parent_0.React);
local l_useSelector_0 = require(l_Parent_0.RoactUtils).Hooks.RoactRodux.useSelector;
local l_FocusNavigableSurfaceIdentifierEnum_0 = require(l_Parent_0.FocusNavigationUtils).FocusNavigableSurfaceIdentifierEnum;
local v6 = require(l_script_FirstAncestor_0.Enums.BulkPurchasePromptStateEnum);
local v7 = require(l_script_FirstAncestor_0.Features.BulkPurchaseError.BulkPurchaseErrorContainer);
local v8 = require(l_script_FirstAncestor_0.Features.BulkPurchaseSuccess.BulkPurchaseSuccessContainer);
local v9 = require(l_script_FirstAncestor_0.Features.BulkPurchasePartialSuccess.BulkPurchasePartialSuccessContainer);
local v10 = require(l_script_FirstAncestor_0.Features.BulkPurchaseRequest.BulkPurchaseRequestContainer);
local v11 = require(l_script_FirstAncestor_0.Hooks.ScreenSizeContext);
local v12 = require(l_script_FirstAncestor_0.Hooks.useBulkPurchaseRequestListenerEffect);
local v13 = require(l_script_FirstAncestor_0.Hooks.useFocusNavigationSurface);
local v14 = require(l_script_FirstAncestor_0.Store.Selectors.selectPromptState);
local v15 = require(l_script_FirstAncestor_0.Flags.FFlagFixBulkPurchaseFocusRelease);
return function()
    local v16, v17 = v3.useState(Vector2.new(0, 0));
    local v18 = l_useSelector_0(v14);
    local v19 = v13({
        selectionGroupName = "BulkPurchaseApp", 
        focusNavigableSurfaceIdentifier = l_FocusNavigableSurfaceIdentifierEnum_0.CentralOverlay
    });
    v12();
    if v15 then
        v3.useEffect(function()
            if v18 == v6.None then
                l_GuiService_0.SelectedCoreObject = nil;
            end;
        end, {
            v18
        });
    end;
    return v3.createElement(v11.Provider, {
        value = v16
    }, v3.createElement("ScreenGui", {
        [v3.Change.AbsoluteSize] = function(v20)
            v17(v20.AbsoluteSize);
        end, 
        ScreenInsets = Enum.ScreenInsets.None
    }, {
        FocusNavigationEffects = v3.createElement("Frame", {
            ref = if not not v15 and v18 == v6.None then nil else v19, 
            Size = UDim2.fromScale(1, 1), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            SelectionBehaviorDown = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorLeft = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorRight = Enum.SelectionBehavior.Stop, 
            SelectionBehaviorUp = Enum.SelectionBehavior.Stop
        }, {
            Error = if v18 == v6.Error then v3.createElement(v7) else nil, 
            Success = if v18 == v6.Success then v3.createElement(v8) else nil, 
            Request = if v18 == v6.Request then v3.createElement(v10) else nil, 
            PartialSuccess = if v18 == v6.PartialSuccess then v3.createElement(v9) else nil
        })
    }));
end;
