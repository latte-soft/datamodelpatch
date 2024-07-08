local v0 = require(script.Parent.utils.makeDefaultReadPolicy);
return {
    keyFields = {
        "pageType"
    }, 
    fields = {
        sorts = {
            merge = if not require(script.Parent.Parent.Flags).GetFFlagEnableMergeOmniFeedSorts() then nil else require(script.Parent.utils.makeMergeOverlappingArraysPolicy)("topicId")
        }, 
        nextPageToken = {
            read = v0("")
        }, 
        globalLayoutData = {
            read = v0({})
        }
    }
};
