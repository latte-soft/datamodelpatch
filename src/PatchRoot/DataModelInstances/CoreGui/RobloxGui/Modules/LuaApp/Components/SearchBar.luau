local l_CorePackages_0 = game:GetService("CorePackages");
local l_RunService_0 = game:GetService("RunService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Modules_0 = game:GetService("CoreGui").RobloxGui.Modules;
local v4 = require(l_CorePackages_0.Packages.t);
local v5 = require(l_CorePackages_0.Otter);
local v6 = require(l_CorePackages_0.UIBlox);
local v7 = require(l_CorePackages_0.Cryo);
local l_withStyle_0 = v6.Style.withStyle;
local l_withSelectionCursorProvider_0 = v6.App.SelectionImage.withSelectionCursorProvider;
local l_withLocalization_0 = require(l_CorePackages_0.Workspace.Packages.Localization).withLocalization;
local l_CursorKind_0 = v6.App.SelectionImage.CursorKind;
local l_Images_0 = v6.App.ImageSet.Images;
local l_ImageSetLabel_0 = v6.Core.ImageSet.ImageSetLabel;
local v14 = require(l_CorePackages_0.Roact);
local v15 = require(l_CorePackages_0.Packages.RoactGamepad);
local l_Focusable_0 = v15.Focusable;
local v17 = require(l_CorePackages_0.RoactRodux);
local l_RetrievalStatus_0 = require(l_CorePackages_0.Workspace.Packages.Http).Enum.RetrievalStatus;
local v19 = require(l_Modules_0.LuaApp.Util.SearchUtil);
local v20 = require(l_Modules_0.LuaApp.Constants);
local v21 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetLabel);
local v22 = require(l_Modules_0.LuaApp.Components.DEPRECATED_ImageSetButton);
local v23 = require(l_Modules_0.LuaApp.Components.SearchBarListPicker);
local v24 = require(l_Modules_0.LuaApp.FitChildren);
local v25 = require(l_Modules_0.LuaApp.Thunks.FetchAutocompleteSuggestion);
local l_ApiFetchGameIcons_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.ApiFetchGameIcons;
local v27 = require(l_Modules_0.LuaApp.Actions.SetSearchBarFocused);
local l_RoactServices_0 = require(l_CorePackages_0.Workspace.Packages.RoactServices).RoactServices;
local l_AppSessionService_0 = require(l_CorePackages_0.Workspace.Packages.RoactServiceTags).AppSessionService;
local l_SessionType_0 = require(l_CorePackages_0.Workspace.Packages.RobloxAppSessionization).SessionType;
local l_ExternalEventConnection_0 = require(l_CorePackages_0.Workspace.Packages.RoactUtils).ExternalEventConnection;
local v32 = require(l_Modules_0.LuaApp.Services.RoactNetworking);
local v33 = require(l_Modules_0.LuaApp.Models.AutocompleteSuggestion);
local v34 = require(l_Modules_0.LuaApp.Analytics.Events.searchAutocomplete);
local v35 = require(l_Modules_0.LuaApp.Analytics.Events.searchAutocompleteEventNew);
local v36 = require(l_Modules_0.LuaApp.Analytics.Events.searchTextTrim);
local v37 = require(l_Modules_0.LuaApp.Analytics.Events.searchClear);
local v38 = require(l_Modules_0.LuaApp.Analytics.Events.searchSuggestionClicked);
local v39 = require(l_Modules_0.LuaApp.getCurrentPage);
local v40 = require(l_Modules_0.LuaApp.Services.AppEventIngestService);
local v41 = require(l_Modules_0.LuaApp.Experiment.RoactAppExperiment);
local v42 = require(l_Modules_0.LuaApp.Experiment.AppUserLayers);
local l_IsVRAppBuild_0 = require(l_CorePackages_0.Workspace.Packages.AppCommonLib).IsVRAppBuild;
local l_GameIconReducer_0 = require(l_CorePackages_0.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer;
local v45 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAutocompleteDebounceMs);
local v46 = require(l_Modules_0.LuaApp.Flags.GetFIntLuaAppAutocompleteSearchTextMaxLen);
local v47 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAutocompleteIXPConfig);
local v48 = require(l_Modules_0.LuaApp.Flags.GetFFlagLuaAppAutocompleteLatencyLogFix);
local v49 = require(l_Modules_0.AvatarExperience.Flags.GetFFlagAvatarAutocompleteEnabledForAll);
local v50 = require(l_Modules_0.LuaApp.Flags.FFlagOmniSearchUpdatePlaceholderTextIXP);
local l_FFlagOmniSearchAutoTabIXP_0 = require(l_CorePackages_0.Workspace.Packages.SharedFlags).FFlagOmniSearchAutoTabIXP;
local v52 = v45() / 1000;
local v53 = {
    Image = "LuaApp/buttons/buttonFill", 
    SliceCenter = Rect.new(8, 8, 9, 9)
};
local v54 = l_Images_0["icons/actions/edit/clear_small"];
local v55 = {
    [Enum.UserInputType.Keyboard] = true, 
    [Enum.UserInputType.Gamepad1] = true, 
    [Enum.UserInputType.Gamepad2] = true, 
    [Enum.UserInputType.Gamepad3] = true, 
    [Enum.UserInputType.Gamepad4] = true, 
    [Enum.UserInputType.Gamepad5] = true, 
    [Enum.UserInputType.Gamepad6] = true, 
    [Enum.UserInputType.Gamepad7] = true, 
    [Enum.UserInputType.Gamepad8] = true
};
local l_l_UserInputService_0_Platform_0 = l_UserInputService_0:GetPlatform();
local v57 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.XBox360 then
    v57 = l_l_UserInputService_0_Platform_0 == Enum.Platform.XBoxOne;
