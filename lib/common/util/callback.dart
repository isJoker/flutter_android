/// 执行某个动作的回调，true：成功 false：失败
typedef ActionCallback = Function(bool success);

/// 执行某个动作的回调，true：成功 false：失败
typedef LoadMoreCallback = Function(bool loadSuccess, bool noMore);
