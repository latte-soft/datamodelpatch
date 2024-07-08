local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfilePlatform");
local l_Parent_0 = l_script_FirstAncestor_0.Parent;
local v2 = require(l_Parent_0.LuaSocialLibrariesDeps);
local l_useNavigationProps_0 = require(l_Parent_0.RobloxAppNavigation).useNavigationProps;
local l_getDeepValue_0 = v2.SocialLibraries.config({}).Dictionary.getDeepValue;
local v5 = require(l_Parent_0.React);
local v6 = require(l_Parent_0.RoactUtils);
local v7 = require(l_script_FirstAncestor_0.Common.Constants);
local l_useSelector_0 = v6.Hooks.RoactRodux.useSelector;
local l_useDispatch_0 = v6.Hooks.RoactRodux.useDispatch;
local l_useEffectOnMount_0 = v6.Hooks.useEffectOnMount;
local v11 = require(script.Parent.parseComponentsFromJson);
local v12 = require(l_script_FirstAncestor_0.Common.DefaultComponents);
local v13 = require(l_script_FirstAncestor_0.Networking.getProfilePlatform);
return function(_)
    local v17 = tostring(l_useNavigationProps_0(function(v15, _)
        return {
            profileUserId = v15
        };
    end).profileUserId);
    local v18 = l_useDispatch_0();
    local v20 = l_useSelector_0(function(v19)
        return l_getDeepValue_0(v19, v7.RODUX_KEY .. ".Users." .. v17) or {};
    end);
    l_useEffectOnMount_0(function()
        v18(v13.API({
            profileId = v17, 
            profileType = "User", 
            components = v12
        })):andThen(function(_)
        end):catch(function(_)
        end);
    end);
    return v5.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundTransparency = 1
    }, {
        (v5.useMemo(function()
            return v11(v20.components, v20.componentOrdering);
        end, {
            v20
        }))
    });
end;
