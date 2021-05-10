package com.cocoblue.securitytest.service;

import com.cocoblue.securitytest.dao.LikePostDao;
import com.cocoblue.securitytest.dto.LikePost;
import org.jetbrains.annotations.NotNull;

public class LikePostServiceImpl implements LikePostService {
    private final LikePostDao likePostDao;

    public LikePostServiceImpl(LikePostDao likePostDao) {
        this.likePostDao = likePostDao;
    }

    @Override
    public long getLikeCount(String postId) {
        return likePostDao.getLikeCount(postId);
    }

    @Override
    public boolean judgeAlreadyLike(String postId, String memberId) {
        return likePostDao.judgeAlreadyLike(postId, memberId);
    }

    @Override
    public boolean insertLikePost(@NotNull LikePost likePost) {
        return insertLikePost(likePost);
    }
}
