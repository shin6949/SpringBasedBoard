package com.cocoblue.securitytest.service;

import com.cocoblue.securitytest.dto.LikePost;

public interface LikePostService {
    long getLikeCount(String postId);
    boolean judgeAlreadyLike(String postId, String memberId);
    boolean insertLikePost(LikePost likePost);
}