end;
local v58 = true;
if l_l_UserInputService_0_Platform_0 ~= Enum.Platform.IOS then
    v58 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
end;
local v59 = l_l_UserInputService_0_Platform_0 == Enum.Platform.Android;
local v60 = v14.PureComponent:extend("SearchBar");
v60.validateProps = v4.strictInterface({
    Size = v4.optional(v4.UDim2), 
    position = v4.optional(v4.UDim2), 
    anchorPoint = v4.optional(v4.Vector2), 
    cancelSearch = v4.optional(v4.callback), 
    confirmSearch = v4.optional(v4.callback), 
    onTextCleared = v4.optional(v4.callback), 
    onFocused = v4.optional(v4.callback), 
    placeholderText = v4.optional(v4.string), 
    isCompactView = v4.optional(v4.boolean), 
    modernUI = v4.optional(v4.boolean), 
    initialSearchText = v4.optional(v4.string), 
    autocomplete = v4.optional(v4.boolean), 
    searchType = v4.optional(v4.string), 
    isSearching = v4.optional(v4.boolean), 
    searchBarPadding = v4.optional(v4.number), 
    animated = v4.optional(v4.boolean), 
    focusController = v4.optional(v4.table), 
    forwardRef = v4.optional(v4.table), 
    [v14.Ref] = v4.optional(v4.table), 
    NextSelectionDown = v4.optional(v4.table), 
    NextSelectionRight = v4.optional(v4.table), 
    autocompleteIXPConfigTbl = v4.optional(v4.table), 
    ixpDisableGamesAutocomplete = v4.optional(v4.boolean), 
    forceShowCancelButton = v4.optional(v4.boolean), 
    textSize = if not v50 then nil else v4.optional(v4.number), 
    gameIcons = v4.optional(v4.table), 
    autocompleteSuggestions = v4.optional(v4.table), 
    avatarAutocompleteSuggestions = v4.optional(v4.table), 
    currentPage = v4.string, 
    getAutocompleteFetchingStatus = v4.callback, 
    fetchAutocompleteSuggestion = v4.callback, 
    fetchGameIcons = v4.callback, 
    setSearchBarFocused = v4.callback, 
    networking = v4.callback, 
    eventIngest = v4.table, 
    sessionService = v4.optional(v4.union(v4.Instance, v4.table))
});
v60.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    cancelSearch = nil, 
    confirmSearch = nil, 
    onTextCleared = nil, 
    onFocused = nil, 
    placeholderText = "", 
    isCompactView = false, 
    modernUI = false, 
    initialSearchText = "", 
    autocomplete = false, 
    searchType = "None", 
    isSearching = false, 
    searchBarPadding = 24, 
    animated = false, 
    forceShowCancelButton = false, 
    textSize = nil
};
v60.init = function(v61)
    local v62 = v61.props.initialSearchText or "";
    v61.state = {
        clearButtonVisible = v62 ~= "", 
        autocompleteKeyword = "", 
        lastInputType = Enum.UserInputType.None, 
        listPickerShown = false
    };
    v61.searchBoxBackgroundRef = v14.createRef();
    v61.searchBoxRef = v14.createRef();
    v61.clearRef = v14.createRef();
    v61.cancelRef = v14.createRef();
    v61.listPickerRef = v14.createRef();
    v61.lastSearchBoxText = v62 or "";
    v61.lastAutocompleteUpdateTime = 0;
    v61.lastAutocompleteCached = false;
    v61.lastAutocompleteEventKeyword = "";
    v61.lastStoredListPickerItems = {};
    v61.requestAutocompleteSuggestion = function(v63)
        v61.props.fetchAutocompleteSuggestion(v61.props.networking, v63, v61.props.autocompleteIXPConfigTbl, v61.props.searchType);
    end;
    v61.requestRichSuggestionIcons = function(v64)
        local l_networking_0 = v61.props.networking;
        local l_fetchGameIcons_0 = v61.props.fetchGameIcons;
        local v67 = {};
        for v68 = 1, #v64.entries do
            local v69 = v64.entries[v68];
            if v69.type == v33.EntryType.Rich then
                table.insert(v67, v69.universeId);
            end;
        end;
        if #v67 > 0 then
            l_fetchGameIcons_0(l_networking_0, v67);
        end;
    end;
    v61.updateAutocomplete = function(v70)
        if v70 == v61.state.autocompleteKeyword then
            return ;
        elseif v46() < string.len(v70) then
            return ;
        else
            local v71 = v61.getCachedAutocompleteSuggestion(v70);
            local v72 = false;
            if v71 ~= nil then
                v72 = tick() < v71.expirationTime;
            end;
            v61.lastAutocompleteUpdateTime = tick();
            v61.lastAutocompleteCached = v72;
            v61:setState({
                autocompleteKeyword = v70
            });
            if v70 ~= "" and not v72 then
                local v73 = tick();
                spawn(function()
                    local l_v70_0 = v70;
                    local v75 = (v73 + v52) - tick();
                    if v75 > 0 then
                        wait(v75);
                    end;
                    if l_v70_0 == v61.state.autocompleteKeyword then
                        v61.requestAutocompleteSuggestion(l_v70_0);
                    end;
                end);
                return ;
            else
                if not (not v72 or not v71.preloadedCache) then
                    v61.requestRichSuggestionIcons(v71);
                end;
                return ;
            end;
        end;
    end;
    v61.doConfirmSearch = function(v76, v77, v78)
        if v61.isMounted then
            if v48() then
                v61.resetAutocompleteEvent();
            end;
            local l_current_0 = v61.searchBoxRef.current;
            if not (not l_current_0 or not l_current_0:IsFocused()) then
                l_current_0:ReleaseFocus();
            end;
            local l_initialSearchText_0 = v61.props.initialSearchText;
            if l_initialSearchText_0 == v76 then
                return ;
            else
                local l_confirmSearch_0 = v61.props.confirmSearch;
                if l_confirmSearch_0 then
                    if not v49() then
                        if not l_FFlagOmniSearchAutoTabIXP_0 then
                            l_confirmSearch_0(v76);
                        else
                            l_confirmSearch_0(v76, v77);
                        end;
                    else
                        l_confirmSearch_0(v76, v77, v78);
                    end;
                end;
                if v61.searchBoxRef.current then
                    v61.searchBoxRef.current.Text = l_initialSearchText_0;
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    v61.doCancelSearch = function()
        if v61.isMounted then
            if v48() then
                v61.resetAutocompleteEvent();
            end;
            local l_current_1 = v61.searchBoxRef.current;
            if not (not l_current_1 or not l_current_1:IsFocused()) then
                l_current_1:ReleaseFocus();
            end;
            local l_cancelSearch_0 = v61.props.cancelSearch;
            if l_cancelSearch_0 then
                l_cancelSearch_0();
            end;
            if v61.searchBoxRef.current then
                v61.searchBoxRef.current.Text = v61.props.initialSearchText;
            end;
            return ;
        else
            return ;
        end;
    end;
    v61.onFocused = function()
        if v61.isMounted then
            v61.props.setSearchBarFocused(true);
            if v61.props.onFocused then
                v61.props.onFocused();
            end;
            return ;
        else
            return ;
        end;
    end;
    v61.onFocusLost = function(v84, v85, v86)
        if v61.isMounted then
            v61.props.setSearchBarFocused(false);
            if (not (v86 == nil) or not v59 and not v57) or l_IsVRAppBuild_0() then
                if not (not v85 or v58 and not l_RunService_0:IsStudio()) then
                    v61.doConfirmSearch(v84.Text);
                end;
                return ;
            else
                v61.doCancelSearch();
                return ;
            end;
        else
            return ;
        end;
    end;
    v61.onReturnPressedFromOnScreenKeyboard = function(v87)
        v61.doConfirmSearch(v87.Text);
    end;
    v61.onCancelButtonActivated = function()
        if v61.isMounted then
            v61.doCancelSearch();
            local l_searchType_0 = v61.props.searchType;
            local l_sessionService_0 = v61.props.sessionService;
            if l_sessionService_0 and l_searchType_0 == v20.SearchTypes.Games then
                l_sessionService_0:RemoveSession(l_SessionType_0.StructuralIdentifier.GameSearchAutocomplete);
            end;
        end;
    end;
    v61.onClearText = function()
        if v61.isMounted then
            if v61.searchBoxRef.current then
                v37(v61.props.eventIngest, v61.getEventContext(), v61.searchBoxRef.current.Text, v61.props.searchType);
                v61.searchBoxRef.current.Text = "";
                v61.searchBoxRef.current:captureFocus();
                if not (not v55[v61.state.lastInputType] or not v61.props.focusController) then
                    v61.props.focusController.moveFocusTo(v61.searchBoxRef);
                end;
            end;
            return ;
        else
            return ;
        end;
    end;
    v61.onTextChanged = function(v90)
        if v61.isMounted then
            if v90 then
                local l_Text_0 = v90.Text;
                local v92 = l_Text_0 ~= "";
                if v92 ~= v61.state.clearButtonVisible then
                    v61:setState({
                        clearButtonVisible = v92
                    });
                end;
                if v61.props.autocomplete and not v61.props.ixpDisableGamesAutocomplete then
                    v61.updateAutocomplete((v19.KeywordNormalize((l_Text_0:lower()))));
                end;
                if v90:IsFocused() then
                    local l_lastSearchBoxText_0 = v61.lastSearchBoxText;
                    if string.len(l_Text_0) < string.len(l_lastSearchBoxText_0) then
                        v36(v61.props.eventIngest, v61.getEventContext(), l_lastSearchBoxText_0, l_Text_0, v61.props.searchType);
                    end;
                end;
                v61.lastSearchBoxText = l_Text_0;
                if l_Text_0 == "" then
                    local l_onTextCleared_0 = v61.props.onTextCleared;
                    if l_onTextCleared_0 then
                        l_onTextCleared_0();
                    end;
                end;
                return ;
            else
                return ;
            end;
        else
            return ;
        end;
    end;
    v61.getListPickerItems = function()
        local v95 = {};
        local l_autocompleteKeyword_0 = v61.state.autocompleteKeyword;
        if l_autocompleteKeyword_0 == "" then
            v61.lastStoredListPickerItems = v95;
            return v95;
        else
            local v97 = v61.getCachedAutocompleteSuggestion(l_autocompleteKeyword_0);
            if not v97 then
                local v98 = v61.props.getAutocompleteFetchingStatus(l_autocompleteKeyword_0);
                if not (v98 ~= l_RetrievalStatus_0.NotStarted) or v98 == l_RetrievalStatus_0.Fetching then
                    return v61.lastStoredListPickerItems;
                end;
            end;
            if v97 then
                local l_gameIcons_0 = v61.props.gameIcons;
                for v100 = 1, #v97.entries do
                    local v101 = v97.entries[v100];
                    local v102 = false;
                    local v103 = nil;
                    local v104 = "";
                    local v105 = "";
                    if v101.type == v33.EntryType.Rich then
                        v102 = true;
                        local v106 = l_gameIcons_0[tostring(v101.universeId)];
                        if v106 then
                            v103 = v106.url;
                        end;
                        v104 = v101.canonicalTitle;
                        v105 = v101.canonicalTitle;
                    elseif v101.type == v33.EntryType.Keyword then
                        v104 = v101.searchQuery:lower();
                        v105 = v104;
                    end;
                    do
                        local l_v105_0 = v105;
                        table.insert(v95, {
                            isRichItem = v102, 
                            displayIcon = v103, 
                            text = v104, 
                            onSelect = function()
                                v38(v61.props.eventIngest, v61.getEventContext(), l_autocompleteKeyword_0, v61.props.searchType, v97.entries, v100, v101);
                                v61.doConfirmSearch(l_v105_0, true, v97.entries);
                            end
                        });
                    end;
                end;
            end;
            v61.lastStoredListPickerItems = v95;
            return v95;
        end;
    end;
    v61.getCachedAutocompleteSuggestion = function(v108)
        local l_autocompleteSuggestions_0 = v61.props.autocompleteSuggestions;
        if v49() and v61.props.searchType == v20.SearchTypes.Catalog then
            l_autocompleteSuggestions_0 = v61.props.avatarAutocompleteSuggestions;
        end;
        return l_autocompleteSuggestions_0[v108];
    end;
    v61.getEventContext = function()
        if v49() and v61.props.searchType == v20.SearchTypes.Catalog then
            return "AvatarShopSearch";
        else
            return "GameSearch";
        end;
    end;
    v61.resetAutocompleteEvent = function()
        v61.lastAutocompleteUpdateTime = 0;
        v61.lastAutocompleteEventKeyword = "";
    end;
    v61.updateAutocompleteEvent = function()
        if v61.props.autocomplete and not v61.props.ixpDisableGamesAutocomplete then
            if v48() and v61.lastAutocompleteUpdateTime == 0 then
                return ;
            else
                local l_autocompleteKeyword_1 = v61.state.autocompleteKeyword;
                if v61.lastAutocompleteEventKeyword ~= l_autocompleteKeyword_1 then
                    local v111 = v61.getCachedAutocompleteSuggestion(l_autocompleteKeyword_1);
                    if v111 then
                        local l_eventIngest_0 = v61.props.eventIngest;
                        local l_currentPage_0 = v61.props.currentPage;
                        local v114 = (tick() - v61.lastAutocompleteUpdateTime) * 1000;
                        if not v49() then
                            v34(l_eventIngest_0, "GameSearch", l_autocompleteKeyword_1, v61.lastAutocompleteEventKeyword, v111, l_currentPage_0, v114, v61.lastAutocompleteCached);
                        else
                            v35(l_eventIngest_0, v61.getEventContext(), l_autocompleteKeyword_1, v61.lastAutocompleteEventKeyword, v111, l_currentPage_0, v114, v61.lastAutocompleteCached, v61.props.searchType);
                        end;
                        v61.lastAutocompleteEventKeyword = l_autocompleteKeyword_1;
                    end;
                end;
            end;
        end;
    end;
    v61.onSearchIconActivated = function()
        local l_current_2 = v61.searchBoxRef.current;
        local l_isSearching_0 = v61.props.isSearching;
        if not ((not l_current_2 or not l_isSearching_0) or l_current_2:IsFocused()) then
            l_current_2:CaptureFocus();
        end;
    end;
