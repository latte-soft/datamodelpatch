local l_Parent_0 = script.Parent.Parent;
return {
    projects = {
        require(l_Parent_0.PhoneUpsell)["jest.config"], 
        require(l_Parent_0.AmpUpsell)["jest.config"]
    }
};
