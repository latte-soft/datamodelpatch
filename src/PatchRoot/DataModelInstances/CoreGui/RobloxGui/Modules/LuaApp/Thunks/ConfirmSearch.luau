local l_CoreGui_0 = game:GetService("CoreGui");
local l_CorePackages_0 = game:GetService("CorePackages");
local l_IXPService_0 = game:GetService("IXPService");
local l_Modules_0 = l_CoreGui_0.RobloxGui.Modules;
local v4 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local v5 = require(l_Modules_0.LuaApp.AppPage);
local v6 = require(l_Modules_0.LuaApp.Constants);
local v7 = require(l_Modules_0.LuaApp.SearchUuid);
local v8 = require(l_Modules_0.LuaApp.Analytics.Events.search);
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local v10 = require(l_Modules_0.LuaApp.Analytics.Events.catalogSearchEvent);
local v11 = require(l_Modules_0.LuaApp.Actions.SetSearchType);
local v12 = require(l_Modules_0.LuaApp.Actions.SetSearchParameters);
local v13 = require(l_Modules_0.LuaApp.Analytics.Sessions.SetGameSearchSession);
local v14 = require(l_Modules_0.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils);
local v15 = require(l_Modules_0.LuaApp.Thunks.NavigateSideways);
local v16 = require(l_Modules_0.LuaApp.Analytics.Sessions.OmniSearchSessionUtil);
local l_getAppFeaturePolicies_0 = require(l_CorePackages_0.Workspace.Packages.UniversalAppPolicy).getAppFeaturePolicies;
local l_GetFFlagTenFootUiSearch_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiSearch;
local l_GetFFlagTenFootUiExperiencesOmniLogFix_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).GetFFlagTenFootUiExperiencesOmniLogFix;
local l_FFlagCleanPlayerSearchProp_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagCleanPlayerSearchProp;
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local function _(v22)
    return v22[#v22].name == v5.SearchPage;
end;
local function v29(v24, v25, _, v27, _)
    if l_FFlagOmniSearchAutoTabIXP_0 then
        l_IXPService_0:LogUserLayerExposure(v4.OmniSearchResultsPageUXExposureLayer);
    end;
    v24:dispatch(v15({
        name = v5.SearchPage, 
        key = tostring(v25), 
        detail = v25, 
        extraProps = {
            omniSearchInfo = v27
        }
    }, false));
end;
return function(v30, v31)
    return function(v32)
        local l_searchType_0 = v31.searchType;
        if not (not l_FFlagOmniSearchAutoTabIXP_0 or not v31.isAutocompleteSuggestion) and l_searchType_0 == v6.SearchTypes.Auto then
            l_searchType_0 = v6.SearchTypes.Games;
        end;
        local v34 = v7();
        local v35 = v32:getState();
        local v36 = v35.Navigation.history[#v35.Navigation.history];
        local v37 = v36[#v36].name == v5.SearchPage;
        if not ((not l_FFlagCleanPlayerSearchProp_0 and not v31.playerSearch or not v37) or not v6.IsSearchTypeInOmniSearch(l_searchType_0)) then
            l_searchType_0 = v35.CurrentOmniSearchType;
        end;
        v32:dispatch(v11(v34, l_searchType_0));
        v32:dispatch(v12(v34, {
            searchKeyword = v30, 
            isKeywordSuggestionEnabled = true
        }));
        if not if not l_FFlagCleanPlayerSearchProp_0 then not v31.playerSearch else false then
            if not v6.IsSearchTypeInOmniSearch(l_searchType_0) then
                if l_searchType_0 == v6.SearchTypes.Catalog then
                    v31.topBarAnalytics.reportSearched("catalog", v30);
                    if v31.isAvatarAutocompleteEnabled then
                        v10(v31.eventIngest, "catalog", v30, v31.isAutocompleteSuggestion, v31.pageOwner, v31.allAutocompleteSuggestions);
                    end;
                    v14.navigateToSearch(v31.navigation, v34, {
                        searchKeyword = v30
                    });
                end;
            else
                local v38 = v16.generateUuid();
                v16.create(v31.sessionService, v38, v30, l_searchType_0);
                if not l_FFlagOmniSearchAutoTabIXP_0 then
                    v8(v31.eventIngest, l_searchType_0, "search", v30);
                elseif l_searchType_0 ~= v6.SearchTypes.Auto then
                    v8(v31.eventIngest, l_searchType_0, "search", v30);
                end;
                v31.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
                local v39 = {
                    omniSearchUuid = v38, 
                    searchKeyword = v30
                };
                if not l_GetFFlagTenFootUiExperiencesOmniLogFix_0() then
                    v29(v32, v34, nil, v39, v31.isAvatarAutocompleteEnabled);
                    return ;
                elseif not l_getAppFeaturePolicies_0().getSearchWithoutNavigatingEnabled() then
                    v29(v32, v34, nil, v39, v31.isAvatarAutocompleteEnabled);
                    return ;
                end;
            end;
        else
            if l_searchType_0 == v6.SearchTypes.Games then
                v13(v31.sessionService, v34, v30);
                v8(v31.eventIngest, "games", "search", v30);
                v31.sessionService:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
            elseif l_searchType_0 == v6.SearchTypes.Catalog then
                v31.topBarAnalytics.reportSearched("catalog", v30);
                if v31.isAvatarAutocompleteEnabled then
                    v10(v31.eventIngest, "catalog", v30, v31.isAutocompleteSuggestion, v31.pageOwner, v31.allAutocompleteSuggestions);
                end;
            end;
            if l_searchType_0 == v6.SearchTypes.Catalog then
                v14.navigateToSearch(v31.navigation, v34, {
                    searchKeyword = v30
                });
                return ;
            else
                local v40 = if not l_GetFFlagTenFootUiSearch_0() then nil else l_getAppFeaturePolicies_0().getSearchWithoutNavigatingEnabled();
                if not (l_GetFFlagTenFootUiSearch_0() and v40) then
                    v29(v32, v34, l_searchType_0, nil, v31.isAvatarAutocompleteEnabled);
                    return ;
                end;
            end;
        end;
    end;
end;
