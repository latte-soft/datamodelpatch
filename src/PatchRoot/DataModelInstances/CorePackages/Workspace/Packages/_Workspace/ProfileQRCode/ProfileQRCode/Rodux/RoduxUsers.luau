local l_script_FirstAncestor_0 = script:FindFirstAncestor("ProfileQRCode");
return require(l_script_FirstAncestor_0.Parent.LuaSocialLibrariesDeps).RoduxUsers.config({
    keyPath = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY .. ".Users"
});
