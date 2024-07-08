local l_script_FirstAncestor_0 = script:FindFirstAncestor("ContactsToast");
return require(l_script_FirstAncestor_0.Parent.RoduxUsers).config({
    keyPath = require(l_script_FirstAncestor_0.Common.Constants).RODUX_KEY .. ".Users"
});
