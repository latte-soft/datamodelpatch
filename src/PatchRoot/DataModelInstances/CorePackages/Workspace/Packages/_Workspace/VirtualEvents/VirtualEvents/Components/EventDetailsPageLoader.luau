local l_script_FirstAncestor_0 = script:FindFirstAncestor("VirtualEvents");
local v1 = require(l_script_FirstAncestor_0.Parent.ApolloClient);
local v2 = require(l_script_FirstAncestor_0.Parent.Cryo);
local v3 = require(l_script_FirstAncestor_0.Parent.React);
local v4 = require(l_script_FirstAncestor_0.Parent.UIBlox);
local l_useLocalization_0 = require(l_script_FirstAncestor_0.Parent.Localization).Hooks.useLocalization;
local v6 = require(l_script_FirstAncestor_0.Components.EventDetailsPage);
local v7 = require(l_script_FirstAncestor_0.requests);
local v8 = require(l_script_FirstAncestor_0.Common.getRetrievalStatusFromApolloQuery);
local l_useQuery_0 = v1.useQuery;
local l_LoadingStateContainer_0 = v4.App.Container.LoadingStateContainer;
local l_RetrievalStatus_0 = v4.App.Loading.Enum.RetrievalStatus;
local l_EmptyState_0 = v4.App.Indicator.EmptyState;
return function(v13)
    local v14 = l_useQuery_0(v7.GET_VIRTUAL_EVENT, {
        variables = {
            virtualEventId = v13.virtualEventId
        }
    });
    local v15 = v8(v14);
    local v16 = l_useLocalization_0({
        notFound = "Feature.VirtualEvents.EventNotFound"
    });
    if v13.mockNetworkStatus then
        v15 = v13.mockNetworkStatus;
    end;
    return v3.createElement(l_LoadingStateContainer_0, {
        dataStatus = l_RetrievalStatus_0.fromRawValue(v15), 
        renderOnLoaded = function()
            return v3.createElement(v3.Fragment, nil, {
                EventDetailsPage = v3.createElement(v6, (v2.Dictionary.join(v13, {
                    virtualEvent = v14.data.virtualEvent, 
                    virtualEventId = v2.None
                })))
            });
        end, 
        renderOnFailed = function()
            return v3.createElement(v3.Fragment, nil, {
                EventNotFound = v3.createElement(l_EmptyState_0, {
                    text = v16.notFound
                })
            });
        end
    });
end;
