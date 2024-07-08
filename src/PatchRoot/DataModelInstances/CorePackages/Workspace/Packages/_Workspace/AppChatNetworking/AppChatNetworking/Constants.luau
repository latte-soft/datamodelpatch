return {
    PageSize = {
        GET_NEW_MESSAGES = 4, 
        GET_CONVERSATIONS = game:DefineFastInt("ChatGetConversationsPageSize", 20)
    }, 
    ResponseStatus = {
        SUCCESS = "success", 
        MODERATED = "moderated"
    }, 
    UnfilteredThreadsModalSequence = "unfiltered_threads_ftux"
};
