local l_script_FirstAncestor_0 = script:FindFirstAncestor("EditProfile");
local v1 = require(l_script_FirstAncestor_0.Parent.Dev.SocialTestHelpers);
local l_findElementWithAssert_0 = v1.TestHelpers.findElementWithAssert;
return {
    findTopBarTitle = l_findElementWithAssert_0({
        Text = require(l_script_FirstAncestor_0.Common.TextKeys).Title
    }), 
    findTopBar = l_findElementWithAssert_0({
        Name = "TopBar"
    }), 
    findBackButton = l_findElementWithAssert_0(v1.TestHelpers.findImageSet("icons/navigation/pushBack"))
};