end;
v60.didUpdate = function(v117)
    local l_current_3 = v117.searchBoxRef.current;
    if l_current_3 then
        local l_isSearching_1 = v117.props.isSearching;
        local l_listPickerShown_0 = v117.state.listPickerShown;
        if not l_isSearching_1 then
            if l_listPickerShown_0 then
                v117:setState({
                    listPickerShown = false
                });
            end;
        else
            local l_autocompleteKeyword_2 = v117.state.autocompleteKeyword;
            if not l_listPickerShown_0 and l_autocompleteKeyword_2 ~= "" then
                v117:setState({
                    listPickerShown = true
                });
            end;
        end;
        if v48() then
            v117.updateAutocompleteEvent();
        end;
    end;
    if not ((v48() or not l_current_3) or not l_current_3:IsFocused()) then
        v117.updateAutocompleteEvent();
    end;
end;
v60.didMount = function(v122)
    v122.isMounted = true;
    if v122.animationMotor then
        v122.animationMotor:destroy();
    end;
    v122.animationMotor = v5.createSingleMotor(0);
    v122.animationMotor:onStep(function(v123)
        if v122.isMounted then
            local l_current_4 = v122.searchBoxBackgroundRef.current;
            if l_current_4 then
                l_current_4.Size = UDim2.new(v123, 0, 1, 0);
                l_current_4.Position = UDim2.new(1 - v123, 0, 0, 0);
            end;
        end;
    end);
    if v122.props.animated then
        v122.animationMotor:setGoal(v5.spring(1, {
            dampingRatio = 1, 
            frequency = 4
        }));
    end;
    local l_current_5 = v122.searchBoxRef.current;
    if not ((not l_current_5 or not v122.props.isSearching) or l_current_5:IsFocused()) then
        l_current_5:CaptureFocus();
    end;
