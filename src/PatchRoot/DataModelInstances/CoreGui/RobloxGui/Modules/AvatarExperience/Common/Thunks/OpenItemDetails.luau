local l_CorePackages_0 = game:GetService("CorePackages");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v2 = require(l_CorePackages_0.Workspace.Packages.ArgCheck);
local _ = require(l_CorePackages_0.Packages.Dash);
local v4 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v5 = require(l_Modules_0.AvatarExperience.Common.Utils);
local v6 = require(l_Modules_0.AvatarExperience.Common.Thunks.NavigateIntoItemDetailsPage);
local _ = require(l_Modules_0.AvatarExperience.Common.Context.WidgetInfoContext);
local _ = require(l_Modules_0.AvatarExperience.Common.Types);
return function(v9)
    v2.assert(not (v9.mountAsFullView and v9.showFullWithNoPeekView));
    return function(v10)
        if v9.closePreviousItemDetails then
            v4.closeFiltersAndItemDetails(v9.navigation);
        end;
        local v11 = {
            itemId = v9.itemId, 
            itemType = v9.itemType, 
            itemSubType = v9.itemSubType, 
            itemDetailsPeekViewRefs = v9.itemDetailsPeekViewRefs, 
            resultsListRef = v9.resultsListRef, 
            isFirstItemDetails = true, 
            mountAsFullView = v9.mountAsFullView, 
            showFullWithNoPeekView = v9.showFullWithNoPeekView, 
            widgetInfo = v9.widgetInfo, 
            onItemDetailsClosed = v9.onItemDetailsClosed
        };
        if not (not v9.showFullWithNoPeekView and not v9.mountAsFullView) then
            v9.catalogAnalytics.openItemDetails(v9.itemId, v9.itemType, v9.priceInRobux, (v5.getCurrentScreenIgnoreItemDetails(v9.avatarRoute)));
        end;
        v10:dispatch(v6(v9.navigation, v11));
    end;
end;
