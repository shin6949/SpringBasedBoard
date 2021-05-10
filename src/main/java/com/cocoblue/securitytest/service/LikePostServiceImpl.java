package com.cocoblue.securitytest.service;

import com.cocoblue.securitytest.dao.LikePostDao;
import com.cocoblue.securitytest.dto.LikePost;

public class LikePostServiceImpl implements LikePostService {
    private final LikePostDao likePostDao;

    public LikePostServiceImpl(LikePostDao likePostDao) {
        this.likePostDao = likePostDao;
    }

    // TODO: 작성 필요
    @Override
    public long getLikeCount(String postId) {
        return 0;
    }

    @Override
    public boolean judgeAlreadyLike(String postId, String memberId) {
        return false;
    }

    @Override
    public boolean insertLikePost(LikePost likePost) {
        return false;
    }
}
