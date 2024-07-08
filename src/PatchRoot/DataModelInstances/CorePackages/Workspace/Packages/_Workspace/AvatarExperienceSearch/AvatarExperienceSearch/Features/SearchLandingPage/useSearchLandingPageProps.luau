local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarExperienceSearch");
local v1 = require(l_script_FirstAncestor_0.Parent.React);
local v2 = require(l_script_FirstAncestor_0.Utils.debounce);
local v3 = require(l_script_FirstAncestor_0.Utils.RecentSearchTermsAppStorage);
local v4 = require(l_script_FirstAncestor_0.Enums.SuggestedItemTypeEnum);
local _ = require(l_script_FirstAncestor_0.Components.SuggestedItemList);
local _ = require(l_script_FirstAncestor_0.Components.SuggestedItem);
local v7 = require(l_script_FirstAncestor_0.Flags.GetFIntAXMaxRecentSearchTerms);
local _ = require(script.Parent.SearchLandingPage);
local function v16(v9, v10, v11)
    local v12 = v3.findTermsForQuery(v9);
    local v13 = {};
    for _, v15 in v12, nil, nil do
        table.insert(v13, {
            text = v15, 
            type = v4.Recent, 
            onActivate = function()
                v10(v15);
            end, 
            onRemove = function()
                v11(v15);
            end
        });
    end;
    return v13;
end;
local function v23(v17, v18)
    local v19 = v18[v17];
    if v19 and v19.entries then
        local v20 = {};
        for _, v22 in v19.entries, nil, nil do
            table.insert(v20, v22.searchQuery);
        end;
        return v20;
    else
        return {};
    end;
end;
local function v31(v24, v25, v26)
    local v27 = v23(v24, v25);
    local v28 = {};
    for _, v30 in v27, nil, nil do
        table.insert(v28, {
            text = v30, 
            type = v4.Autocomplete, 
            onActivate = function()
                v26(v30);
            end
        });
    end;
    return v28;
end;
local v34 = v2(function(v32, v33)
    if v33 then
        v33(v32);
    end;
end);
return function(v35)
    local v36, v37 = v1.useState(v3.getTerms());
    local v38, v39 = v1.useState("");
    local v41 = v1.useCallback(function(v40)
        v37(v3.removeTerm(v40));
    end, {});
    local v43 = v1.useCallback(function(v42)
        v39(v42);
        v34(v42, v35.fetchAutocompleteSuggestions);
    end, {
        v35.fetchAutocompleteSuggestions
    });
    local v45 = v1.useCallback(function(v44)
        v3.addTerm(v44);
        v35.navigateToSearch(v44);
    end, {
        v35.navigateToSearch
    });
    return {
        items = v1.useMemo(function()
            local v46 = v16(v38, v45, v41);
            local v47 = if not v35.autocompleteState then {} else v31(v38, v35.autocompleteState, v45);
            local v48 = {};
            for _, v50 in v46, nil, nil do
                table.insert(v48, v50);
            end;
            for _, v52 in v47, nil, nil do
                if v7() > #v48 then
                    table.insert(v48, v52);
                else
                    break;
                end;
            end;
            return v48;
        end, {
            v38, 
            v36, 
            v35.autocompleteState, 
            v45, 
            v41
        }), 
        query = v38, 
        onCancelSearch = v35.onCancelSearch, 
        onChangeSearchQuery = v43, 
        onSubmitSearch = v45
    };
end;
