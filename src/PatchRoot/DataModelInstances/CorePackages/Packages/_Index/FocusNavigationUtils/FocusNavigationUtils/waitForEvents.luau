return function()
    task.defer(coroutine.running());
    coroutine.yield();
end;