end;
v60.willUnmount = function(v126)
    v126.isMounted = false;
    if v126.animationMotor then
        v126.animationMotor:destroy();
    end;
end;
v60.renderWithProviders = function(v127, v128, v129)
    local l_Size_0 = v127.props.Size;
    local l_isCompactView_0 = v127.props.isCompactView;
    local l_modernUI_0 = v127.props.modernUI;
    local l_clearButtonVisible_0 = v127.state.clearButtonVisible;
    local v134 = 28;
    local v135 = 12;
    local v136 = 20;
    local v137 = not l_isCompactView_0 and 36 or 12;
    local v138 = not not l_clearButtonVisible_0 and v137 + 28 or v137;
    local v139 = 88;
    local v140 = not l_isCompactView_0;
    if not (not l_isCompactView_0 and not l_modernUI_0) then
        v134 = 36;
        v135 = v127.props.searchBarPadding;
        v136 = 24;
        v137 = (9 + v136) + 9;
        v138 = not not l_clearButtonVisible_0 and v137 + 28 or v137;
        v139 = 70;
        v140 = true;
    end;
    local v141 = v127.props.autocomplete and not v127.props.ixpDisableGamesAutocomplete;
    local l_isSearching_2 = v127.props.isSearching;
    local l_listPickerShown_1 = v127.state.listPickerShown;
    local v144 = UDim.new(1, 0);
    local v145 = v141 and l_listPickerShown_1;
    local v146 = l_isSearching_2 or v127.props.forceShowCancelButton;
    local v147 = not not v146 and (not v127.cancelRef.current and 0 or v127.cancelRef.current.AbsoluteSize.X) or 0;
    local l_animated_0 = v127.props.animated;
    return l_withStyle_0(function(v149)
        local l_TextEmphasis_0 = v149.Theme.TextEmphasis;
        local v151 = v140 and v14.createElement(v22, {
            Size = UDim2.new(0, v136, 0, v136), 
            Position = UDim2.new(0, 9, 0.5, 0), 
            Image = "LuaApp/icons/ic-search-new", 
            BackgroundTransparency = 1, 
            AnchorPoint = Vector2.new(0, 0.5), 
            ImageColor3 = v149.Theme.SystemPrimaryDefault.Color, 
            ImageTransparency = v149.Theme.SystemPrimaryDefault.Transparency, 
            [v14.Event.Activated] = v127.onSearchIconActivated
        });
        local v152 = v127.getListPickerItems();
        local v153 = v14.createElement(l_Focusable_0.Frame, {
            Size = UDim2.new(1, 0, 1, 0), 
            Position = UDim2.new(0, 0, 0, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            [v14.Ref] = v127.props.forwardRef, 
            NextSelectionDown = if not v145 then v127.props.NextSelectionDown else v127.searchBoxRef, 
            NextSelectionRight = v127.props.NextSelectionRight, 
            defaultChild = v127.searchBoxRef, 
            inputBindings = {
                CancelSearch = v15.Input.onBegin(Enum.KeyCode.ButtonB, v127.doCancelSearch)
            }
        }, {
            Layout = v14.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                VerticalAlignment = Enum.VerticalAlignment.Center, 
                Padding = UDim.new(0, 7)
            }), 
            SearchBoxContainer = v14.createElement("Frame", {
                Size = UDim2.new(1, -v147, 0, v134), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                LayoutOrder = 1
            }, {
                SearchBoxBackground = v14.createElement(v21, {
                    Size = not not l_animated_0 and UDim2.new(0, 0, 0, 0) or UDim2.new(1, 0, 1, 0), 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1, 
                    BorderSizePixel = 0, 
                    Image = v53.Image, 
                    ImageColor3 = v149.Theme.UIMuted.Color, 
                    ImageTransparency = v149.Theme.UIMuted.Transparency, 
                    ScaleType = Enum.ScaleType.Slice, 
                    SliceCenter = v53.SliceCenter, 
                    [v14.Ref] = v127.searchBoxBackgroundRef, 
                    ClipsDescendants = true
                }, {
                    SearchIcon = v151, 
                    SearchBox = v14.createElement(l_Focusable_0.TextBox, {
                        Size = UDim2.new(1, -v138, 1, 0), 
                        Position = UDim2.new(0, v137, 0.5, 0), 
                        AnchorPoint = Vector2.new(0, 0.5), 
                        BackgroundTransparency = 1, 
                        BorderSizePixel = 0, 
                        Text = v127.props.initialSearchText or "", 
                        Font = v149.Font.Body.Font, 
                        TextSize = if not v50 then v149.Font.BaseSize * v149.Font.Body.RelativeSize else (v127.props.textSize or v149.Font.BaseSize) * v149.Font.Body.RelativeSize, 
                        TextColor3 = l_TextEmphasis_0.Color, 
                        TextTransparency = l_TextEmphasis_0.Transparency, 
                        TextWrapped = false, 
                        TextXAlignment = Enum.TextXAlignment.Left, 
                        ClipsDescendants = true, 
                        PlaceholderText = v127.props.placeholderText, 
                        PlaceholderColor3 = l_TextEmphasis_0.Color, 
                        OverlayNativeInput = true, 
                        TextInputType = Enum.TextInputType.NoSuggestions, 
                        ReturnKeyType = Enum.ReturnKeyType.Search, 
                        ClearTextOnFocus = false, 
                        [v14.Ref] = v127.searchBoxRef, 
                        [v14.Event.FocusLost] = v127.onFocusLost, 
                        [v14.Event.Focused] = v127.onFocused, 
                        [v14.Change.Text] = v127.onTextChanged, 
                        [v14.Event.ReturnPressedFromOnScreenKeyboard] = v127.onReturnPressedFromOnScreenKeyboard, 
                        NextSelectionRight = if not l_clearButtonVisible_0 then if v146 then v127.cancelRef else nil else v127.clearRef, 
                        NextSelectionDown = if #v152 > 0 then v127.listPickerRef else if v145 then v127.searchBoxRef else nil, 
                        SelectionImageObject = v128(l_CursorKind_0.InputFields)
                    }), 
                    ClearButton = v14.createElement(l_Focusable_0[v22], {
                        AnchorPoint = Vector2.new(1, 0.5), 
                        Size = UDim2.new(0, 28, 1, 0), 
                        Position = UDim2.new(1, 0, 0.5, 0), 
                        BackgroundTransparency = 1, 
                        Visible = l_clearButtonVisible_0, 
                        [v14.Event.Activated] = v127.onClearText, 
                        [v14.Ref] = v127.clearRef, 
                        NextSelectionLeft = v127.searchBoxRef, 
                        NextSelectionDown = if #v152 > 0 then v127.listPickerRef else if v145 then v127.searchBoxRef else nil, 
                        NextSelectionRight = (v146 or l_isCompactView_0) and v127.cancelRef or nil, 
                        SelectionImageObject = v128(l_CursorKind_0.RoundedRectNoInset)
                    }, {
                        ClearImage = v14.createElement(l_ImageSetLabel_0, {
                            AnchorPoint = Vector2.new(1, 0.5), 
                            Size = UDim2.new(0, 16, 0, 16), 
                            Position = UDim2.new(1, -6, 0.5, 0), 
                            Image = v54, 
                            ImageColor3 = v149.Theme.SystemPrimaryDefault.Color, 
                            ImageTransparency = v149.Theme.SystemPrimaryDefault.Transparency, 
                            BackgroundTransparency = 1
                        })
                    })
                })
            }), 
            CancelButton = v146 and v14.createElement(l_Focusable_0.TextButton, {
                Size = UDim2.new(0, 0, 0, v134), 
                AutomaticSize = Enum.AutomaticSize.X, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Text = v129.cancelButtonText, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                Font = v149.Font.Body.Font, 
                TextSize = v149.Font.BaseSize * v149.Font.Body.RelativeSize, 
                TextColor3 = v149.Theme.SystemPrimaryDefault.Color, 
                TextTransparency = v149.Theme.SystemPrimaryDefault.Transparency, 
                LayoutOrder = 2, 
                [v14.Event.Activated] = v127.onCancelButtonActivated, 
                [v14.Ref] = v127.cancelRef, 
                NextSelectionLeft = not not l_clearButtonVisible_0 and v127.clearRef or v127.searchBoxRef, 
                NextSelectionDown = if #v152 > 0 then v127.listPickerRef else nil, 
                NextSelectionRight = v127.cancelRef, 
                SelectionImageObject = v128(l_CursorKind_0.RoundedRectNoInset)
            }, {
                Padding = v14.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 7), 
                    PaddingLeft = UDim.new(0, 7), 
                    PaddingTop = UDim.new(0, 7), 
                    PaddingBottom = UDim.new(0, 7)
                })
            })
        });
        local v154 = v145 and v14.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 0), 
            Position = UDim2.new(0, 0, 1, 0), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Picker = v14.createElement(v24.FitFrame, {
                Size = UDim2.new(1, 0, 0, 0), 
                fitAxis = v24.FitAxis.Height, 
                BorderSizePixel = 0
            }, {
                SearchBarListPicker = v14.createElement(l_Focusable_0[v23], {
                    items = v152, 
                    width = v144, 
                    height = if l_isCompactView_0 then nil else 540, 
                    [v14.Ref] = v127.listPickerRef, 
                    NextSelectionUp = v127.searchBoxRef, 
                    inputBindings = {
                        CancelSearch = v15.Input.onBegin(Enum.KeyCode.ButtonB, v127.doCancelSearch)
                    }
                })
            })
        });
        local v155 = v154 and not l_isCompactView_0;
        if v49() then
            v155 = v154 and (not l_isCompactView_0 or v127.props.searchType == v20.SearchTypes.Catalog);
        end;
        return v14.createElement("Frame", {
            Position = v127.props.position or nil, 
            AnchorPoint = v127.props.anchorPoint or nil, 
            Size = l_Size_0, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0
        }, {
            Shadow = v155 and v14.createElement(l_ImageSetLabel_0, {
                AnchorPoint = Vector2.new(0.5, 0), 
                Position = UDim2.new(0.5, 0, 0, -19), 
                Size = UDim2.new(1, 28 + v135 * 2, 1, (((l_Size_0.Y.Offset + 540) + 28) + 5) + 12), 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                ZIndex = -1, 
                Image = l_Images_0["component_assets/dropshadow_16_20"], 
                ScaleType = Enum.ScaleType.Slice, 
                SliceCenter = Rect.new(28, 28, 29, 29), 
                ImageColor3 = v149.Theme.DropShadow.Color, 
                ImageTransparency = v149.Theme.DropShadow.Transparency
            }, {
                Background = v14.createElement("Frame", {
                    Position = UDim2.new(0, 14, 0, 14), 
                    Size = UDim2.new(1, -28, 1, -28), 
                    BorderSizePixel = 0, 
                    BackgroundColor3 = v149.Theme.BackgroundDefault.Color, 
                    BackgroundTransparency = v149.Theme.BackgroundDefault.Transparency
                }, {
                    UICorner = v14.createElement("UICorner", {
                        CornerRadius = UDim.new(0, 14)
                    })
                })
            }), 
            Bar = v153, 
            Picker = v154, 
            LastInputChangedListener = v14.createElement(l_ExternalEventConnection_0, {
                event = l_UserInputService_0.LastInputTypeChanged, 
                callback = function(v156)
                    v127:setState({
                        lastInputType = v156
                    });
                end
            })
        });
    end);
