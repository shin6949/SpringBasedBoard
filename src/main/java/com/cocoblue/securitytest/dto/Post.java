package com.cocoblue.securitytest.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Post {
    private long id;
    private String title;
    private String content;
    private long writerId;
    private LocalDateTime writeTime;
    private String writeTimeString;
    private long boardId;
    private long viewNumber;
    private String writerName;
    private String boardName;
}
