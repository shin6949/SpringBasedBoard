package com.cocoblue.securitytest.service;

import com.cocoblue.securitytest.dto.Comment;
import com.cocoblue.securitytest.dto.Post;

import java.util.List;

public interface PostService {
    public List<Post> getPostsAll(String boardName);
    public Post getPost(String id);
    public List<Comment> getComments(String post_id);
    public Boolean writePost(Post post);
    public void increaseViewNum(String post_id);
}