end;
v60.render = function(v157)
    return l_withSelectionCursorProvider_0(function(v158)
        return l_withLocalization_0({
            cancelButtonText = "Feature.GamePage.LabelCancelField"
        })(function(v159)
            return v157:renderWithProviders(v158, v159);
        end);
    end);
end;
v60 = v17.connect(function(v160, v161)
    return {
        gameIcons = v160[l_GameIconReducer_0.key], 
        autocompleteSuggestions = v160.AutocompleteSuggestions, 
        avatarAutocompleteSuggestions = v160.AvatarExperience.AvatarAutocompleteSuggestions, 
        currentPage = v39(v160), 
        getAutocompleteFetchingStatus = function(v162)
            return v25.GetFetchingStatus(v160, v162, v161.searchType);
        end
    };
end, function(v163)
    return {
        fetchAutocompleteSuggestion = function(v164, v165, v166, v167)
            v163(v25.Fetch(v164, v165, v166, v167));
        end, 
        fetchGameIcons = function(v168, v169)
            v163(l_ApiFetchGameIcons_0(v168, v169));
        end, 
        setSearchBarFocused = function(v170)
            return v163(v27(v170));
        end
    };
end)(v60);
if v47() then
    v60 = v41.connectUserLayer({
        v42.SearchAutocompleteLayer
    }, function(v171, _)
        local v173 = v171[v42.SearchAutocompleteLayer] or {};
        return {
            autocompleteIXPConfigTbl = v173, 
            ixpDisableGamesAutocomplete = v173.ixpDisableGamesAutocomplete == "true"
        };
    end)(v60);
end;
v60 = l_RoactServices_0.connect({
    networking = v32, 
    eventIngest = v40, 
    sessionService = l_AppSessionService_0
})(v60);
return v14.forwardRef(function(v174, v175)
    return v14.createElement(v60, v7.Dictionary.join(v174, {
        forwardRef = v175
    }));
end);
