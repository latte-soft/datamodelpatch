local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local _ = require(l_script_FirstAncestor_0.Parent.GraphQLServer);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Parent.RoactAppExperiment);
local v7 = require(script.Parent.PaginatedVerticalList);
local v8 = require(script.Parent.ExposureLogger);
local v9 = require(l_script_FirstAncestor_0.Common.sortEventsByStartDate);
local _ = require(l_script_FirstAncestor_0.types);
local v11 = require(script.Parent.EventRow);
local l_getFFlagRemoveVirtualEventsExperiment_0 = require(l_script_FirstAncestor_0.Parent.SharedFlags).getFFlagRemoveVirtualEventsExperiment;
local l_StyledTextLabel_0 = v4.App.Text.StyledTextLabel;
local l_useStyle_0 = v4.Core.Style.useStyle;
local l_useUserExperiment_0 = v6.useUserExperiment;
local v16 = UDim.new(0, 12);
local v17 = {
    initialEventsShown = 1, 
    extraEventsShownOnLoad = 3, 
    isDesktopGrid = false
};
return function(v18)
    local v19 = v2.Dictionary.join(v17, v18);
    local v22 = if not l_getFFlagRemoveVirtualEventsExperiment_0() then l_useUserExperiment_0({
        "Ecosystems.EventsOnExperienceDetailsPage"
    }, function(v20)
        local v21 = v20["Ecosystems.EventsOnExperienceDetailsPage"];
        if not v21 then
            return nil;
        else
            return v21.virtualEventsMVPEnabled;
        end;
    end, false) else nil;
    if v19.mockVirtualEventsMVPEnabled ~= nil then
        v22 = v19.mockVirtualEventsMVPEnabled;
    end;
    local v23 = l_useStyle_0();
    local v24 = l_useLocalization_0({
        title = "Feature.VirtualEvents.EventsListTitle"
    });
    local v27 = v3.useCallback(function(v25, v26)
        if v19.onRsvpChanged then
            v19.onRsvpChanged(v25, v26);
        end;
    end, {
        v19.onRsvpChanged
    });
    local v29 = v3.useCallback(function(v28)
        if v19.onJoinEvent then
            v19.onJoinEvent(v28);
        end;
    end, {});
    local v31 = v3.useCallback(function(v30)
        if v19.onTileActivated then
            v19.onTileActivated(v30);
        end;
    end, {});
    local v33 = v3.useCallback(function(v32)
        if v19.onEventImpression then
            v19.onEventImpression(v32);
        end;
    end, {
        v19.onEventImpression
    });
    if #v19.virtualEvents == 0 then
        return nil;
    else
        local v34 = v9(v19.virtualEvents);
        local v35 = {};
        for _, v37 in v34, nil, nil do
            table.insert(v35, (v3.createElement(v11, {
                virtualEvent = v37, 
                onRsvpChanged = function(...)
                    v27(v37, ...);
                end, 
                onJoinEvent = function()
                    v29(v37);
                end, 
                onTileActivated = function()
                    v31(v37);
                end, 
                onImpression = function()
                    v33(v37);
                end
            })));
        end;
        if not l_getFFlagRemoveVirtualEventsExperiment_0() then
            return v3.createElement("Frame", {
                LayoutOrder = v19.layoutOrder, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                ExposureLogger = v3.createElement(v8, {
                    exposureLayer = "Ecosystems.EventsOnExperienceDetailsPage"
                }), 
                Wrapper = if not v22 then nil else v3.createElement("Frame", {
                    Size = UDim2.fromScale(1, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    BackgroundTransparency = 1
                }, {
                    Layout = v3.createElement("UIListLayout", {
                        SortOrder = Enum.SortOrder.LayoutOrder, 
                        Padding = v16
                    }), 
                    Title = v3.createElement(l_StyledTextLabel_0, {
                        layoutOrder = 1, 
                        text = v24.title, 
                        colorStyle = v23.Theme.TextEmphasis, 
                        fontStyle = v23.Font.Header1
                    }), 
                    PaginatedList = v3.createElement(v7, {
                        layoutOrder = 2, 
                        initialItemsShown = v19.initialEventsShown, 
                        extraItemsShownOnLoad = v19.extraEventsShownOnLoad, 
                        items = v35, 
                        isDesktopGrid = v19.isDesktopGrid
                    })
                })
            });
        else
            return v3.createElement("Frame", {
                LayoutOrder = v19.layoutOrder, 
                Size = UDim2.fromScale(1, 0), 
                AutomaticSize = Enum.AutomaticSize.Y, 
                BackgroundTransparency = 1
            }, {
                Layout = v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    Padding = v16
                }), 
                Title = v3.createElement(l_StyledTextLabel_0, {
                    layoutOrder = 1, 
                    text = v24.title, 
                    colorStyle = v23.Theme.TextEmphasis, 
                    fontStyle = v23.Font.Header1
                }), 
                PaginatedList = v3.createElement(v7, {
                    layoutOrder = 2, 
                    initialItemsShown = v19.initialEventsShown, 
                    extraItemsShownOnLoad = v19.extraEventsShownOnLoad, 
                    items = v35, 
                    isDesktopGrid = v19.isDesktopGrid
                })
            });
        end;
    end;
end;
